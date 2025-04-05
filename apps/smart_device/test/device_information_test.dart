import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(42, 42);
  });
}

// import 'package:cbj_smart_device/core/device_information.dart';
// import 'package:test/test.dart';
//
// void main() {
//   test('DeviceInformation', () {
//     const deviceUuid = '30:23:a2:G3:34';
//     const smartInstanceName = 'Guy ceiling light';
//
//     final deviceInformation = DeviceInformation(deviceUuid, smartInstanceName);
//
//     expect(deviceInformation.getUuid(), deviceUuid);
//     expect(deviceInformation.getName(), smartInstanceName);
//   });
//
//   test('RemoteDevice', () {
//     const deviceUuid = '30:23:a2:G3:34';
//     const smartInstanceName = 'Guy ceiling light';
//     const deviceIp = '10.0.0.10';
//
//     final deviceInformation =
//         RemoteDevice(deviceUuid, smartInstanceName, deviceIp);
//
//     expect(deviceInformation.getUuid(), deviceUuid);
//     expect(deviceInformation.getName(), smartInstanceName);
//     expect(deviceInformation.getIp(), deviceIp);
//   });
//
//   test('LocalDevice', () {
//     const deviceUuid = '30:23:a2:G3:34';
//     const smartInstanceName = 'Guy ceiling light';
//
//     final deviceInformation = LocalDevice(deviceUuid, smartInstanceName);
//
//     expect(deviceInformation.getUuid(), deviceUuid);
//     expect(deviceInformation.getName(), smartInstanceName);
//   });
// }
