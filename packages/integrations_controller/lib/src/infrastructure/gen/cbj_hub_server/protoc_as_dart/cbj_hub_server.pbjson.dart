//
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientStatusRequestsDescriptor instead')
const ClientStatusRequests$json = {
  '1': 'ClientStatusRequests',
  '2': [
    {'1': 'sendingType', '3': 41, '4': 1, '5': 9, '10': 'sendingType'},
    {'1': 'allRemoteCommands', '3': 42, '4': 1, '5': 9, '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `ClientStatusRequests`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientStatusRequestsDescriptor = $convert.base64Decode(
    'ChRDbGllbnRTdGF0dXNSZXF1ZXN0cxIgCgtzZW5kaW5nVHlwZRgpIAEoCVILc2VuZGluZ1R5cG'
    'USLAoRYWxsUmVtb3RlQ29tbWFuZHMYKiABKAlSEWFsbFJlbW90ZUNvbW1hbmRz');

@$core.Deprecated('Use requestsAndStatusFromHubDescriptor instead')
const RequestsAndStatusFromHub$json = {
  '1': 'RequestsAndStatusFromHub',
  '2': [
    {'1': 'sendingType', '3': 43, '4': 1, '5': 9, '10': 'sendingType'},
    {'1': 'allRemoteCommands', '3': 44, '4': 1, '5': 9, '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `RequestsAndStatusFromHub`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestsAndStatusFromHubDescriptor = $convert.base64Decode(
    'ChhSZXF1ZXN0c0FuZFN0YXR1c0Zyb21IdWISIAoLc2VuZGluZ1R5cGUYKyABKAlSC3NlbmRpbm'
    'dUeXBlEiwKEWFsbFJlbW90ZUNvbW1hbmRzGCwgASgJUhFhbGxSZW1vdGVDb21tYW5kcw==');

@$core.Deprecated('Use allRemoteCommandsDescriptor instead')
const AllRemoteCommands$json = {
  '1': 'AllRemoteCommands',
  '2': [
    {'1': 'smartEntityInfo', '3': 40, '4': 1, '5': 11, '6': '.CbjHub.SmartEntityInfo', '10': 'smartEntityInfo'},
  ],
};

/// Descriptor for `AllRemoteCommands`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allRemoteCommandsDescriptor = $convert.base64Decode(
    'ChFBbGxSZW1vdGVDb21tYW5kcxJBCg9zbWFydEVudGl0eUluZm8YKCABKAsyFy5DYmpIdWIuU2'
    '1hcnRFbnRpdHlJbmZvUg9zbWFydEVudGl0eUluZm8=');

@$core.Deprecated('Use firstSetupMessageDescriptor instead')
const FirstSetupMessage$json = {
  '1': 'FirstSetupMessage',
  '2': [
    {'1': 'compInfo', '3': 38, '4': 1, '5': 11, '6': '.CbjHub.CompHubInfo', '10': 'compInfo'},
    {'1': 'cloudAccountInformation', '3': 39, '4': 1, '5': 11, '6': '.CbjHub.CloudAccountInformation', '10': 'cloudAccountInformation'},
  ],
};

/// Descriptor for `FirstSetupMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firstSetupMessageDescriptor = $convert.base64Decode(
    'ChFGaXJzdFNldHVwTWVzc2FnZRIvCghjb21wSW5mbxgmIAEoCzITLkNiakh1Yi5Db21wSHViSW'
    '5mb1IIY29tcEluZm8SWQoXY2xvdWRBY2NvdW50SW5mb3JtYXRpb24YJyABKAsyHy5DYmpIdWIu'
    'Q2xvdWRBY2NvdW50SW5mb3JtYXRpb25SF2Nsb3VkQWNjb3VudEluZm9ybWF0aW9u');

@$core.Deprecated('Use compHubInfoDescriptor instead')
const CompHubInfo$json = {
  '1': 'CompHubInfo',
  '2': [
    {'1': 'cbjInfo', '3': 47, '4': 1, '5': 11, '6': '.CbjHub.CbjHubIno', '10': 'cbjInfo'},
    {'1': 'compSpecs', '3': 21, '4': 1, '5': 11, '6': '.CbjHub.CompHubSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompHubInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compHubInfoDescriptor = $convert.base64Decode(
    'CgtDb21wSHViSW5mbxIrCgdjYmpJbmZvGC8gASgLMhEuQ2JqSHViLkNiakh1Yklub1IHY2JqSW'
    '5mbxIyCgljb21wU3BlY3MYFSABKAsyFC5DYmpIdWIuQ29tcEh1YlNwZWNzUgljb21wU3BlY3M=');

@$core.Deprecated('Use cbjHubInoDescriptor instead')
const CbjHubIno$json = {
  '1': 'CbjHubIno',
  '2': [
    {'1': 'entityName', '3': 48, '4': 1, '5': 9, '10': 'entityName'},
    {'1': 'pubspecYamlVersion', '3': 27, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    {'1': 'pubspecYamlBuildNumber', '3': 51, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    {'1': 'protoLastGenDate', '3': 49, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    {'1': 'dartSdkVersion', '3': 52, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjHubIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjHubInoDescriptor = $convert.base64Decode(
    'CglDYmpIdWJJbm8SHgoKZW50aXR5TmFtZRgwIAEoCVIKZW50aXR5TmFtZRIuChJwdWJzcGVjWW'
    'FtbFZlcnNpb24YGyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVjWWFtbEJ1aWxk'
    'TnVtYmVyGDMgASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTGFzdEdlbkRhdG'
    'UYMSABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YNCABKAlSDmRhcnRT'
    'ZGtWZXJzaW9u');

@$core.Deprecated('Use compHubSpecsDescriptor instead')
const CompHubSpecs$json = {
  '1': 'CompHubSpecs',
  '2': [
    {'1': 'compId', '3': 22, '4': 1, '5': 9, '10': 'compId'},
    {'1': 'compUuid', '3': 23, '4': 1, '5': 9, '10': 'compUuid'},
    {'1': 'compOs', '3': 24, '4': 1, '5': 9, '10': 'compOs'},
    {'1': 'compModel', '3': 25, '4': 1, '5': 9, '10': 'compModel'},
    {'1': 'compType', '3': 26, '4': 1, '5': 9, '10': 'compType'},
    {'1': 'compIp', '3': 50, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompHubSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compHubSpecsDescriptor = $convert.base64Decode(
    'CgxDb21wSHViU3BlY3MSFgoGY29tcElkGBYgASgJUgZjb21wSWQSGgoIY29tcFV1aWQYFyABKA'
    'lSCGNvbXBVdWlkEhYKBmNvbXBPcxgYIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgZIAEoCVIJ'
    'Y29tcE1vZGVsEhoKCGNvbXBUeXBlGBogASgJUghjb21wVHlwZRIWCgZjb21wSXAYMiABKAlSBm'
    'NvbXBJcA==');

@$core.Deprecated('Use microcontrollerSpecsDescriptor instead')
const MicrocontrollerSpecs$json = {
  '1': 'MicrocontrollerSpecs',
  '2': [
    {'1': 'microcontrollerModel', '3': 31, '4': 1, '5': 9, '10': 'microcontrollerModel'},
    {'1': 'microcontrollerType', '3': 32, '4': 1, '5': 9, '10': 'microcontrollerType'},
    {'1': 'softwareVersion', '3': 33, '4': 1, '5': 9, '10': 'softwareVersion'},
  ],
};

/// Descriptor for `MicrocontrollerSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List microcontrollerSpecsDescriptor = $convert.base64Decode(
    'ChRNaWNyb2NvbnRyb2xsZXJTcGVjcxIyChRtaWNyb2NvbnRyb2xsZXJNb2RlbBgfIAEoCVIUbW'
    'ljcm9jb250cm9sbGVyTW9kZWwSMAoTbWljcm9jb250cm9sbGVyVHlwZRggIAEoCVITbWljcm9j'
    'b250cm9sbGVyVHlwZRIoCg9zb2Z0d2FyZVZlcnNpb24YISABKAlSD3NvZnR3YXJlVmVyc2lvbg'
    '==');

@$core.Deprecated('Use smartEntityInfoDescriptor instead')
const SmartEntityInfo$json = {
  '1': 'SmartEntityInfo',
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
    {'1': 'mqttMassage', '3': 43, '4': 1, '5': 11, '6': '.CbjHub.MqttMassage', '10': 'mqttMassage'},
    {'1': 'isComputer', '3': 29, '4': 1, '5': 8, '10': 'isComputer'},
    {'1': 'compSpecs', '3': 30, '4': 1, '5': 11, '6': '.CbjHub.CompHubSpecs', '10': 'compSpecs'},
    {'1': 'microcontrollerSpecsSpecs', '3': 31, '4': 1, '5': 11, '6': '.CbjHub.MicrocontrollerSpecs', '10': 'microcontrollerSpecsSpecs'},
    {'1': 'entityTypesActions', '3': 34, '4': 1, '5': 11, '6': '.CbjHub.EntityTypesActions', '10': 'entityTypesActions'},
  ],
};

/// Descriptor for `SmartEntityInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartEntityInfoDescriptor = $convert.base64Decode(
    'Cg9TbWFydEVudGl0eUluZm8SDgoCaWQYASABKAlSAmlkEhQKBXN0YXRlGAMgASgJUgVzdGF0ZR'
    'IgCgtkZWZhdWx0TmFtZRgOIAEoCVILZGVmYXVsdE5hbWUSFgoGYXJlYUlkGA8gASgJUgZhcmVh'
    'SWQSLAoRc2VuZGVyRGV2aWNlTW9kZWwYECABKAlSEXNlbmRlckRldmljZU1vZGVsEiYKDnNlbm'
    'RlckRldmljZU9zGBEgASgJUg5zZW5kZXJEZXZpY2VPcxIaCghzZW5kZXJJZBgSIAEoCVIIc2Vu'
    'ZGVySWQSKAoPc2VydmVyVGltZVN0YW1wGBMgASgJUg9zZXJ2ZXJUaW1lU3RhbXASIgoMc3RhdG'
    'VNYXNzYWdlGBQgASgJUgxzdGF0ZU1hc3NhZ2USNQoLbXF0dE1hc3NhZ2UYKyABKAsyEy5DYmpI'
    'dWIuTXF0dE1hc3NhZ2VSC21xdHRNYXNzYWdlEh4KCmlzQ29tcHV0ZXIYHSABKAhSCmlzQ29tcH'
    'V0ZXISMgoJY29tcFNwZWNzGB4gASgLMhQuQ2JqSHViLkNvbXBIdWJTcGVjc1IJY29tcFNwZWNz'
    'EloKGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MYHyABKAsyHC5DYmpIdWIuTWljcm9jb250cm'
    '9sbGVyU3BlY3NSGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MSSgoSZW50aXR5VHlwZXNBY3Rp'
    'b25zGCIgASgLMhouQ2JqSHViLkVudGl0eVR5cGVzQWN0aW9uc1ISZW50aXR5VHlwZXNBY3Rpb2'
    '5z');

@$core.Deprecated('Use smartEntityStatusDescriptor instead')
const SmartEntityStatus$json = {
  '1': 'SmartEntityStatus',
  '2': [
    {'1': 'onOffState', '3': 4, '4': 1, '5': 8, '10': 'onOffState'},
  ],
};

/// Descriptor for `SmartEntityStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartEntityStatusDescriptor = $convert.base64Decode(
    'ChFTbWFydEVudGl0eVN0YXR1cxIeCgpvbk9mZlN0YXRlGAQgASgIUgpvbk9mZlN0YXRl');

@$core.Deprecated('Use mqttMassageDescriptor instead')
const MqttMassage$json = {
  '1': 'MqttMassage',
  '2': [
    {'1': 'mqttTopic', '3': 44, '4': 1, '5': 9, '10': 'mqttTopic'},
    {'1': 'mqttMassage', '3': 45, '4': 1, '5': 9, '10': 'mqttMassage'},
  ],
};

/// Descriptor for `MqttMassage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mqttMassageDescriptor = $convert.base64Decode(
    'CgtNcXR0TWFzc2FnZRIcCgltcXR0VG9waWMYLCABKAlSCW1xdHRUb3BpYxIgCgttcXR0TWFzc2'
    'FnZRgtIAEoCVILbXF0dE1hc3NhZ2U=');

@$core.Deprecated('Use commendStatusDescriptor instead')
const CommendStatus$json = {
  '1': 'CommendStatus',
  '2': [
    {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commendStatusDescriptor = $convert.base64Decode(
    'Cg1Db21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYBSABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use smartEntitiesUpdateDetailsDescriptor instead')
const SmartEntitiesUpdateDetails$json = {
  '1': 'SmartEntitiesUpdateDetails',
  '2': [
    {'1': 'smartEntity', '3': 6, '4': 1, '5': 11, '6': '.CbjHub.SmartEntityInfo', '10': 'smartEntity'},
    {'1': 'newName', '3': 7, '4': 1, '5': 9, '10': 'newName'},
  ],
};

/// Descriptor for `SmartEntitiesUpdateDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartEntitiesUpdateDetailsDescriptor = $convert.base64Decode(
    'ChpTbWFydEVudGl0aWVzVXBkYXRlRGV0YWlscxI5CgtzbWFydEVudGl0eRgGIAEoCzIXLkNiak'
    'h1Yi5TbWFydEVudGl0eUluZm9SC3NtYXJ0RW50aXR5EhgKB25ld05hbWUYByABKAlSB25ld05h'
    'bWU=');

@$core.Deprecated('Use cloudAccountInformationDescriptor instead')
const CloudAccountInformation$json = {
  '1': 'CloudAccountInformation',
  '2': [
    {'1': 'cloudProjectId', '3': 8, '4': 1, '5': 9, '10': 'cloudProjectId'},
    {'1': 'cloudApiKey', '3': 9, '4': 1, '5': 9, '10': 'cloudApiKey'},
    {'1': 'userEmail', '3': 10, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'userPassword', '3': 11, '4': 1, '5': 9, '10': 'userPassword'},
    {'1': 'homeId', '3': 12, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `CloudAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cloudAccountInformationDescriptor = $convert.base64Decode(
    'ChdDbG91ZEFjY291bnRJbmZvcm1hdGlvbhImCg5jbG91ZFByb2plY3RJZBgIIAEoCVIOY2xvdW'
    'RQcm9qZWN0SWQSIAoLY2xvdWRBcGlLZXkYCSABKAlSC2Nsb3VkQXBpS2V5EhwKCXVzZXJFbWFp'
    'bBgKIAEoCVIJdXNlckVtYWlsEiIKDHVzZXJQYXNzd29yZBgLIAEoCVIMdXNlclBhc3N3b3JkEh'
    'YKBmhvbWVJZBgMIAEoCVIGaG9tZUlk');

@$core.Deprecated('Use entityTypesActionsDescriptor instead')
const EntityTypesActions$json = {
  '1': 'EntityTypesActions',
  '2': [
    {'1': 'vendorsAndServices', '3': 46, '4': 1, '5': 9, '10': 'vendorsAndServices'},
    {'1': 'entityType', '3': 35, '4': 1, '5': 9, '10': 'entityType'},
    {'1': 'entityAction', '3': 36, '4': 1, '5': 9, '10': 'entityAction'},
    {'1': 'entityStateGRPC', '3': 37, '4': 1, '5': 9, '10': 'entityStateGRPC'},
  ],
};

/// Descriptor for `EntityTypesActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityTypesActionsDescriptor = $convert.base64Decode(
    'ChJFbnRpdHlUeXBlc0FjdGlvbnMSLgoSdmVuZG9yc0FuZFNlcnZpY2VzGC4gASgJUhJ2ZW5kb3'
    'JzQW5kU2VydmljZXMSHgoKZW50aXR5VHlwZRgjIAEoCVIKZW50aXR5VHlwZRIiCgxlbnRpdHlB'
    'Y3Rpb24YJCABKAlSDGVudGl0eUFjdGlvbhIoCg9lbnRpdHlTdGF0ZUdSUEMYJSABKAlSD2VudG'
    'l0eVN0YXRlR1JQQw==');

