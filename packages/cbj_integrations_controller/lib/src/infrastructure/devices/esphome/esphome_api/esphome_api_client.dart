import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/esphome/esphome_api/esphome_objects_as_dart_objects.dart';

/// Client to interact with ESPHome device
/// TODO: All the code here need rewrite, manage to turn device on/off
/// TODO: Source: https://github.com/esphome/aioesphomeapi
class EspHomeApiClient {
  EspHomeApiClient({
    this.devicePort = 6053,
    this.devicePass,
  });

  Socket? _fSocket;
  String? devicePass;
  String? addressOfServer;
  late String deviceMdns;
  int devicePort;

  /// Responses stream from the device.
  /// Some responses come in chunks, this will help us with that.
  /// Each response will be converted to dart object and get passed away in
  /// the stream for the current listening function to decide if it part of their
  /// request and stop listening.
  /// Some request will just keep coming like ping request and button press.
  StreamController deviceResponseStream = StreamController();

  /// aioesphomeapi:
  /// fName = _connect_socket_connect
  /// Step 2 in connect process: connect the socket.
  Future<Socket> getSocket() async {
    if (_fSocket != null && _fSocket!.isBroadcast) {
      return _fSocket!;
    }
    addressOfServer ??= await getIpFromMdns('$deviceMdns.local');
    // TODO: Test if it is possible to connect to socket using the deviceMdns
    // TODO: instead of the address, suppose to be more consistent.

    return _fSocket = await Socket.connect(addressOfServer, devicePort);
  }

  Future listenToResponses() async {
    final Socket socket = await getSocket();

    socket.listen(
      // handle data from the server
      (Uint8List data) {
        final int responseType = data[2];

        /// HelloRequest
        if (responseType == 1) {
          icLogger.t('responseType is HelloRequest');
        }

        /// HelloResponse
        else if (responseType == 2) {
          icLogger.t('responseType is HelloResponse');
          final HelloResponse? helloResponseData = bytesToHelloResponse(data);
          if (helloResponseData != null) {
            deviceResponseStream.add(
              EspHomeHelloResponseObject(
                apiVersionMajor: helloResponseData.apiVersionMajor,
                apiVersionMinor: helloResponseData.apiVersionMinor,
                serverInfo: helloResponseData.serverInfo,
              ),
            );
          }
          icLogger.t('HelloResponse data: ${helloResponseData?.serverInfo}');
          icLogger.t('');
        }

        /// ConnectRequest
        else if (responseType == 3) {
          icLogger.t('responseType is ConnectRequest');
        }

        /// ConnectResponse
        else if (responseType == 4) {
          icLogger.t('responseType is ConnectResponse');
          icLogger.t(
            'ConnectResponse data: ${utf8.decode(data.sublist(3), allowMalformed: true)}',
          );
          icLogger.t('Data: $data');
          if (data.length > 3) {
            icLogger.t('Password is wrong');
            devicePass = null;
          } else {
            icLogger.t('Correct password');
          }
          icLogger.t('');
        }

        /// DisconnectRequest
        else if (responseType == 5) {
          icLogger.t('responseType is DisconnectRequest');
        }

        /// DisconnectResponse
        else if (responseType == 6) {
          icLogger.t('responseType is DisconnectResponse');
        }

        /// PingRequest
        else if (responseType == 7) {
          icLogger.t('responseType is PingRequest');
          icLogger.t('PingRequest data: ${utf8.decode(data.sublist(3))}');
          icLogger.t('');
        }

        /// PingResponse
        else if (responseType == 8) {
          icLogger.t('responseType is PingResponse');
          icLogger.t('PingResponse data: ${utf8.decode(data.sublist(3))}');
          icLogger.t('');
        }

        /// DeviceInfoRequest
        else if (responseType == 9) {
          icLogger.t('responseType is DeviceInfoRequest');
        }

        /// DeviceInfoResponse
        else if (responseType == 10) {
          icLogger.t('responseType is DeviceInfoResponse');
          icLogger.t('DeviceInfoResponse data: $data');
          icLogger.t('');
        }

        /// ListEntitiesRequest
        else if (responseType == 11) {
          icLogger.t('responseType is ListEntitiesRequest');
        }

        /// ListEntitiesBinarySensorResponse
        else if (responseType == 12) {
          icLogger.t('responseType is ListEntitiesBinarySensorResponse');
        }

        /// ListEntitiesCoverResponse
        else if (responseType == 13) {
          icLogger.t('responseType is ListEntitiesCoverResponse');
        }

        /// ListEntitiesFanResponse
        else if (responseType == 14) {
          icLogger.t('responseType is ListEntitiesFanResponse');
        }

        /// ListEntitiesLightResponse
        else if (responseType == 15) {
          icLogger.t('responseType is ListEntitiesLightResponse');
        }

        /// ListEntitiesSensorResponse
        else if (responseType == 16) {
          icLogger.t('responseType is ListEntitiesSensorResponse');
        }

        /// ListEntitiesSwitchResponse
        else if (responseType == 17) {
          icLogger.t('responseType is ListEntitiesSwitchResponse');
          String dataPayload = '';

          try {
            dataPayload = data.length > 3 ? utf8.decode(data.sublist(3)) : '';

            icLogger.t(
              'ListEntitiesSwitchResponse data payload:'
              ' $dataPayload',
            );
          } catch (e) {
            icLogger.t(
              'ListEntitiesSwitchResponse data bytes:'
              ' $data',
            );
          }
          icLogger.t('');
        }

        /// ListEntitiesTextSensorResponse
        else if (responseType == 18) {
          icLogger.t('responseType is ListEntitiesTextSensorResponse');
        }

        /// dsaDoneResponse
        else if (responseType == 19) {
          icLogger.t('responseType is ListEntitiesDoneResponse');
          icLogger.t(
            'ListEntitiesDoneResponse data: ${utf8.decode(data.sublist(3))}',
          );
          icLogger.t('');
        }

        /// SubscribeStatesRequest
        else if (responseType == 20) {
          icLogger.t('responseType is SubscribeStatesRequest');
        }

        /// BinarySensorStateResponse
        else if (responseType == 21) {
          icLogger.t('responseType is BinarySensorStateResponse');
        }

        /// CoverStateResponse
        else if (responseType == 22) {
          icLogger.t('responseType is CoverStateResponse');
        }

        /// FanStateResponse
        else if (responseType == 23) {
          icLogger.t('responseType is FanStateResponse');
        }

        /// LightStateResponse
        else if (responseType == 24) {
          icLogger.t('responseType is LightStateResponse');
        }

        /// SensorStateResponse
        else if (responseType == 25) {
          icLogger.t('responseType is SensorStateResponse');
        }

        /// SwitchStateResponse
        else if (responseType == 26) {
          icLogger.t('responseType is SwitchStateResponse');
          icLogger.t('SwitchStateResponse data: $data}');
          icLogger.t('');
        }

        /// TextSensorStateResponse
        else if (responseType == 27) {
          icLogger.t('responseType is TextSensorStateResponse');
        }

        /// SubscribeLogsRequest
        else if (responseType == 28) {
          icLogger.t('responseType is SubscribeLogsRequest');
        }

        /// SubscribeLogsResponse
        else if (responseType == 29) {
          icLogger.t('responseType is SubscribeLogsResponse');
        }

        /// CoverCommandRequest
        else if (responseType == 30) {
          icLogger.t('responseType is CoverCommandRequest');
        }

        /// FanCommandRequest
        else if (responseType == 31) {
          icLogger.t('responseType is FanCommandRequest');
        }

        /// LightCommandRequest
        else if (responseType == 32) {
          icLogger.t('responseType is LightCommandRequest');
        }

        /// SwitchCommandRequest
        else if (responseType == 33) {
          icLogger.t('responseType is SwitchCommandRequest');
        }

        /// SubscribeHomeassistantServicesRequest
        else if (responseType == 34) {
          icLogger.t('responseType is SubscribeHomeassistantServicesRequest');
        }

        /// HomeassistantServiceResponse
        else if (responseType == 35) {
          icLogger.t('responseType is HomeassistantServiceResponse');
        }

        /// GetTimeRequest
        else if (responseType == 36) {
          icLogger.t('responseType is GetTimeRequest');
        }

        /// GetTimeResponse
        else if (responseType == 37) {
          icLogger.t('responseType is GetTimeResponse');
        }

        /// SubscribeHomeAssistantStatesRequest
        else if (responseType == 38) {
          icLogger.t('responseType is SubscribeHomeAssistantStatesRequest');
        }

        /// SubscribeHomeAssistantStateResponse
        else if (responseType == 39) {
          icLogger.t('responseType is SubscribeHomeAssistantStateResponse');
        }

        /// HomeAssistantStateResponse
        else if (responseType == 40) {
          icLogger.t('responseType is HomeAssistantStateResponse');
        }

        /// ListEntitiesServicesResponse
        else if (responseType == 41) {
          icLogger.t('responseType is ListEntitiesServicesResponse');
        }

        /// ExecuteServiceRequest
        else if (responseType == 42) {
          icLogger.t('responseType is ExecuteServiceRequest');
        }

        /// ListEntitiesCameraResponse
        else if (responseType == 43) {
          icLogger.t('responseType is ListEntitiesCameraResponse');
        }

        /// CameraImageResponse
        else if (responseType == 44) {
          icLogger.t('responseType is CameraImageResponse');
        }

        /// CameraImageRequest
        else if (responseType == 45) {
          icLogger.t('responseType is CameraImageRequest');
        }

        /// ListEntitiesClimateResponse
        else if (responseType == 46) {
          icLogger.t('responseType is ListEntitiesClimateResponse');
        }

        /// ClimateStateResponse
        else if (responseType == 47) {
          icLogger.t('responseType is ClimateStateResponse');
        }

        /// ClimateCommandRequest
        else if (responseType == 48) {
          icLogger.t('responseType is ClimateCommandRequest');
        }

        /// ListEntitiesNumberResponse
        else if (responseType == 49) {
          icLogger.t('responseType is ListEntitiesNumberResponse');
        }

        /// NumberStateResponse
        else if (responseType == 50) {
          icLogger.t('responseType is NumberStateResponse');
        }

        /// NumberCommandRequest
        else if (responseType == 51) {
          icLogger.t('responseType is NumberCommandRequest');
        }

        /// ListEntitiesSelectResponse
        else if (responseType == 52) {
          icLogger.t('responseType is ListEntitiesSelectResponse');
        }

        /// SelectStateResponse
        else if (responseType == 53) {
          icLogger.t('responseType is SelectStateResponse');
        }

        /// SelectCommandRequest
        else if (responseType == 54) {
          icLogger.t('responseType is SelectCommandRequest');
        } else {
          icLogger.t('responseType is else');
          icLogger.t('Listen to data $data');
          icLogger.t('');
        }
      },

      // handle errors
      onError: (error) {
        icLogger.e(error);
        socket.destroy();
      },

      // handle server ending connection
      onDone: () {
        icLogger.t('Server left.');
        socket.destroy();
      },
    );
  }

  Future sendConnect() async {
    final Socket socket = await getSocket();

    await _helloRequestToEsp();

    final ConnectRequest connectRequest =
        ConnectRequest(password: '\n\n$devicePass');

    const int numOfByteBeforeData = 3;

    final List<int> list = utf8.encode(connectRequest.password);

    final int totalSizeToTransfer = numOfByteBeforeData + list.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, list.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 3);

//  * The message object encoded as a ProtoBuf message

    for (int i = numOfByteBeforeData;
        i < list.length + numOfByteBeforeData;
        i++) {
      byteData.setUint8(i, list[i - numOfByteBeforeData]);
    }

    socket.add(message);
  }

  Future disconnect() async {
    await (await getSocket()).close();
  }

  /// aioesphomeapi:
  /// fName = _connect_hello
  /// Step 4 in connect process: send hello and get api version.
  Future _helloRequestToEsp() async {
    // connect to the socket server
    final Socket socket = await getSocket();

    const String clientName = 'aioesphomeapi';

    final HelloRequest helloRequest =
        HelloRequest(clientInfo: '\n\r$clientName');

    const int numOfByteBeforeData = 3;

    final List<int> clientInfoAsIntList = utf8.encode(helloRequest.clientInfo);

    final int totalSizeToTransfer =
        numOfByteBeforeData + clientInfoAsIntList.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, clientInfoAsIntList.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 1);

//  * The message object encoded as a ProtoBuf message

    for (int i = numOfByteBeforeData;
        i < clientInfoAsIntList.length + numOfByteBeforeData;
        i++) {
      byteData.setUint8(i, clientInfoAsIntList[i - numOfByteBeforeData]);
    }

    socket.add(message);
  }

  Future connectRequestToEsp() async {
    // connect to the socket server
    final socket = await getSocket();

    final ConnectRequest connectRequest = ConnectRequest(password: devicePass);

    final List<int> passwordAsIntList = utf8.encode(connectRequest.password);

    const int numOfBytesBeforeData = 3;

    // final List<int> list = utf8.encode(helloRequest.password);

    final int totalSizeToTransfer =
        numOfBytesBeforeData + passwordAsIntList.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, connectRequest.password.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 3);

//  * The message object encoded as a ProtoBuf message
//
    for (int i = numOfBytesBeforeData;
        i < connectRequest.password.length + numOfBytesBeforeData;
        i++) {
      byteData.setUint8(i, passwordAsIntList[i - numOfBytesBeforeData]);
    }

    socket.add(message);
  }

  /// aioesphomeapi:
  /// fName = _connect_start_ping
  /// Step 5 in connect process: start the ping loop.
  Future ping() async {
    // connect to the socket server
    final socket = await getSocket();
    icLogger.t(
      'Connected request to: '
      '${socket.remoteAddress.address}:${socket.remotePort}',
    );

    PingRequest();

    const int numOfByteBeforeData = 3;

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 7);

//  * The message object encoded as a ProtoBuf message

    socket.add(message);
  }

  Future deviceInfoRequestToEsp() async {
    // connect to the socket server
    final socket = await getSocket();
    icLogger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    DeviceInfoRequest();

    const int numOfByteBeforeData = 3;

    // final List<int> list = utf8.encode(helloRequest.toString());

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 9);

    socket.add(message);
  }

  Future subscribeStatesRequest() async {
    // connect to the socket server
    final socket = await getSocket();
    icLogger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    SubscribeStatesRequest();

    const int numOfByteBeforeData = 3;

    // final List<int> list = utf8.encode(helloRequest.toString());

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 20);

    socket.add(message);
  }

  Future switchCommandRequest(int deviceKey, bool changeTostate) async {
    if (devicePass == null) {
      icLogger.t('Please call sendConnect, password is missing');
      return;
    }
    // connect to the socket server
    final socket = await getSocket();
    icLogger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    final SwitchCommandRequest switchCommandRequest =
        SwitchCommandRequest(key: deviceKey, state: changeTostate);

    final String myHexKey =
        switchCommandRequest.key.toRadixString(16).padLeft(4, '0');

    List<int> myHexKeyList = [];

    for (int i = 0; i < myHexKey.length; i += 2) {
      myHexKeyList.add(int.parse('0x${myHexKey.substring(i, i + 2)}'));
    }

    myHexKeyList = List.from(myHexKeyList.reversed);
    myHexKeyList.insert(0, 13);

    if (changeTostate == true) {
      myHexKeyList.add(16);
      myHexKeyList.add(1);
    }

    const int numOfByteBeforeData = 3;

    final int totalSizeToTransfer = numOfByteBeforeData + myHexKeyList.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    icLogger.t(myHexKeyList);

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, myHexKeyList.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 33);

    for (int a = numOfByteBeforeData;
        a < myHexKeyList.length + numOfByteBeforeData;
        a++) {
      byteData.setUint8(a, myHexKeyList[a - numOfByteBeforeData]);
    }

    icLogger.t('switchCommandRequest message: $message');

//  * The message object encoded as a ProtoBuf message
    socket.add(message);
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  Future listEntitiesRequest() async {
    if (devicePass == null) {
      icLogger.t('Please call sendConnect, password is missing');
      return;
    }
    // connect to the socket server
    final socket = await getSocket();
    icLogger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    ListEntitiesRequest();

    const int numOfByteBeforeData = 3;

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 11);

    icLogger.t('ListEntitiesRequest message: $message');

//  * The message object encoded as a ProtoBuf message
    socket.add(message);
  }

  static HelloResponse? bytesToHelloResponse(List<int> bytes) {
    // Check if request is hello response
    if (bytes[2] != 2) {
      return null;
    }

    final HelloResponse helloResponse = HelloResponse();

    final List<int> responseBytes = bytes.sublist(3);
    helloResponse.serverInfo = utf8.decode(responseBytes);

    return helloResponse;
  }

  /// aioesphomeapi:
  /// fName = _connect_init_frame_helper
  /// Step 3 in connect process: initialize the frame helper and init read loop.
  Future connectInitFrameHelper() async {
    await getSocket();

    await listenToResponses();
  }

  /// Gets mDNS name and return the IP of that device
  /// aioesphomeapi:
  /// fName = _connect_resolve_host
  /// Step 1 in connect process: resolve the address.
  static Future<String?> getIpFromMdns(String deviceMdnsName) async {
    try {
      final List<InternetAddress> deviceIpList =
          await InternetAddress.lookup(deviceMdnsName);
      if (deviceIpList.isNotEmpty) {
        return deviceIpList[0].address;
      }
    } catch (e) {
      icLogger.e(
        'Crash when searching the IP for device with mDNS\n$e',
      );
    }

    return null;
  }
}
