class CbjDevicesPackets {
  ///CbjDevices integration TCP socket API packet formats.///

  /// weekdays sum, start-time timestamp, end-time timestamp
  static const scheduleCreateDataFormat = '01{}01{}{}';

  static const noTimerRequested = '00000000';

  static const nonRecurringSchedule = '00';

  /// format values are local session id, timestamp
  static const requestFormat =
      '{}340001000000000000000000{}00000000000000000000f0fe';

  static const pad74Zeros =
      '000000000000000000000000000000000000000000000000000000000000000000000'
      '0000';

  /// format value just timestamp (initial session id is '00000000')
  static String loginPacket =
      'fef052000232a10000000000${requestFormat.substring(2)}1c$pad74Zeros';

  /// format values are local session id, timestamp, device id
  static const getStatePacket = 'fef0300002320103$requestFormat{}00';

  /// format values are local session id, timestamp, device id, command, timer
  static const sendControlPacket =
      'fef05d0002320102$requestFormat{}${pad74Zeros}0106000{}00{}';

  /// format values are local session id, timestamp, device id, auto-off seconds
  static const setAutoOffSetPacket =
      'fef05b0002320102$requestFormat{}${pad74Zeros}040400{}';

  /// format values are local session id, timestamp, device id, name
  static const updateDeviceNamePacket =
      'fef0740002320202$requestFormat{}$pad74Zeros{}';

  /// format values are local session id, timestamp, device id
  static const getSchedulesPacket =
      'fef0570002320102$requestFormat{}${pad74Zeros}060000';

  /// format values are local session id, timestamp, device id, schedule id
  static const deleteSchedulePacket =
      'fef0580002320102$requestFormat{}${pad74Zeros}0801000{}';

  /// format values are local session id, timestamp, device id,
// schedule data =
//                   (on_off + week + timstate + start_time + end_time)
  static const createSchedulePacket =
      'fef0630002320102$requestFormat{}${pad74Zeros}030c00ff{}';
}
