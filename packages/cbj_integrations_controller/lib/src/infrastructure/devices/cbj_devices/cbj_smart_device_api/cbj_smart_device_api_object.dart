import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:crclib/crclib.dart';

class CbjDevicesApiObject {
  CbjDevicesApiObject({
    required this.deviceType,
    required this.deviceId,
    required this.cbjDevicesIp,
    required this.cbjDevicesName,
    required this.powerConsumption,
    required this.macAddress,
    this.deviceState = CbjDevicesDeviceState.cantGetState,
    this.deviceDirection = CbjDevicesDeviceDirection.cantGetState,
    this.devicePass = '00000000',
    this.phoneId = '0000',
    this.statusSocket,
    this.log,
    this.port = cbjDevicesTcpPort,
    this.lastShutdownRemainingSecondsValue,
    this.remainingTimeForExecution,
  });

  factory CbjDevicesApiObject.createWithBytes(Datagram datagram) {
    final Uint8List data = datagram.data;

    final List<String> messageBuffer = intListToHex(data);

    final List<String> hexSeparatedLetters = [];

    for (final String hexValue in messageBuffer) {
      for (final element in hexValue.runes) {
        hexSeparatedLetters.add(String.fromCharCode(element));
      }
    }

    if (!isCbjDevicesMessage(data, hexSeparatedLetters) &&
        !isCbjDevicesMessageNew(data, hexSeparatedLetters)) {
      icLogger.w('Not a cbjDevices message arrived to here');
    }

    final CbjDevicesDevicesTypes sDeviceType = getDeviceType(messageBuffer);
    final String deviceId = extractDeviceId(hexSeparatedLetters);
    // final String cbjDevicesIp = extractIpAddr(hexSeparatedLetters);
    final String cbjDevicesIp = datagram.address.address;
    final String cbjDevicesMac = extractMac(hexSeparatedLetters);
    final String powerConsumption =
        extractPowerConsumption(hexSeparatedLetters);

    final String cbjDevicesName = extractDeviceName(data);

    final String getRemaining =
        extractRemainingTimeForExecution(hexSeparatedLetters);
    final String lastShutdownRemainingSecondsValue =
        extractShutdownRemainingSeconds(hexSeparatedLetters);

    if (sDeviceType == CbjDevicesDevicesTypes.cbjDevicesRunner ||
        sDeviceType == CbjDevicesDevicesTypes.cbjDevicesRunnerMini) {
      if (!isCbjDevicesMessageNew(data, hexSeparatedLetters)) {
        icLogger.t('Not new cbjDevices device!');
      }

      final CbjDevicesDeviceDirection cbjDevicesDeviceDirection =
          extractSwitchDirection(hexSeparatedLetters);

      return CbjDevicesApiObject(
        deviceType: sDeviceType,
        deviceId: deviceId,
        cbjDevicesIp: cbjDevicesIp,
        deviceDirection: cbjDevicesDeviceDirection,
        cbjDevicesName: cbjDevicesName,
        macAddress: cbjDevicesMac,
        powerConsumption: powerConsumption,
        port: cbjDevicesTcpPort2,
      );
    }

    if (!isCbjDevicesMessage(data, hexSeparatedLetters)) {
      icLogger.t('Not old cbjDevices device!');
    }

    final CbjDevicesDeviceState cbjDevicesDeviceState =
        extractSwitchState(hexSeparatedLetters);

    return CbjDevicesApiObject(
      deviceType: sDeviceType,
      deviceId: deviceId,
      cbjDevicesIp: cbjDevicesIp,
      deviceState: cbjDevicesDeviceState,
      cbjDevicesName: cbjDevicesName,
      macAddress: cbjDevicesMac,
      lastShutdownRemainingSecondsValue: lastShutdownRemainingSecondsValue,
      powerConsumption: powerConsumption,
      remainingTimeForExecution: getRemaining,
    );
  }

  String deviceId;
  String cbjDevicesIp;
  CbjDevicesDevicesTypes deviceType;
  CbjDevicesDeviceState deviceState;
  CbjDevicesDeviceDirection deviceDirection;
  int port;
  String cbjDevicesName;
  String phoneId;
  String powerConsumption;
  String devicePass;
  String macAddress;
  String? remainingTimeForExecution;
  String? log;
  String? statusSocket;
  String? lastShutdownRemainingSecondsValue;

  Socket? _socket;

  String? pSession;

  static const cbjDevicesTcpPort = 9957;
  static const cbjDevicesTcpPort2 = 10000;

  static const pSessionValue = '00000000';
  static const pKey = '00000000000000000000000000000000';

  static const statusEvent = 'status';
  static const readyEvent = 'ready';
  static const errorEvent = 'error';
  static const stateChangedEvent = 'state';

  static const cbjDevicesUdpIp = '0.0.0.0';
  static const cbjDevicesUdpPort = 20002;

  static const offValue = '0';
  static const onValue = '1';

  static bool isCbjDevicesMessage(
    Uint8List data,
    List<String> hexSeparatedLetters,
  ) {
    // Verify the broadcast message had originated from a cbjDevices device.
    return hexSeparatedLetters.sublist(0, 4).join() == 'fef0' &&
        data.length == 165;
  }

  static bool isCbjDevicesMessageNew(
    Uint8List data,
    List<String> hexSeparatedLetters,
  ) {
    // Verify the broadcast message had originated from a cbjDevices device.
    return hexSeparatedLetters.sublist(0, 4).join() == 'fef0' &&
        data.length == 159;
  }

  static CbjDevicesDevicesTypes getDeviceType(List<String> messageBuffer) {
    CbjDevicesDevicesTypes sDevicesTypes = CbjDevicesDevicesTypes.notRecognized;

    final String hexModel = messageBuffer.sublist(75, 76)[0];

    if (hexModel == '0f') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesMini;
    } else if (hexModel == 'a8') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesPowerPlug;
    } else if (hexModel == '0b') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesTouch;
    } else if (hexModel == 'a7') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesV2Esp;
    } else if (hexModel == 'a1') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesV2qualcomm;
    } else if (hexModel == '17') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesV4;
    } else if (hexModel == '01') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesRunner;
    } else if (hexModel == '02') {
      sDevicesTypes = CbjDevicesDevicesTypes.cbjDevicesRunnerMini;
    } else {
      icLogger.w('New device type? hexModel:$hexModel');
    }

    return sDevicesTypes;
  }

  Future turnOn({int duration = 0}) async {
    final String offCommand = '${onValue}00${_timerValue(duration)}';

    await _runPowerCommand(offCommand);
  }

  Future turnOff() async {
    const String offCommand = '${offValue}0000000000';
    await _runPowerCommand(offCommand);
  }

  Future _runPowerCommand(String commandType) async {
    pSession = await _login();
    if (pSession == 'B') {
      icLogger.e('CbjDevices run power command error');
      return;
    }
    var data =
        'fef05d0002320102${pSession!}340001000000000000000000${_getTimeStamp()}'
        '00000000000000000000f0fe${deviceId}00${phoneId}0000$devicePass'
        '000000000000000000000000000000000000000000000000000000000106000'
        '$commandType';

    data = await _crcSignFullPacketComKey(data, pKey);

    _socket = await getSocket();
    _socket!.add(hexStringToDecimalList(data));
    await _socket?.close();
    _socket = null;
  }

  /// Stops the blinds
  Future stopBlinds() async {
    if (deviceType != CbjDevicesDevicesTypes.cbjDevicesRunner &&
        deviceType != CbjDevicesDevicesTypes.cbjDevicesRunnerMini) {
      icLogger.t('Stop blinds support only for blinds');
      return;
    }

    pSession = await _login2();
    if (pSession == 'B') {
      icLogger.e('CbjDevices run position command error');
      return;
    }
    var data =
        'fef0590003050102${pSession!}232301000000000000000000${_getTimeStamp()}'
        '00000000000000000000f0fe${deviceId}00${phoneId}0000$devicePass'
        '000000000000000000000000000000000000000000000000000000370202000000';

    data = await _crcSignFullPacketComKey(data, pKey);

    _socket = await getSocket();
    _socket!.add(hexStringToDecimalList(data));
    await _socket?.close();
    _socket = null;
  }

  /// Sets the position of the blinds, 0 is down 100 is up
  Future setPosition({int pos = 0}) async {
    if (deviceType != CbjDevicesDevicesTypes.cbjDevicesRunner &&
        deviceType != CbjDevicesDevicesTypes.cbjDevicesRunnerMini) {
      icLogger.t('Set position support only blinds');
      return;
    }

    final String positionCommand = _getHexPos(pos: pos);
    _runPositionCommand(positionCommand);
  }

  String _getHexPos({int pos = 0}) {
    String posAsHex = intListToHex([pos]).join();
    if (posAsHex.length < 2) {
      posAsHex = '0$posAsHex';
    }
    return posAsHex;
  }

  Future _runPositionCommand(String positionCommand) async {
    // final int pos = int.parse(positionCommand, radix: 16);
    pSession = await _login2();
    if (pSession == 'B') {
      icLogger.e('CbjDevices run position command error');
      return;
    }
    var data =
        'fef0580003050102${pSession!}290401000000000000000000${_getTimeStamp()}'
        '00000000000000000000f0fe${deviceId}00${phoneId}0000$devicePass'
        '00000000000000000000000000000000000000000000000000000037010100'
        '$positionCommand';

    data = await _crcSignFullPacketComKey(data, pKey);

    _socket = await getSocket();
    _socket!.add(hexStringToDecimalList(data));
    await _socket?.close();
    _socket = null;
  }

  /// Used for sending actions to the device
  void sendState({required CbjDevicesDeviceState command, int minutes = 0}) {
    _getFullState();
  }

  /// Used for sending the get state packet to the device.
  /// Returns a tuple of hex timestamp,
  /// session id and an instance of CbjDevicesStateResponse
  Future<String> _getFullState() async {
    return _login();
  }

  /// Used for sending the login packet to the device.
  Future<String> _login() async {
    try {
      String data = 'fef052000232a100${pSessionValue}340001000000000000000000'
          '${_getTimeStamp()}00000000000000000000f0fe1c00${phoneId}0000'
          '$devicePass'
          '00000000000000000000000000000000000000000000000000000000';

      data = await _crcSignFullPacketComKey(data, pKey);
      _socket = await getSocket();
      if (_socket == null) {
        throw 'Error';
      }

      _socket!.add(hexStringToDecimalList(data));

      final Uint8List firstData = await _socket!.first;
      final String resultSession =
          substrLikeInJavaScript(intListToHex(firstData).join(), 16, 8);

      return resultSession;
    } catch (error) {
      icLogger.e('Cbj smart device login failed due to an error\n$error');
      pSession = 'B';
    }
    return pSession!;
  }

  /// Used for sending the login packet to cbjDevices runner.
  Future<String> _login2() async {
    // if (pSession != null) return pSession!;

    try {
      String data = 'fef030000305a600${pSessionValue}ff0301000000$phoneId'
          '00000000${_getTimeStamp()}00000000000000000000f0fe${deviceId}00';

      data = await _crcSignFullPacketComKey(data, pKey);
      _socket = await getSocket();
      if (_socket == null) {
        throw 'Error';
      }

      _socket!.add(hexStringToDecimalList(data));

      final Uint8List firstData = await _socket!.first;

      final String resultSession =
          substrLikeInJavaScript(intListToHex(firstData).join(), 16, 8);

      return resultSession;
    } catch (error) {
      icLogger.e('login2 failed due to an error\n$error');
      pSession = 'B';
    }
    return pSession!;
  }

  static Future<String> _crcSignFullPacketComKey(
    String pData,
    String pKey,
  ) async {
    String pDataTemp = pData;
    final List<int> bufferHex = hexStringToDecimalList(pDataTemp);

    String crc = intListToHex(
      packBigEndian(
        int.parse(Crc16XmodemWith0x1021().convert(bufferHex).toString()),
      ),
    ).join();

    pDataTemp = pDataTemp +
        substrLikeInJavaScript(crc, 6, 2) +
        substrLikeInJavaScript(crc, 4, 2);

    crc = substrLikeInJavaScript(crc, 6, 2) +
        substrLikeInJavaScript(crc, 4, 2) +
        getUtf8Encoded(pKey);

    crc = intListToHex(
      packBigEndian(
        int.parse(
          Crc16XmodemWith0x1021()
              .convert(hexStringToDecimalList(crc))
              .toString(),
        ),
      ),
    ).join();

    return pDataTemp +
        substrLikeInJavaScript(crc, 6, 2) +
        substrLikeInJavaScript(crc, 4, 2);
  }

  static String _getTimeStamp() {
    final int timeInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final List<int> timeInBytes = packLittleEndian(timeInSeconds);

    return intListToHex(timeInBytes).join();
  }

  /// Same as Buffer.from(value, 'hex') in JavaScript
  static List<int> hexStringToDecimalList(String hex) {
    final List<int> decimalIntList = [];
    String twoNumbers = '';

    for (int i = 0; i < hex.length; i++) {
      if (twoNumbers == '') {
        twoNumbers = twoNumbers + hex[i];
        continue;
      } else {
        twoNumbers = twoNumbers + hex[i];
        decimalIntList.add(int.parse(twoNumbers, radix: 16));
        twoNumbers = '';
      }
    }
    return decimalIntList;
  }

  /// Convert number to unsigned integer as little-endian sequence of bytes
  /// Same as struct.pack('<I', value) in JavaScript
  static List<int> packLittleEndian(int valueToConvert) {
    final ByteData sendValueBytes = ByteData(8);

    try {
      sendValueBytes.setUint64(0, valueToConvert, Endian.little);
    } on Exception {
      sendValueBytes.setUint32(0, valueToConvert, Endian.little);
    }

    final Uint8List timeInBytes = sendValueBytes.buffer.asUint8List();
    return timeInBytes.sublist(0, timeInBytes.length - 4);
  }

  /// Convert number to unsigned integer as big-endian sequence of bytes
  /// Same as struct.pack('>I', value) in JavaScript
  static List<int> packBigEndian(int valueToConvert) {
    final ByteData sendValueBytes = ByteData(8);

    try {
      sendValueBytes.setUint64(0, valueToConvert);
    } on Exception {
      sendValueBytes.setUint32(0, valueToConvert);
    }

    final Uint8List timeInBytes = sendValueBytes.buffer.asUint8List();
    return timeInBytes.sublist(4);
  }

  /// Convert list of bytes/integers into their hex 16 value with padding 2 of 0
  /// Same as .toString('hex'); in JavaScript
  static List<String> intListToHex(List<int> bytes) {
    final List<String> messageBuffer = [];

    for (final int unit8 in bytes) {
      messageBuffer.add(unit8.toRadixString(16).padLeft(2, '0'));
    }
    return messageBuffer;
  }

  /// Generate hexadecimal representation of the current timestamp.
  /// Return: Hexadecimal representation of the current
  /// unix time retrieved by ``time.time``.
  String currentTimestampToHexadecimal() {
    final String currentTimeSinceEpoch =
        DateTime.now().millisecondsSinceEpoch.toString();
    final String currentTimeRounded =
        currentTimeSinceEpoch.substring(0, currentTimeSinceEpoch.length - 3);

    final int currentTimeInt = int.parse(currentTimeRounded);

    return currentTimeInt.toRadixString(16).padLeft(2, '0');
  }

  /// Extract the IP address from the broadcast message.
  static String extractIpAddr(List<String> hexSeparatedLetters) {
    final String ipAddrSection =
        substrLikeInJavaScript(hexSeparatedLetters.join(), 152, 8);

    final int ipAddrInt = int.parse(
      substrLikeInJavaScript(ipAddrSection, 0, 2) +
          substrLikeInJavaScript(ipAddrSection, 2, 2) +
          substrLikeInJavaScript(ipAddrSection, 4, 2) +
          substrLikeInJavaScript(ipAddrSection, 6, 2),
      radix: 16,
    );
    return ipAddrInt.toString();
  }

  static String extractPowerConsumption(List<String> hexSeparatedLetters) {
    // final List<String> hexPowerConsumption =
    //     hexSeparatedLetters.sublist(270, 278);
    // TODO: fix this method does not return number, hexPowerConsumption.join()
    //  return the value 64000000
    // return hexPowerConsumption.join();
    return '0';
  }

  /// Extract the time remains for the current execution.
  static String extractRemainingTimeForExecution(
    List<String> hexSeparatedLetters,
  ) {
    final List<String> hexPowerConsumption =
        hexSeparatedLetters.sublist(294, 302);
    try {
      final int sum = int.parse(hexPowerConsumption.sublist(6, 8).join()) +
          int.parse(hexPowerConsumption.sublist(4, 6).join()) +
          int.parse(hexPowerConsumption.sublist(2, 4).join()) +
          int.parse(hexPowerConsumption.sublist(0, 2).join());
      return sum.toString();
    } catch (e) {
      return hexPowerConsumption.join();
    }
  }

  /// Substring like in JavaScript
  /// If first index is bigger than second index than it will cut until the
  /// first and will get the second index number of characters from there
  static String substrLikeInJavaScript(
    String text,
    int firstIndex,
    int secondIndex,
  ) {
    String tempText = text;
    if (firstIndex > secondIndex) {
      tempText = tempText.substring(firstIndex);
      tempText = tempText.substring(0, secondIndex);
    } else {
      tempText = tempText.substring(firstIndex, secondIndex);
    }
    return tempText;
  }

  static String extractMac(List<String> hexSeparatedLetters) {
    final String macNoColon =
        hexSeparatedLetters.sublist(160, 172).join().toUpperCase();
    final String macAddress = '${macNoColon.substring(0, 2)}:'
        '${macNoColon.substring(2, 4)}:${macNoColon.substring(4, 6)}:'
        '${macNoColon.substring(6, 8)}:${macNoColon.substring(8, 10)}:'
        '${macNoColon.substring(10, 12)}';

    return macAddress;
  }

  static String extractDeviceName(List<int> data) {
    return utf8.decode(data.sublist(42, 74)).replaceAll('\u0000', '');
    // Maybe better name handling will be
    // this.data_str.substr(38, 32).replace(/[^0-9a-zA-Z_\s]/g, '').replace(/\0/g, '')
  }

  /// Same as Buffer.from(value) in javascript
  /// Not to be confused with Buffer.from(value, 'hex')
  static String getUtf8Encoded(String list) {
    final List<int> encoded = utf8.encode(list);

    return intListToHex(encoded).join();
  }

  static String extractShutdownRemainingSeconds(
    List<String> hexSeparatedLetters,
  ) {
    // final String hexAutoShutdownVal =
    //     hexSeparatedLetters.sublist(310, 318).join();
    final String timeLeftSeconds =
        substrLikeInJavaScript(hexSeparatedLetters.join(), 294, 8);

    return int.parse(
      substrLikeInJavaScript(timeLeftSeconds, 6, 8) +
          substrLikeInJavaScript(timeLeftSeconds, 4, 6) +
          substrLikeInJavaScript(timeLeftSeconds, 2, 4) +
          substrLikeInJavaScript(timeLeftSeconds, 0, 2),
      radix: 16,
    ).toString();
  }

  static String extractDeviceId(List<String> hexSeparatedLetters) {
    return hexSeparatedLetters.sublist(36, 42).join();
  }

  static CbjDevicesDeviceState extractSwitchState(
    List<String> hexSeparatedLetters,
  ) {
    CbjDevicesDeviceState cbjDevicesDeviceState =
        CbjDevicesDeviceState.cantGetState;

    final String hexModel =
        substrLikeInJavaScript(hexSeparatedLetters.join(), 266, 4);

    if (hexModel == '0100') {
      cbjDevicesDeviceState = CbjDevicesDeviceState.on;
    } else if (hexModel == '0000') {
      cbjDevicesDeviceState = CbjDevicesDeviceState.off;
    } else {
      icLogger.w('CbjDevices state is not recognized: $hexModel');
    }
    return cbjDevicesDeviceState;
  }

  static CbjDevicesDeviceDirection extractSwitchDirection(
    List<String> hexSeparatedLetters,
  ) {
    CbjDevicesDeviceDirection cbjDevicesDeviceState =
        CbjDevicesDeviceDirection.cantGetState;

    final String hexModel =
        substrLikeInJavaScript(hexSeparatedLetters.join(), 274, 4);

    if (hexModel == '0000') {
      cbjDevicesDeviceState = CbjDevicesDeviceDirection.stop;
    } else if (hexModel == '0100') {
      cbjDevicesDeviceState = CbjDevicesDeviceDirection.up;
    } else if (hexModel == '0001') {
      cbjDevicesDeviceState = CbjDevicesDeviceDirection.down;
    } else {
      icLogger.w('CbjDevices direction is not recognized: $hexModel');
    }
    return cbjDevicesDeviceState;
  }

  Future<Socket> getSocket() async {
    if (_socket != null) {
      return _socket!;
    }

    try {
      final Socket socket = await _connect(cbjDevicesIp, port);
      return socket;
    } catch (e) {
      _socket = null;
      icLogger.e('Error connecting to socket for cbjDevices device: $e');
      rethrow;
    }
  }

  Future<Socket> _connect(String ip, int port) async {
    return Socket.connect(ip, port);
  }

  String _timerValue(int minutes) {
    if (minutes == 0) {
      // when duration set to zero, CbjDevices sends regular on command
      return '00000000';
    }
    final seconds = minutes * 60;
    return intListToHex(packLittleEndian(seconds)).join();
  }
}

class Crc16XmodemWith0x1021 extends ParametricCrc {
  Crc16XmodemWith0x1021()
      : super(
          16,
          0x1021,
          0x1021,
          0x0000,
          inputReflected: false,
          outputReflected: false,
        );
}

enum CbjDevicesDeviceDirection {
  cantGetState,
  stop, // '0000'
  up, // '0100'
  down, // '0001'
}

/// Enum class representing the device's state.
enum CbjDevicesDeviceState {
  cantGetState,
  on, // '0100'
  off, // '0000'
}

/// Enum for relaying the type of the cbjDevices devices.
enum CbjDevicesDevicesTypes {
  notRecognized,
  cbjDevicesMini, // MINI = "CbjDevices Mini", "0f", DeviceCategory.WATER_HEATER
  cbjDevicesPowerPlug, // POWER_PLUG = "CbjDevices Power Plug", "a8", DeviceCategory.POWER_PLUG
  cbjDevicesTouch, // TOUCH = "CbjDevices Touch", "0b", DeviceCategory.WATER_HEATER
  cbjDevicesV2Esp, // V2_ESP = "CbjDevices V2 (esp)", "a7", DeviceCategory.WATER_HEATER
  cbjDevicesV2qualcomm, // V2_QCA = "CbjDevices V2 (qualcomm)", "a1", DeviceCategory.WATER_HEATER
  cbjDevicesV4, // V4 = "CbjDevices V4", "17", DeviceCategory.WATER_HEATER
  cbjDevicesRunner, // runner = "CbjDevices Runner", "01", DeviceCategory.Blinds
  cbjDevicesRunnerMini, // runner_mini = "CbjDevices Runner Mini", "02", DeviceCategory.Blinds
}
