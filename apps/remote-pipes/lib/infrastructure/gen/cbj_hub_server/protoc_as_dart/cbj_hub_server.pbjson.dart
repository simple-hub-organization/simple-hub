///
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sendingTypeDescriptor instead')
const SendingType$json = const {
  '1': 'SendingType',
  '2': const [
    const {'1': 'undefinedType', '2': 0},
    const {'1': 'stringType', '2': 1},
    const {'1': 'partialDeviceType', '2': 2},
    const {'1': 'deviceType', '2': 3},
    const {'1': 'mqttMassageType', '2': 4},
    const {'1': 'sceneType', '2': 5},
    const {'1': 'scheduleType', '2': 6},
    const {'1': 'routineType', '2': 7},
    const {'1': 'bindingsType', '2': 8},
    const {'1': 'vendorLoginType', '2': 9},
    const {'1': 'firstConnection', '2': 10},
    const {'1': 'remotePipesInformation', '2': 11},
    const {'1': 'getHubDeviceInfo', '2': 12},
    const {'1': 'responseHubDeviceInfo', '2': 13},
    const {'1': 'roomType', '2': 14},
    const {'1': 'location', '2': 15},
  ],
};

/// Descriptor for `SendingType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sendingTypeDescriptor = $convert.base64Decode('CgtTZW5kaW5nVHlwZRIRCg11bmRlZmluZWRUeXBlEAASDgoKc3RyaW5nVHlwZRABEhUKEXBhcnRpYWxEZXZpY2VUeXBlEAISDgoKZGV2aWNlVHlwZRADEhMKD21xdHRNYXNzYWdlVHlwZRAEEg0KCXNjZW5lVHlwZRAFEhAKDHNjaGVkdWxlVHlwZRAGEg8KC3JvdXRpbmVUeXBlEAcSEAoMYmluZGluZ3NUeXBlEAgSEwoPdmVuZG9yTG9naW5UeXBlEAkSEwoPZmlyc3RDb25uZWN0aW9uEAoSGgoWcmVtb3RlUGlwZXNJbmZvcm1hdGlvbhALEhQKEGdldEh1YkRldmljZUluZm8QDBIZChVyZXNwb25zZUh1YkRldmljZUluZm8QDRIMCghyb29tVHlwZRAOEgwKCGxvY2F0aW9uEA8=');
@$core.Deprecated('Use deviceStateGRPCDescriptor instead')
const DeviceStateGRPC$json = const {
  '1': 'DeviceStateGRPC',
  '2': const [
    const {'1': 'stateNotSupported', '2': 0},
    const {'1': 'cancelStateInProcess', '2': 1},
    const {'1': 'ack', '2': 2},
    const {'1': 'newStateFailed', '2': 3},
    const {'1': 'waitingInFirebase', '2': 4},
    const {'1': 'waitingInComp', '2': 5},
    const {'1': 'noDevicesToTransfer', '2': 6},
    const {'1': 'pingNow', '2': 7},
    const {'1': 'addingNewScene', '2': 8},
    const {'1': 'addingNewRoutine', '2': 9},
    const {'1': 'addingNewBinding', '2': 10},
    const {'1': 'updateHubDevicePropertiesFromRealDevice', '2': 11},
  ],
};

/// Descriptor for `DeviceStateGRPC`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceStateGRPCDescriptor = $convert.base64Decode('Cg9EZXZpY2VTdGF0ZUdSUEMSFQoRc3RhdGVOb3RTdXBwb3J0ZWQQABIYChRjYW5jZWxTdGF0ZUluUHJvY2VzcxABEgcKA2FjaxACEhIKDm5ld1N0YXRlRmFpbGVkEAMSFQoRd2FpdGluZ0luRmlyZWJhc2UQBBIRCg13YWl0aW5nSW5Db21wEAUSFwoTbm9EZXZpY2VzVG9UcmFuc2ZlchAGEgsKB3BpbmdOb3cQBxISCg5hZGRpbmdOZXdTY2VuZRAIEhQKEGFkZGluZ05ld1JvdXRpbmUQCRIUChBhZGRpbmdOZXdCaW5kaW5nEAoSKwondXBkYXRlSHViRGV2aWNlUHJvcGVydGllc0Zyb21SZWFsRGV2aWNlEAs=');
@$core.Deprecated('Use vendorsAndServicesDescriptor instead')
const VendorsAndServices$json = const {
  '1': 'VendorsAndServices',
  '2': const [
    const {'1': 'vendorsAndServicesNotSupported', '2': 0},
    const {'1': 'espHome', '2': 1},
    const {'1': 'switcherSmartHome', '2': 2},
    const {'1': 'tasmota', '2': 3},
    const {'1': 'yeelight', '2': 4},
    const {'1': 'google', '2': 5},
    const {'1': 'miHome', '2': 6},
    const {'1': 'lifx', '2': 7},
    const {'1': 'tuyaSmart', '2': 8},
    const {'1': 'smartLife', '2': 9},
    const {'1': 'jinvooSmart', '2': 10},
    const {'1': 'shelly', '2': 11},
    const {'1': 'wink', '2': 12},
    const {'1': 'ikea', '2': 13},
    const {'1': 'sonoffDiy', '2': 14},
    const {'1': 'philipsHue', '2': 15},
    const {'1': 'lg', '2': 16},
    const {'1': 'spotify', '2': 17},
    const {'1': 'homeAssistant', '2': 18},
    const {'1': 'hp', '2': 19},
    const {'1': 'yeelink', '2': 20},
    const {'1': 'xiaomi', '2': 21},
    const {'1': 'sonoffEweLink', '2': 22},
    const {'1': 'cbjDevices', '2': 23},
    const {'1': 'wiz', '2': 24},
    const {'1': 'switchBot', '2': 25},
    const {'1': 'somfy', '2': 26},
  ],
};

/// Descriptor for `VendorsAndServices`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List vendorsAndServicesDescriptor = $convert.base64Decode('ChJWZW5kb3JzQW5kU2VydmljZXMSIgoedmVuZG9yc0FuZFNlcnZpY2VzTm90U3VwcG9ydGVkEAASCwoHZXNwSG9tZRABEhUKEXN3aXRjaGVyU21hcnRIb21lEAISCwoHdGFzbW90YRADEgwKCHllZWxpZ2h0EAQSCgoGZ29vZ2xlEAUSCgoGbWlIb21lEAYSCAoEbGlmeBAHEg0KCXR1eWFTbWFydBAIEg0KCXNtYXJ0TGlmZRAJEg8KC2ppbnZvb1NtYXJ0EAoSCgoGc2hlbGx5EAsSCAoEd2luaxAMEggKBGlrZWEQDRINCglzb25vZmZEaXkQDhIOCgpwaGlsaXBzSHVlEA8SBgoCbGcQEBILCgdzcG90aWZ5EBESEQoNaG9tZUFzc2lzdGFudBASEgYKAmhwEBMSCwoHeWVlbGluaxAUEgoKBnhpYW9taRAVEhEKDXNvbm9mZkV3ZUxpbmsQFhIOCgpjYmpEZXZpY2VzEBcSBwoDd2l6EBgSDQoJc3dpdGNoQm90EBkSCQoFc29tZnkQGg==');
@$core.Deprecated('Use deviceTypesDescriptor instead')
const DeviceTypes$json = const {
  '1': 'DeviceTypes',
  '2': const [
    const {'1': 'smartTypeNotSupported', '2': 0},
    const {'1': 'light', '2': 1},
    const {'1': 'blinds', '2': 2},
    const {'1': 'boiler', '2': 3},
    const {'1': 'button', '2': 4},
    const {'1': 'buttonWithLight', '2': 5},
    const {'1': 'hub', '2': 7},
    const {'1': 'phoneApp', '2': 8},
    const {'1': 'computerApp', '2': 9},
    const {'1': 'browserApp', '2': 10},
    const {'1': 'switch', '2': 11},
    const {'1': 'dimmableLight', '2': 12},
    const {'1': 'cctLight', '2': 13},
    const {'1': 'rgbLights', '2': 14},
    const {'1': 'rgbwLights', '2': 15},
    const {'1': 'rgbcctLights', '2': 16},
    const {'1': 'smartTV', '2': 17},
    const {'1': 'smartSpeakers', '2': 18},
    const {'1': 'coffeeMachine', '2': 19},
    const {'1': 'kettle', '2': 20},
    const {'1': 'teapot', '2': 21},
    const {'1': 'washingMachine', '2': 22},
    const {'1': 'dishwasher', '2': 23},
    const {'1': 'toaster', '2': 24},
    const {'1': 'vacuumCleaner', '2': 25},
    const {'1': 'refrigerator', '2': 26},
    const {'1': 'bed', '2': 27},
    const {'1': 'oven', '2': 28},
    const {'1': 'AirConditioner', '2': 29},
    const {'1': 'smartWatch', '2': 30},
    const {'1': 'smartWaterBottle', '2': 31},
    const {'1': 'microphone', '2': 32},
    const {'1': 'securityCamera', '2': 33},
    const {'1': 'babyMonitor', '2': 34},
    const {'1': 'motionSensor', '2': 35},
    const {'1': 'temperatureSensor', '2': 36},
    const {'1': 'humiditySensor', '2': 37},
    const {'1': 'lightSensor', '2': 38},
    const {'1': 'soundSensor', '2': 39},
    const {'1': 'smokeSensor', '2': 40},
    const {'1': 'smokeDetector', '2': 41},
    const {'1': 'oxygenSensor', '2': 42},
    const {'1': 'smartPlug', '2': 43},
    const {'1': 'printer', '2': 44},
    const {'1': 'scanner', '2': 45},
    const {'1': 'printerWithScanner', '2': 46},
    const {'1': 'smartComputer', '2': 47},
    const {'1': 'emptyDevice', '2': 48},
    const {'1': 'pingDevice', '2': 49},
  ],
};

/// Descriptor for `DeviceTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceTypesDescriptor = $convert.base64Decode('CgtEZXZpY2VUeXBlcxIZChVzbWFydFR5cGVOb3RTdXBwb3J0ZWQQABIJCgVsaWdodBABEgoKBmJsaW5kcxACEgoKBmJvaWxlchADEgoKBmJ1dHRvbhAEEhMKD2J1dHRvbldpdGhMaWdodBAFEgcKA2h1YhAHEgwKCHBob25lQXBwEAgSDwoLY29tcHV0ZXJBcHAQCRIOCgpicm93c2VyQXBwEAoSCgoGc3dpdGNoEAsSEQoNZGltbWFibGVMaWdodBAMEgwKCGNjdExpZ2h0EA0SDQoJcmdiTGlnaHRzEA4SDgoKcmdid0xpZ2h0cxAPEhAKDHJnYmNjdExpZ2h0cxAQEgsKB3NtYXJ0VFYQERIRCg1zbWFydFNwZWFrZXJzEBISEQoNY29mZmVlTWFjaGluZRATEgoKBmtldHRsZRAUEgoKBnRlYXBvdBAVEhIKDndhc2hpbmdNYWNoaW5lEBYSDgoKZGlzaHdhc2hlchAXEgsKB3RvYXN0ZXIQGBIRCg12YWN1dW1DbGVhbmVyEBkSEAoMcmVmcmlnZXJhdG9yEBoSBwoDYmVkEBsSCAoEb3ZlbhAcEhIKDkFpckNvbmRpdGlvbmVyEB0SDgoKc21hcnRXYXRjaBAeEhQKEHNtYXJ0V2F0ZXJCb3R0bGUQHxIOCgptaWNyb3Bob25lECASEgoOc2VjdXJpdHlDYW1lcmEQIRIPCgtiYWJ5TW9uaXRvchAiEhAKDG1vdGlvblNlbnNvchAjEhUKEXRlbXBlcmF0dXJlU2Vuc29yECQSEgoOaHVtaWRpdHlTZW5zb3IQJRIPCgtsaWdodFNlbnNvchAmEg8KC3NvdW5kU2Vuc29yECcSDwoLc21va2VTZW5zb3IQKBIRCg1zbW9rZURldGVjdG9yECkSEAoMb3h5Z2VuU2Vuc29yECoSDQoJc21hcnRQbHVnECsSCwoHcHJpbnRlchAsEgsKB3NjYW5uZXIQLRIWChJwcmludGVyV2l0aFNjYW5uZXIQLhIRCg1zbWFydENvbXB1dGVyEC8SDwoLZW1wdHlEZXZpY2UQMBIOCgpwaW5nRGV2aWNlEDE=');
@$core.Deprecated('Use deviceActionsDescriptor instead')
const DeviceActions$json = const {
  '1': 'DeviceActions',
  '2': const [
    const {'1': 'actionNotSupported', '2': 0},
    const {'1': 'on', '2': 1},
    const {'1': 'off', '2': 2},
    const {'1': 'moveUp', '2': 3},
    const {'1': 'stop', '2': 4},
    const {'1': 'moveDown', '2': 5},
    const {'1': 'pressed', '2': 6},
    const {'1': 'longPress', '2': 7},
    const {'1': 'doubleTap', '2': 8},
    const {'1': 'position', '2': 9},
    const {'1': 'suspend', '2': 10},
    const {'1': 'shutdown', '2': 11},
    const {'1': 'itIsFalse', '2': 12},
    const {'1': 'itIsTrue', '2': 13},
    const {'1': 'pausePlay', '2': 14},
    const {'1': 'changeVolume', '2': 15},
    const {'1': 'jump', '2': 16},
    const {'1': 'skip', '2': 17},
    const {'1': 'pause', '2': 18},
    const {'1': 'play', '2': 19},
    const {'1': 'volumeUp', '2': 20},
    const {'1': 'volumeDown', '2': 21},
    const {'1': 'skipForeword', '2': 22},
    const {'1': 'skipBackward', '2': 23},
    const {'1': 'skipNextVid', '2': 24},
    const {'1': 'skipPreviousVid', '2': 25},
    const {'1': 'open', '2': 26},
    const {'1': 'close', '2': 27},
  ],
};

/// Descriptor for `DeviceActions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceActionsDescriptor = $convert.base64Decode('Cg1EZXZpY2VBY3Rpb25zEhYKEmFjdGlvbk5vdFN1cHBvcnRlZBAAEgYKAm9uEAESBwoDb2ZmEAISCgoGbW92ZVVwEAMSCAoEc3RvcBAEEgwKCG1vdmVEb3duEAUSCwoHcHJlc3NlZBAGEg0KCWxvbmdQcmVzcxAHEg0KCWRvdWJsZVRhcBAIEgwKCHBvc2l0aW9uEAkSCwoHc3VzcGVuZBAKEgwKCHNodXRkb3duEAsSDQoJaXRJc0ZhbHNlEAwSDAoIaXRJc1RydWUQDRINCglwYXVzZVBsYXkQDhIQCgxjaGFuZ2VWb2x1bWUQDxIICgRqdW1wEBASCAoEc2tpcBAREgkKBXBhdXNlEBISCAoEcGxheRATEgwKCHZvbHVtZVVwEBQSDgoKdm9sdW1lRG93bhAVEhAKDHNraXBGb3Jld29yZBAWEhAKDHNraXBCYWNrd2FyZBAXEg8KC3NraXBOZXh0VmlkEBgSEwoPc2tpcFByZXZpb3VzVmlkEBkSCAoEb3BlbhAaEgkKBWNsb3NlEBs=');
@$core.Deprecated('Use whenToExecuteDescriptor instead')
const WhenToExecute$json = const {
  '1': 'WhenToExecute',
  '2': const [
    const {'1': 'undefined', '2': 0},
    const {'1': 'onOddNumberPress', '2': 1},
    const {'1': 'evenNumberPress', '2': 2},
    const {'1': 'betweenSelectedTime', '2': 3},
    const {'1': 'doNotBetweenSelectedTime', '2': 4},
    const {'1': 'allTheTime', '2': 5},
    const {'1': 'never', '2': 6},
    const {'1': 'onceNow', '2': 7},
    const {'1': 'onceInSelectedTime', '2': 8},
    const {'1': 'onlyIfDeviceListIsAreInActionListState', '2': 9},
    const {'1': 'atHome', '2': 10},
    const {'1': 'outOfHome', '2': 11},
    const {'1': 'atASpecificTime', '2': 12},
  ],
};

/// Descriptor for `WhenToExecute`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List whenToExecuteDescriptor = $convert.base64Decode('Cg1XaGVuVG9FeGVjdXRlEg0KCXVuZGVmaW5lZBAAEhQKEG9uT2RkTnVtYmVyUHJlc3MQARITCg9ldmVuTnVtYmVyUHJlc3MQAhIXChNiZXR3ZWVuU2VsZWN0ZWRUaW1lEAMSHAoYZG9Ob3RCZXR3ZWVuU2VsZWN0ZWRUaW1lEAQSDgoKYWxsVGhlVGltZRAFEgkKBW5ldmVyEAYSCwoHb25jZU5vdxAHEhYKEm9uY2VJblNlbGVjdGVkVGltZRAIEioKJm9ubHlJZkRldmljZUxpc3RJc0FyZUluQWN0aW9uTGlzdFN0YXRlEAkSCgoGYXRIb21lEAoSDQoJb3V0T2ZIb21lEAsSEwoPYXRBU3BlY2lmaWNUaW1lEAw=');
@$core.Deprecated('Use areaPurposesTypesDescriptor instead')
const AreaPurposesTypes$json = const {
  '1': 'AreaPurposesTypes',
  '2': const [
    const {'1': 'bedroom', '2': 0},
    const {'1': 'studyRoom', '2': 1},
    const {'1': 'workRoom', '2': 2},
    const {'1': 'tvRoom', '2': 3},
    const {'1': 'videoGames', '2': 4},
    const {'1': 'livingRoom', '2': 5},
    const {'1': 'diningRoom', '2': 6},
    const {'1': 'kitchen', '2': 7},
    const {'1': 'outside', '2': 8},
    const {'1': 'outsidePrimary', '2': 9},
    const {'1': 'outsideNotPrimary', '2': 10},
    const {'1': 'toiletRoom', '2': 11},
    const {'1': 'shower', '2': 12},
    const {'1': 'trainingRoom', '2': 13},
    const {'1': 'meditation', '2': 14},
    const {'1': 'romantic', '2': 15},
    const {'1': 'stairsInside', '2': 16},
    const {'1': 'stairsOutside', '2': 17},
    const {'1': 'childrensRoom', '2': 18},
    const {'1': 'cinemaRoom', '2': 19},
    const {'1': 'boardGames', '2': 20},
    const {'1': 'bathtub', '2': 21},
    const {'1': 'laundryRoom', '2': 22},
    const {'1': 'protectedSpace', '2': 23},
    const {'1': 'safeRoom', '2': 24},
    const {'1': 'attic', '2': 25},
    const {'1': 'holidayCabin', '2': 26},
  ],
};

/// Descriptor for `AreaPurposesTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List areaPurposesTypesDescriptor = $convert.base64Decode('ChFBcmVhUHVycG9zZXNUeXBlcxILCgdiZWRyb29tEAASDQoJc3R1ZHlSb29tEAESDAoId29ya1Jvb20QAhIKCgZ0dlJvb20QAxIOCgp2aWRlb0dhbWVzEAQSDgoKbGl2aW5nUm9vbRAFEg4KCmRpbmluZ1Jvb20QBhILCgdraXRjaGVuEAcSCwoHb3V0c2lkZRAIEhIKDm91dHNpZGVQcmltYXJ5EAkSFQoRb3V0c2lkZU5vdFByaW1hcnkQChIOCgp0b2lsZXRSb29tEAsSCgoGc2hvd2VyEAwSEAoMdHJhaW5pbmdSb29tEA0SDgoKbWVkaXRhdGlvbhAOEgwKCHJvbWFudGljEA8SEAoMc3RhaXJzSW5zaWRlEBASEQoNc3RhaXJzT3V0c2lkZRAREhEKDWNoaWxkcmVuc1Jvb20QEhIOCgpjaW5lbWFSb29tEBMSDgoKYm9hcmRHYW1lcxAUEgsKB2JhdGh0dWIQFRIPCgtsYXVuZHJ5Um9vbRAWEhIKDnByb3RlY3RlZFNwYWNlEBcSDAoIc2FmZVJvb20QGBIJCgVhdHRpYxAZEhAKDGhvbGlkYXlDYWJpbhAa');
@$core.Deprecated('Use clientStatusRequestsDescriptor instead')
const ClientStatusRequests$json = const {
  '1': 'ClientStatusRequests',
  '2': const [
    const {'1': 'sendingType', '3': 41, '4': 1, '5': 14, '6': '.CbjHub.SendingType', '10': 'sendingType'},
    const {'1': 'allRemoteCommands', '3': 42, '4': 1, '5': 9, '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `ClientStatusRequests`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientStatusRequestsDescriptor = $convert.base64Decode('ChRDbGllbnRTdGF0dXNSZXF1ZXN0cxI1CgtzZW5kaW5nVHlwZRgpIAEoDjITLkNiakh1Yi5TZW5kaW5nVHlwZVILc2VuZGluZ1R5cGUSLAoRYWxsUmVtb3RlQ29tbWFuZHMYKiABKAlSEWFsbFJlbW90ZUNvbW1hbmRz');
@$core.Deprecated('Use requestsAndStatusFromHubDescriptor instead')
const RequestsAndStatusFromHub$json = const {
  '1': 'RequestsAndStatusFromHub',
  '2': const [
    const {'1': 'sendingType', '3': 43, '4': 1, '5': 14, '6': '.CbjHub.SendingType', '10': 'sendingType'},
    const {'1': 'allRemoteCommands', '3': 44, '4': 1, '5': 9, '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `RequestsAndStatusFromHub`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestsAndStatusFromHubDescriptor = $convert.base64Decode('ChhSZXF1ZXN0c0FuZFN0YXR1c0Zyb21IdWISNQoLc2VuZGluZ1R5cGUYKyABKA4yEy5DYmpIdWIuU2VuZGluZ1R5cGVSC3NlbmRpbmdUeXBlEiwKEWFsbFJlbW90ZUNvbW1hbmRzGCwgASgJUhFhbGxSZW1vdGVDb21tYW5kcw==');
@$core.Deprecated('Use allRemoteCommandsDescriptor instead')
const AllRemoteCommands$json = const {
  '1': 'AllRemoteCommands',
  '2': const [
    const {'1': 'smartDeviceInfo', '3': 40, '4': 1, '5': 11, '6': '.CbjHub.SmartDeviceInfo', '10': 'smartDeviceInfo'},
  ],
};

/// Descriptor for `AllRemoteCommands`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allRemoteCommandsDescriptor = $convert.base64Decode('ChFBbGxSZW1vdGVDb21tYW5kcxJBCg9zbWFydERldmljZUluZm8YKCABKAsyFy5DYmpIdWIuU21hcnREZXZpY2VJbmZvUg9zbWFydERldmljZUluZm8=');
@$core.Deprecated('Use firstSetupMessageDescriptor instead')
const FirstSetupMessage$json = const {
  '1': 'FirstSetupMessage',
  '2': const [
    const {'1': 'compInfo', '3': 38, '4': 1, '5': 11, '6': '.CbjHub.CompHubInfo', '10': 'compInfo'},
    const {'1': 'firebaseAccountInformation', '3': 39, '4': 1, '5': 11, '6': '.CbjHub.FirebaseAccountInformation', '10': 'firebaseAccountInformation'},
  ],
};

/// Descriptor for `FirstSetupMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firstSetupMessageDescriptor = $convert.base64Decode('ChFGaXJzdFNldHVwTWVzc2FnZRIvCghjb21wSW5mbxgmIAEoCzITLkNiakh1Yi5Db21wSHViSW5mb1IIY29tcEluZm8SYgoaZmlyZWJhc2VBY2NvdW50SW5mb3JtYXRpb24YJyABKAsyIi5DYmpIdWIuRmlyZWJhc2VBY2NvdW50SW5mb3JtYXRpb25SGmZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9u');
@$core.Deprecated('Use compHubInfoDescriptor instead')
const CompHubInfo$json = const {
  '1': 'CompHubInfo',
  '2': const [
    const {'1': 'cbjInfo', '3': 47, '4': 1, '5': 11, '6': '.CbjHub.CbjHubIno', '10': 'cbjInfo'},
    const {'1': 'compSpecs', '3': 21, '4': 1, '5': 11, '6': '.CbjHub.CompHubSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompHubInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compHubInfoDescriptor = $convert.base64Decode('CgtDb21wSHViSW5mbxIrCgdjYmpJbmZvGC8gASgLMhEuQ2JqSHViLkNiakh1Yklub1IHY2JqSW5mbxIyCgljb21wU3BlY3MYFSABKAsyFC5DYmpIdWIuQ29tcEh1YlNwZWNzUgljb21wU3BlY3M=');
@$core.Deprecated('Use cbjHubInoDescriptor instead')
const CbjHubIno$json = const {
  '1': 'CbjHubIno',
  '2': const [
    const {'1': 'deviceName', '3': 48, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'pubspecYamlVersion', '3': 27, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    const {'1': 'pubspecYamlBuildNumber', '3': 51, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    const {'1': 'protoLastGenDate', '3': 49, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    const {'1': 'dartSdkVersion', '3': 52, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjHubIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjHubInoDescriptor = $convert.base64Decode('CglDYmpIdWJJbm8SHgoKZGV2aWNlTmFtZRgwIAEoCVIKZGV2aWNlTmFtZRIuChJwdWJzcGVjWWFtbFZlcnNpb24YGyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyGDMgASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTGFzdEdlbkRhdGUYMSABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YNCABKAlSDmRhcnRTZGtWZXJzaW9u');
@$core.Deprecated('Use compHubSpecsDescriptor instead')
const CompHubSpecs$json = const {
  '1': 'CompHubSpecs',
  '2': const [
    const {'1': 'compId', '3': 22, '4': 1, '5': 9, '10': 'compId'},
    const {'1': 'compUuid', '3': 23, '4': 1, '5': 9, '10': 'compUuid'},
    const {'1': 'compOs', '3': 24, '4': 1, '5': 9, '10': 'compOs'},
    const {'1': 'compModel', '3': 25, '4': 1, '5': 9, '10': 'compModel'},
    const {'1': 'compType', '3': 26, '4': 1, '5': 9, '10': 'compType'},
    const {'1': 'compIp', '3': 50, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompHubSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compHubSpecsDescriptor = $convert.base64Decode('CgxDb21wSHViU3BlY3MSFgoGY29tcElkGBYgASgJUgZjb21wSWQSGgoIY29tcFV1aWQYFyABKAlSCGNvbXBVdWlkEhYKBmNvbXBPcxgYIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgZIAEoCVIJY29tcE1vZGVsEhoKCGNvbXBUeXBlGBogASgJUghjb21wVHlwZRIWCgZjb21wSXAYMiABKAlSBmNvbXBJcA==');
@$core.Deprecated('Use microcontrollerSpecsDescriptor instead')
const MicrocontrollerSpecs$json = const {
  '1': 'MicrocontrollerSpecs',
  '2': const [
    const {'1': 'microcontrollerModel', '3': 31, '4': 1, '5': 9, '10': 'microcontrollerModel'},
    const {'1': 'microcontrollerType', '3': 32, '4': 1, '5': 9, '10': 'microcontrollerType'},
    const {'1': 'softwareVersion', '3': 33, '4': 1, '5': 9, '10': 'softwareVersion'},
  ],
};

/// Descriptor for `MicrocontrollerSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List microcontrollerSpecsDescriptor = $convert.base64Decode('ChRNaWNyb2NvbnRyb2xsZXJTcGVjcxIyChRtaWNyb2NvbnRyb2xsZXJNb2RlbBgfIAEoCVIUbWljcm9jb250cm9sbGVyTW9kZWwSMAoTbWljcm9jb250cm9sbGVyVHlwZRggIAEoCVITbWljcm9jb250cm9sbGVyVHlwZRIoCg9zb2Z0d2FyZVZlcnNpb24YISABKAlSD3NvZnR3YXJlVmVyc2lvbg==');
@$core.Deprecated('Use smartDeviceInfoDescriptor instead')
const SmartDeviceInfo$json = const {
  '1': 'SmartDeviceInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'state', '3': 3, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'defaultName', '3': 14, '4': 1, '5': 9, '10': 'defaultName'},
    const {'1': 'roomId', '3': 15, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'senderDeviceModel', '3': 16, '4': 1, '5': 9, '10': 'senderDeviceModel'},
    const {'1': 'senderDeviceOs', '3': 17, '4': 1, '5': 9, '10': 'senderDeviceOs'},
    const {'1': 'senderId', '3': 18, '4': 1, '5': 9, '10': 'senderId'},
    const {'1': 'serverTimeStamp', '3': 19, '4': 1, '5': 9, '10': 'serverTimeStamp'},
    const {'1': 'stateMassage', '3': 20, '4': 1, '5': 9, '10': 'stateMassage'},
    const {'1': 'mqttMassage', '3': 43, '4': 1, '5': 11, '6': '.CbjHub.MqttMassage', '10': 'mqttMassage'},
    const {'1': 'isComputer', '3': 29, '4': 1, '5': 8, '10': 'isComputer'},
    const {'1': 'compSpecs', '3': 30, '4': 1, '5': 11, '6': '.CbjHub.CompHubSpecs', '10': 'compSpecs'},
    const {'1': 'microcontrollerSpecsSpecs', '3': 31, '4': 1, '5': 11, '6': '.CbjHub.MicrocontrollerSpecs', '10': 'microcontrollerSpecsSpecs'},
    const {'1': 'deviceTypesActions', '3': 34, '4': 1, '5': 11, '6': '.CbjHub.DeviceTypesActions', '10': 'deviceTypesActions'},
  ],
};

/// Descriptor for `SmartDeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartDeviceInfoDescriptor = $convert.base64Decode('Cg9TbWFydERldmljZUluZm8SDgoCaWQYASABKAlSAmlkEhQKBXN0YXRlGAMgASgJUgVzdGF0ZRIgCgtkZWZhdWx0TmFtZRgOIAEoCVILZGVmYXVsdE5hbWUSFgoGcm9vbUlkGA8gASgJUgZyb29tSWQSLAoRc2VuZGVyRGV2aWNlTW9kZWwYECABKAlSEXNlbmRlckRldmljZU1vZGVsEiYKDnNlbmRlckRldmljZU9zGBEgASgJUg5zZW5kZXJEZXZpY2VPcxIaCghzZW5kZXJJZBgSIAEoCVIIc2VuZGVySWQSKAoPc2VydmVyVGltZVN0YW1wGBMgASgJUg9zZXJ2ZXJUaW1lU3RhbXASIgoMc3RhdGVNYXNzYWdlGBQgASgJUgxzdGF0ZU1hc3NhZ2USNQoLbXF0dE1hc3NhZ2UYKyABKAsyEy5DYmpIdWIuTXF0dE1hc3NhZ2VSC21xdHRNYXNzYWdlEh4KCmlzQ29tcHV0ZXIYHSABKAhSCmlzQ29tcHV0ZXISMgoJY29tcFNwZWNzGB4gASgLMhQuQ2JqSHViLkNvbXBIdWJTcGVjc1IJY29tcFNwZWNzEloKGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MYHyABKAsyHC5DYmpIdWIuTWljcm9jb250cm9sbGVyU3BlY3NSGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MSSgoSZGV2aWNlVHlwZXNBY3Rpb25zGCIgASgLMhouQ2JqSHViLkRldmljZVR5cGVzQWN0aW9uc1ISZGV2aWNlVHlwZXNBY3Rpb25z');
@$core.Deprecated('Use smartDeviceStatusDescriptor instead')
const SmartDeviceStatus$json = const {
  '1': 'SmartDeviceStatus',
  '2': const [
    const {'1': 'onOffState', '3': 4, '4': 1, '5': 8, '10': 'onOffState'},
  ],
};

/// Descriptor for `SmartDeviceStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartDeviceStatusDescriptor = $convert.base64Decode('ChFTbWFydERldmljZVN0YXR1cxIeCgpvbk9mZlN0YXRlGAQgASgIUgpvbk9mZlN0YXRl');
@$core.Deprecated('Use mqttMassageDescriptor instead')
const MqttMassage$json = const {
  '1': 'MqttMassage',
  '2': const [
    const {'1': 'mqttTopic', '3': 44, '4': 1, '5': 9, '10': 'mqttTopic'},
    const {'1': 'mqttMassage', '3': 45, '4': 1, '5': 9, '10': 'mqttMassage'},
  ],
};

/// Descriptor for `MqttMassage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mqttMassageDescriptor = $convert.base64Decode('CgtNcXR0TWFzc2FnZRIcCgltcXR0VG9waWMYLCABKAlSCW1xdHRUb3BpYxIgCgttcXR0TWFzc2FnZRgtIAEoCVILbXF0dE1hc3NhZ2U=');
@$core.Deprecated('Use commendStatusDescriptor instead')
const CommendStatus$json = const {
  '1': 'CommendStatus',
  '2': const [
    const {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commendStatusDescriptor = $convert.base64Decode('Cg1Db21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYBSABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use smartDeviceUpdateDetailsDescriptor instead')
const SmartDeviceUpdateDetails$json = const {
  '1': 'SmartDeviceUpdateDetails',
  '2': const [
    const {'1': 'smartDevice', '3': 6, '4': 1, '5': 11, '6': '.CbjHub.SmartDeviceInfo', '10': 'smartDevice'},
    const {'1': 'newName', '3': 7, '4': 1, '5': 9, '10': 'newName'},
  ],
};

/// Descriptor for `SmartDeviceUpdateDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartDeviceUpdateDetailsDescriptor = $convert.base64Decode('ChhTbWFydERldmljZVVwZGF0ZURldGFpbHMSOQoLc21hcnREZXZpY2UYBiABKAsyFy5DYmpIdWIuU21hcnREZXZpY2VJbmZvUgtzbWFydERldmljZRIYCgduZXdOYW1lGAcgASgJUgduZXdOYW1l');
@$core.Deprecated('Use firebaseAccountInformationDescriptor instead')
const FirebaseAccountInformation$json = const {
  '1': 'FirebaseAccountInformation',
  '2': const [
    const {'1': 'fireBaseProjectId', '3': 8, '4': 1, '5': 9, '10': 'fireBaseProjectId'},
    const {'1': 'fireBaseApiKey', '3': 9, '4': 1, '5': 9, '10': 'fireBaseApiKey'},
    const {'1': 'userEmail', '3': 10, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'userPassword', '3': 11, '4': 1, '5': 9, '10': 'userPassword'},
    const {'1': 'homeId', '3': 12, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `FirebaseAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firebaseAccountInformationDescriptor = $convert.base64Decode('ChpGaXJlYmFzZUFjY291bnRJbmZvcm1hdGlvbhIsChFmaXJlQmFzZVByb2plY3RJZBgIIAEoCVIRZmlyZUJhc2VQcm9qZWN0SWQSJgoOZmlyZUJhc2VBcGlLZXkYCSABKAlSDmZpcmVCYXNlQXBpS2V5EhwKCXVzZXJFbWFpbBgKIAEoCVIJdXNlckVtYWlsEiIKDHVzZXJQYXNzd29yZBgLIAEoCVIMdXNlclBhc3N3b3JkEhYKBmhvbWVJZBgMIAEoCVIGaG9tZUlk');
@$core.Deprecated('Use deviceTypesActionsDescriptor instead')
const DeviceTypesActions$json = const {
  '1': 'DeviceTypesActions',
  '2': const [
    const {'1': 'vendorsAndServices', '3': 46, '4': 1, '5': 14, '6': '.CbjHub.VendorsAndServices', '10': 'vendorsAndServices'},
    const {'1': 'deviceType', '3': 35, '4': 1, '5': 14, '6': '.CbjHub.DeviceTypes', '10': 'deviceType'},
    const {'1': 'deviceAction', '3': 36, '4': 1, '5': 14, '6': '.CbjHub.DeviceActions', '10': 'deviceAction'},
    const {'1': 'deviceStateGRPC', '3': 37, '4': 1, '5': 14, '6': '.CbjHub.DeviceStateGRPC', '10': 'deviceStateGRPC'},
  ],
};

/// Descriptor for `DeviceTypesActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceTypesActionsDescriptor = $convert.base64Decode('ChJEZXZpY2VUeXBlc0FjdGlvbnMSSgoSdmVuZG9yc0FuZFNlcnZpY2VzGC4gASgOMhouQ2JqSHViLlZlbmRvcnNBbmRTZXJ2aWNlc1ISdmVuZG9yc0FuZFNlcnZpY2VzEjMKCmRldmljZVR5cGUYIyABKA4yEy5DYmpIdWIuRGV2aWNlVHlwZXNSCmRldmljZVR5cGUSOQoMZGV2aWNlQWN0aW9uGCQgASgOMhUuQ2JqSHViLkRldmljZUFjdGlvbnNSDGRldmljZUFjdGlvbhJBCg9kZXZpY2VTdGF0ZUdSUEMYJSABKA4yFy5DYmpIdWIuRGV2aWNlU3RhdGVHUlBDUg9kZXZpY2VTdGF0ZUdSUEM=');
