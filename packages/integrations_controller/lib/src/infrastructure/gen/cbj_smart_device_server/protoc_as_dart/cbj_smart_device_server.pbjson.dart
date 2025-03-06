//
//  Generated code. Do not modify.
//  source: cbj_smart_device_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cbjDeviceTypesDescriptor instead')
const CbjDeviceTypes$json = {
  '1': 'CbjDeviceTypes',
  '2': [
    {'1': 'typeNotSupported', '2': 0},
    {'1': 'light', '2': 1},
    {'1': 'blinds', '2': 2},
    {'1': 'boiler', '2': 3},
    {'1': 'button', '2': 4},
    {'1': 'buttonWithLight', '2': 5},
    {'1': 'hub', '2': 7},
    {'1': 'phoneApp', '2': 8},
    {'1': 'computerApp', '2': 9},
    {'1': 'browserApp', '2': 10},
    {'1': 'smartComputer', '2': 11},
    {'1': 'smart_camera', '2': 12},
  ],
};

/// Descriptor for `CbjDeviceTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjDeviceTypesDescriptor = $convert.base64Decode(
    'Cg5DYmpEZXZpY2VUeXBlcxIUChB0eXBlTm90U3VwcG9ydGVkEAASCQoFbGlnaHQQARIKCgZibG'
    'luZHMQAhIKCgZib2lsZXIQAxIKCgZidXR0b24QBBITCg9idXR0b25XaXRoTGlnaHQQBRIHCgNo'
    'dWIQBxIMCghwaG9uZUFwcBAIEg8KC2NvbXB1dGVyQXBwEAkSDgoKYnJvd3NlckFwcBAKEhEKDX'
    'NtYXJ0Q29tcHV0ZXIQCxIQCgxzbWFydF9jYW1lcmEQDA==');

@$core.Deprecated('Use cbjDeviceActionsDescriptor instead')
const CbjDeviceActions$json = {
  '1': 'CbjDeviceActions',
  '2': [
    {'1': 'actionNotSupported', '2': 0},
    {'1': 'on', '2': 1},
    {'1': 'off', '2': 2},
    {'1': 'moveUp', '2': 3},
    {'1': 'stop', '2': 4},
    {'1': 'moveDown', '2': 5},
    {'1': 'pressed', '2': 6},
    {'1': 'longPress', '2': 7},
    {'1': 'doubleTap', '2': 8},
    {'1': 'position', '2': 9},
    {'1': 'suspend', '2': 10},
    {'1': 'shutdown', '2': 11},
    {'1': 'itIsFalse', '2': 12},
    {'1': 'itIsTrue', '2': 13},
    {'1': 'startVideoStream', '2': 14},
    {'1': 'motionDetected', '2': 15},
  ],
};

/// Descriptor for `CbjDeviceActions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjDeviceActionsDescriptor = $convert.base64Decode(
    'ChBDYmpEZXZpY2VBY3Rpb25zEhYKEmFjdGlvbk5vdFN1cHBvcnRlZBAAEgYKAm9uEAESBwoDb2'
    'ZmEAISCgoGbW92ZVVwEAMSCAoEc3RvcBAEEgwKCG1vdmVEb3duEAUSCwoHcHJlc3NlZBAGEg0K'
    'CWxvbmdQcmVzcxAHEg0KCWRvdWJsZVRhcBAIEgwKCHBvc2l0aW9uEAkSCwoHc3VzcGVuZBAKEg'
    'wKCHNodXRkb3duEAsSDQoJaXRJc0ZhbHNlEAwSDAoIaXRJc1RydWUQDRIUChBzdGFydFZpZGVv'
    'U3RyZWFtEA4SEgoObW90aW9uRGV0ZWN0ZWQQDw==');

@$core.Deprecated('Use cbjWhenToExecuteDescriptor instead')
const CbjWhenToExecute$json = {
  '1': 'CbjWhenToExecute',
  '2': [
    {'1': 'undefined', '2': 0},
    {'1': 'onOddNumberPress', '2': 1},
    {'1': 'evenNumberPress', '2': 2},
    {'1': 'betweenSelectedTime', '2': 3},
    {'1': 'doNotBetweenSelectedTime', '2': 4},
    {'1': 'allTheTime', '2': 5},
    {'1': 'never', '2': 6},
    {'1': 'onceNow', '2': 7},
    {'1': 'onceInSelectedTime', '2': 8},
    {'1': 'onlyIfDeviceListIsAreInActionListState', '2': 9},
    {'1': 'atHome', '2': 10},
    {'1': 'outOfHome', '2': 11},
  ],
};

/// Descriptor for `CbjWhenToExecute`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjWhenToExecuteDescriptor = $convert.base64Decode(
    'ChBDYmpXaGVuVG9FeGVjdXRlEg0KCXVuZGVmaW5lZBAAEhQKEG9uT2RkTnVtYmVyUHJlc3MQAR'
    'ITCg9ldmVuTnVtYmVyUHJlc3MQAhIXChNiZXR3ZWVuU2VsZWN0ZWRUaW1lEAMSHAoYZG9Ob3RC'
    'ZXR3ZWVuU2VsZWN0ZWRUaW1lEAQSDgoKYWxsVGhlVGltZRAFEgkKBW5ldmVyEAYSCwoHb25jZU'
    '5vdxAHEhYKEm9uY2VJblNlbGVjdGVkVGltZRAIEioKJm9ubHlJZkRldmljZUxpc3RJc0FyZUlu'
    'QWN0aW9uTGlzdFN0YXRlEAkSCgoGYXRIb21lEAoSDQoJb3V0T2ZIb21lEAs=');

@$core.Deprecated('Use cbjDeviceStateGRPCDescriptor instead')
const CbjDeviceStateGRPC$json = {
  '1': 'CbjDeviceStateGRPC',
  '2': [
    {'1': 'stateNotSupported', '2': 0},
    {'1': 'cancelStateInProcess', '2': 1},
    {'1': 'ack', '2': 2},
    {'1': 'newStateFailed', '2': 3},
    {'1': 'waitingInComp', '2': 4},
  ],
};

/// Descriptor for `CbjDeviceStateGRPC`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cbjDeviceStateGRPCDescriptor = $convert.base64Decode(
    'ChJDYmpEZXZpY2VTdGF0ZUdSUEMSFQoRc3RhdGVOb3RTdXBwb3J0ZWQQABIYChRjYW5jZWxTdG'
    'F0ZUluUHJvY2VzcxABEgcKA2FjaxACEhIKDm5ld1N0YXRlRmFpbGVkEAMSEQoNd2FpdGluZ0lu'
    'Q29tcBAE');

@$core.Deprecated('Use cbjClientStatusRequestsDescriptor instead')
const CbjClientStatusRequests$json = {
  '1': 'CbjClientStatusRequests',
  '2': [
    {'1': 'allRemoteCommands', '3': 41, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjAllRemoteCommands', '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `CbjClientStatusRequests`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjClientStatusRequestsDescriptor = $convert.base64Decode(
    'ChdDYmpDbGllbnRTdGF0dXNSZXF1ZXN0cxJdChFhbGxSZW1vdGVDb21tYW5kcxgpIAEoCzIvLk'
    'NialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqQWxsUmVtb3RlQ29tbWFuZHNSEWFsbFJlbW90'
    'ZUNvbW1hbmRz');

@$core.Deprecated('Use cbjRequestsAndStatusFromHubDescriptor instead')
const CbjRequestsAndStatusFromHub$json = {
  '1': 'CbjRequestsAndStatusFromHub',
  '2': [
    {'1': 'allRemoteCommands', '3': 42, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjAllRemoteCommands', '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `CbjRequestsAndStatusFromHub`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjRequestsAndStatusFromHubDescriptor = $convert.base64Decode(
    'ChtDYmpSZXF1ZXN0c0FuZFN0YXR1c0Zyb21IdWISXQoRYWxsUmVtb3RlQ29tbWFuZHMYKiABKA'
    'syLy5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNiakFsbFJlbW90ZUNvbW1hbmRzUhFhbGxS'
    'ZW1vdGVDb21tYW5kcw==');

@$core.Deprecated('Use cbjAllRemoteCommandsDescriptor instead')
const CbjAllRemoteCommands$json = {
  '1': 'CbjAllRemoteCommands',
  '2': [
    {'1': 'smartDeviceInfo', '3': 40, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjSmartDeviceInfo', '10': 'smartDeviceInfo'},
  ],
};

/// Descriptor for `CbjAllRemoteCommands`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjAllRemoteCommandsDescriptor = $convert.base64Decode(
    'ChRDYmpBbGxSZW1vdGVDb21tYW5kcxJXCg9zbWFydERldmljZUluZm8YKCABKAsyLS5DYmpTbW'
    'FydERldmljZUNvbm5lY3Rpb25zLkNialNtYXJ0RGV2aWNlSW5mb1IPc21hcnREZXZpY2VJbmZv');

@$core.Deprecated('Use cbjFirstSetupMessageDescriptor instead')
const CbjFirstSetupMessage$json = {
  '1': 'CbjFirstSetupMessage',
  '2': [
    {'1': 'compInfo', '3': 38, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjCompSmartDeviceInfo', '10': 'compInfo'},
    {'1': 'firebaseAccountInformation', '3': 39, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjFirebaseAccountInformation', '10': 'firebaseAccountInformation'},
  ],
};

/// Descriptor for `CbjFirstSetupMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjFirstSetupMessageDescriptor = $convert.base64Decode(
    'ChRDYmpGaXJzdFNldHVwTWVzc2FnZRJNCghjb21wSW5mbxgmIAEoCzIxLkNialNtYXJ0RGV2aW'
    'NlQ29ubmVjdGlvbnMuQ2JqQ29tcFNtYXJ0RGV2aWNlSW5mb1IIY29tcEluZm8SeAoaZmlyZWJh'
    'c2VBY2NvdW50SW5mb3JtYXRpb24YJyABKAsyOC5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLk'
    'NiakZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uUhpmaXJlYmFzZUFjY291bnRJbmZvcm1hdGlv'
    'bg==');

@$core.Deprecated('Use cbjCompSmartDeviceInfoDescriptor instead')
const CbjCompSmartDeviceInfo$json = {
  '1': 'CbjCompSmartDeviceInfo',
  '2': [
    {'1': 'compSpecs', '3': 21, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjCompSpecs', '10': 'compSpecs'},
    {'1': 'smartDevicesInComp', '3': 28, '4': 3, '5': 11, '6': '.CbjSmartDeviceConnections.CbjSmartDeviceInfo', '10': 'smartDevicesInComp'},
  ],
};

/// Descriptor for `CbjCompSmartDeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjCompSmartDeviceInfoDescriptor = $convert.base64Decode(
    'ChZDYmpDb21wU21hcnREZXZpY2VJbmZvEkUKCWNvbXBTcGVjcxgVIAEoCzInLkNialNtYXJ0RG'
    'V2aWNlQ29ubmVjdGlvbnMuQ2JqQ29tcFNwZWNzUgljb21wU3BlY3MSXQoSc21hcnREZXZpY2Vz'
    'SW5Db21wGBwgAygLMi0uQ2JqU21hcnREZXZpY2VDb25uZWN0aW9ucy5DYmpTbWFydERldmljZU'
    'luZm9SEnNtYXJ0RGV2aWNlc0luQ29tcA==');

@$core.Deprecated('Use cbjCompSpecsDescriptor instead')
const CbjCompSpecs$json = {
  '1': 'CbjCompSpecs',
  '2': [
    {'1': 'compId', '3': 22, '4': 1, '5': 9, '10': 'compId'},
    {'1': 'compUuid', '3': 23, '4': 1, '5': 9, '10': 'compUuid'},
    {'1': 'compOs', '3': 24, '4': 1, '5': 9, '10': 'compOs'},
    {'1': 'compModel', '3': 25, '4': 1, '5': 9, '10': 'compModel'},
    {'1': 'compType', '3': 26, '4': 1, '5': 9, '10': 'compType'},
    {'1': 'pubspecYamlVersion', '3': 27, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
  ],
};

/// Descriptor for `CbjCompSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjCompSpecsDescriptor = $convert.base64Decode(
    'CgxDYmpDb21wU3BlY3MSFgoGY29tcElkGBYgASgJUgZjb21wSWQSGgoIY29tcFV1aWQYFyABKA'
    'lSCGNvbXBVdWlkEhYKBmNvbXBPcxgYIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgZIAEoCVIJ'
    'Y29tcE1vZGVsEhoKCGNvbXBUeXBlGBogASgJUghjb21wVHlwZRIuChJwdWJzcGVjWWFtbFZlcn'
    'Npb24YGyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbg==');

@$core.Deprecated('Use cbjMicrocontrollerSpecsDescriptor instead')
const CbjMicrocontrollerSpecs$json = {
  '1': 'CbjMicrocontrollerSpecs',
  '2': [
    {'1': 'microcontrollerModel', '3': 31, '4': 1, '5': 9, '10': 'microcontrollerModel'},
    {'1': 'microcontrollerType', '3': 32, '4': 1, '5': 9, '10': 'microcontrollerType'},
    {'1': 'softwareVersion', '3': 33, '4': 1, '5': 9, '10': 'softwareVersion'},
  ],
};

/// Descriptor for `CbjMicrocontrollerSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjMicrocontrollerSpecsDescriptor = $convert.base64Decode(
    'ChdDYmpNaWNyb2NvbnRyb2xsZXJTcGVjcxIyChRtaWNyb2NvbnRyb2xsZXJNb2RlbBgfIAEoCV'
    'IUbWljcm9jb250cm9sbGVyTW9kZWwSMAoTbWljcm9jb250cm9sbGVyVHlwZRggIAEoCVITbWlj'
    'cm9jb250cm9sbGVyVHlwZRIoCg9zb2Z0d2FyZVZlcnNpb24YISABKAlSD3NvZnR3YXJlVmVyc2'
    'lvbg==');

@$core.Deprecated('Use cbjSmartDeviceInfoDescriptor instead')
const CbjSmartDeviceInfo$json = {
  '1': 'CbjSmartDeviceInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'state', '3': 3, '4': 1, '5': 9, '10': 'state'},
    {'1': 'defaultName', '3': 14, '4': 1, '5': 9, '10': 'defaultName'},
    {'1': 'areaId', '3': 15, '4': 1, '5': 9, '10': 'areaId'},
    {'1': 'senderDeviceModel', '3': 16, '4': 1, '5': 9, '10': 'senderDeviceModel'},
    {'1': 'senderDeviceOs', '3': 17, '4': 1, '5': 9, '10': 'senderDeviceOs'},
    {'1': 'senderId', '3': 18, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'serverTimeStamp', '3': 19, '4': 1, '5': 9, '10': 'serverTimeStamp'},
    {'1': 'stateMassage', '3': 20, '4': 1, '5': 9, '10': 'stateMassage'},
    {'1': 'isComputer', '3': 29, '4': 1, '5': 8, '10': 'isComputer'},
    {'1': 'compSpecs', '3': 30, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjCompSpecs', '10': 'compSpecs'},
    {'1': 'microcontrollerSpecsSpecs', '3': 31, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjMicrocontrollerSpecs', '10': 'microcontrollerSpecsSpecs'},
    {'1': 'deviceTypesActions', '3': 34, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjDeviceTypesActions', '10': 'deviceTypesActions'},
  ],
};

/// Descriptor for `CbjSmartDeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSmartDeviceInfoDescriptor = $convert.base64Decode(
    'ChJDYmpTbWFydERldmljZUluZm8SDgoCaWQYASABKAlSAmlkEhQKBXN0YXRlGAMgASgJUgVzdG'
    'F0ZRIgCgtkZWZhdWx0TmFtZRgOIAEoCVILZGVmYXVsdE5hbWUSFgoGYXJlYUlkGA8gASgJUgZh'
    'cmVhSWQSLAoRc2VuZGVyRGV2aWNlTW9kZWwYECABKAlSEXNlbmRlckRldmljZU1vZGVsEiYKDn'
    'NlbmRlckRldmljZU9zGBEgASgJUg5zZW5kZXJEZXZpY2VPcxIaCghzZW5kZXJJZBgSIAEoCVII'
    'c2VuZGVySWQSKAoPc2VydmVyVGltZVN0YW1wGBMgASgJUg9zZXJ2ZXJUaW1lU3RhbXASIgoMc3'
    'RhdGVNYXNzYWdlGBQgASgJUgxzdGF0ZU1hc3NhZ2USHgoKaXNDb21wdXRlchgdIAEoCFIKaXND'
    'b21wdXRlchJFCgljb21wU3BlY3MYHiABKAsyJy5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLk'
    'NiakNvbXBTcGVjc1IJY29tcFNwZWNzEnAKGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MYHyAB'
    'KAsyMi5DYmpTbWFydERldmljZUNvbm5lY3Rpb25zLkNiak1pY3JvY29udHJvbGxlclNwZWNzUh'
    'ltaWNyb2NvbnRyb2xsZXJTcGVjc1NwZWNzEmAKEmRldmljZVR5cGVzQWN0aW9ucxgiIAEoCzIw'
    'LkNialNtYXJ0RGV2aWNlQ29ubmVjdGlvbnMuQ2JqRGV2aWNlVHlwZXNBY3Rpb25zUhJkZXZpY2'
    'VUeXBlc0FjdGlvbnM=');

@$core.Deprecated('Use cbjSmartDeviceStatusDescriptor instead')
const CbjSmartDeviceStatus$json = {
  '1': 'CbjSmartDeviceStatus',
  '2': [
    {'1': 'onOffState', '3': 4, '4': 1, '5': 8, '10': 'onOffState'},
  ],
};

/// Descriptor for `CbjSmartDeviceStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSmartDeviceStatusDescriptor = $convert.base64Decode(
    'ChRDYmpTbWFydERldmljZVN0YXR1cxIeCgpvbk9mZlN0YXRlGAQgASgIUgpvbk9mZlN0YXRl');

@$core.Deprecated('Use cbjCommendStatusDescriptor instead')
const CbjCommendStatus$json = {
  '1': 'CbjCommendStatus',
  '2': [
    {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CbjCommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjCommendStatusDescriptor = $convert.base64Decode(
    'ChBDYmpDb21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYBSABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use cbjSmartDeviceUpdateDetailsDescriptor instead')
const CbjSmartDeviceUpdateDetails$json = {
  '1': 'CbjSmartDeviceUpdateDetails',
  '2': [
    {'1': 'smartDevice', '3': 6, '4': 1, '5': 11, '6': '.CbjSmartDeviceConnections.CbjSmartDeviceInfo', '10': 'smartDevice'},
    {'1': 'newName', '3': 7, '4': 1, '5': 9, '10': 'newName'},
  ],
};

/// Descriptor for `CbjSmartDeviceUpdateDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSmartDeviceUpdateDetailsDescriptor = $convert.base64Decode(
    'ChtDYmpTbWFydERldmljZVVwZGF0ZURldGFpbHMSTwoLc21hcnREZXZpY2UYBiABKAsyLS5DYm'
    'pTbWFydERldmljZUNvbm5lY3Rpb25zLkNialNtYXJ0RGV2aWNlSW5mb1ILc21hcnREZXZpY2US'
    'GAoHbmV3TmFtZRgHIAEoCVIHbmV3TmFtZQ==');

@$core.Deprecated('Use cbjFirebaseAccountInformationDescriptor instead')
const CbjFirebaseAccountInformation$json = {
  '1': 'CbjFirebaseAccountInformation',
  '2': [
    {'1': 'fireBaseProjectId', '3': 8, '4': 1, '5': 9, '10': 'fireBaseProjectId'},
    {'1': 'fireBaseApiKey', '3': 9, '4': 1, '5': 9, '10': 'fireBaseApiKey'},
    {'1': 'userEmail', '3': 10, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'userPassword', '3': 11, '4': 1, '5': 9, '10': 'userPassword'},
    {'1': 'homeId', '3': 12, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `CbjFirebaseAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjFirebaseAccountInformationDescriptor = $convert.base64Decode(
    'Ch1DYmpGaXJlYmFzZUFjY291bnRJbmZvcm1hdGlvbhIsChFmaXJlQmFzZVByb2plY3RJZBgIIA'
    'EoCVIRZmlyZUJhc2VQcm9qZWN0SWQSJgoOZmlyZUJhc2VBcGlLZXkYCSABKAlSDmZpcmVCYXNl'
    'QXBpS2V5EhwKCXVzZXJFbWFpbBgKIAEoCVIJdXNlckVtYWlsEiIKDHVzZXJQYXNzd29yZBgLIA'
    'EoCVIMdXNlclBhc3N3b3JkEhYKBmhvbWVJZBgMIAEoCVIGaG9tZUlk');

@$core.Deprecated('Use cbjDeviceTypesActionsDescriptor instead')
const CbjDeviceTypesActions$json = {
  '1': 'CbjDeviceTypesActions',
  '2': [
    {'1': 'deviceType', '3': 35, '4': 1, '5': 14, '6': '.CbjSmartDeviceConnections.CbjDeviceTypes', '10': 'deviceType'},
    {'1': 'deviceAction', '3': 36, '4': 1, '5': 14, '6': '.CbjSmartDeviceConnections.CbjDeviceActions', '10': 'deviceAction'},
    {'1': 'deviceStateGRPC', '3': 37, '4': 1, '5': 14, '6': '.CbjSmartDeviceConnections.CbjDeviceStateGRPC', '10': 'deviceStateGRPC'},
  ],
};

/// Descriptor for `CbjDeviceTypesActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjDeviceTypesActionsDescriptor = $convert.base64Decode(
    'ChVDYmpEZXZpY2VUeXBlc0FjdGlvbnMSSQoKZGV2aWNlVHlwZRgjIAEoDjIpLkNialNtYXJ0RG'
    'V2aWNlQ29ubmVjdGlvbnMuQ2JqRGV2aWNlVHlwZXNSCmRldmljZVR5cGUSTwoMZGV2aWNlQWN0'
    'aW9uGCQgASgOMisuQ2JqU21hcnREZXZpY2VDb25uZWN0aW9ucy5DYmpEZXZpY2VBY3Rpb25zUg'
    'xkZXZpY2VBY3Rpb24SVwoPZGV2aWNlU3RhdGVHUlBDGCUgASgOMi0uQ2JqU21hcnREZXZpY2VD'
    'b25uZWN0aW9ucy5DYmpEZXZpY2VTdGF0ZUdSUENSD2RldmljZVN0YXRlR1JQQw==');

