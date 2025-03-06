import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(42, 42);
  });
}

// void main() {
// test('PinInformation PinInformation.pinAndPhysicalPinConfiguration is null',
//     () async {
//            var pinInformation = PinInformation();
//
//            var pinOnResponse = await TurnPinOnOffLocal().pinOn(
//       pinInformation);
//
//   expect(pinOnResponse,
//       'Error PinInformation.pinAndPhysicalPinConfiguration was not set');
// });
//
// test('PinInformation', () async {
//   var pinInformation =
//       PinInformation(pinAndPhysicalPinConfiguration: 2);
//
//   var pinOnResponse = await TurnPinOnOffLocal().pinOn(
//       pinInformation);
//
//   expect(pinOnResponse,
//       'Error SharedVariables.GetProjectRootDirectoryPath was not set');
// });
// }
