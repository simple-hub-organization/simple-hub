///
//  Generated code. Do not modify.
//  source: security_bear_connections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use securityBearSetupDescriptor instead')
const SecurityBearSetup$json = const {
  '1': 'SecurityBearSetup',
  '2': const [
    const {'1': 'wiFiFirstPriority', '3': 3, '4': 1, '5': 11, '6': '.SecurityBearConnections.WiFiInformation', '10': 'wiFiFirstPriority'},
    const {'1': 'wiFiSecondPriority', '3': 4, '4': 1, '5': 11, '6': '.SecurityBearConnections.WiFiInformation', '10': 'wiFiSecondPriority'},
  ],
};

/// Descriptor for `SecurityBearSetup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securityBearSetupDescriptor = $convert.base64Decode('ChFTZWN1cml0eUJlYXJTZXR1cBJWChF3aUZpRmlyc3RQcmlvcml0eRgDIAEoCzIoLlNlY3VyaXR5QmVhckNvbm5lY3Rpb25zLldpRmlJbmZvcm1hdGlvblIRd2lGaUZpcnN0UHJpb3JpdHkSWAoSd2lGaVNlY29uZFByaW9yaXR5GAQgASgLMiguU2VjdXJpdHlCZWFyQ29ubmVjdGlvbnMuV2lGaUluZm9ybWF0aW9uUhJ3aUZpU2Vjb25kUHJpb3JpdHk=');
@$core.Deprecated('Use wiFiInformationDescriptor instead')
const WiFiInformation$json = const {
  '1': 'WiFiInformation',
  '2': const [
    const {'1': 'wiFiName', '3': 1, '4': 1, '5': 9, '10': 'wiFiName'},
    const {'1': 'wiFiPassword', '3': 2, '4': 1, '5': 9, '10': 'wiFiPassword'},
  ],
};

/// Descriptor for `WiFiInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wiFiInformationDescriptor = $convert.base64Decode('Cg9XaUZpSW5mb3JtYXRpb24SGgoId2lGaU5hbWUYASABKAlSCHdpRmlOYW1lEiIKDHdpRmlQYXNzd29yZBgCIAEoCVIMd2lGaVBhc3N3b3Jk');
@$core.Deprecated('Use sBCommendStatusDescriptor instead')
const SBCommendStatus$json = const {
  '1': 'SBCommendStatus',
  '2': const [
    const {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SBCommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sBCommendStatusDescriptor = $convert.base64Decode('Cg9TQkNvbW1lbmRTdGF0dXMSGAoHc3VjY2VzcxgFIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use sBFirebaseAccountAndSecurityBearSetupDescriptor instead')
const SBFirebaseAccountAndSecurityBearSetup$json = const {
  '1': 'SBFirebaseAccountAndSecurityBearSetup',
  '2': const [
    const {'1': 'sBFirebaseAccountInformation', '3': 10, '4': 1, '5': 11, '6': '.SecurityBearConnections.SBFirebaseAccountInformation', '10': 'sBFirebaseAccountInformation'},
    const {'1': 'securityBearSetup', '3': 11, '4': 1, '5': 11, '6': '.SecurityBearConnections.SecurityBearSetup', '10': 'securityBearSetup'},
  ],
};

/// Descriptor for `SBFirebaseAccountAndSecurityBearSetup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sBFirebaseAccountAndSecurityBearSetupDescriptor = $convert.base64Decode('CiVTQkZpcmViYXNlQWNjb3VudEFuZFNlY3VyaXR5QmVhclNldHVwEnkKHHNCRmlyZWJhc2VBY2NvdW50SW5mb3JtYXRpb24YCiABKAsyNS5TZWN1cml0eUJlYXJDb25uZWN0aW9ucy5TQkZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uUhxzQkZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uElgKEXNlY3VyaXR5QmVhclNldHVwGAsgASgLMiouU2VjdXJpdHlCZWFyQ29ubmVjdGlvbnMuU2VjdXJpdHlCZWFyU2V0dXBSEXNlY3VyaXR5QmVhclNldHVw');
@$core.Deprecated('Use sBFirebaseAccountInformationDescriptor instead')
const SBFirebaseAccountInformation$json = const {
  '1': 'SBFirebaseAccountInformation',
  '2': const [
    const {'1': 'fireBaseProjectId', '3': 6, '4': 1, '5': 9, '10': 'fireBaseProjectId'},
    const {'1': 'fireBaseApiKey', '3': 7, '4': 1, '5': 9, '10': 'fireBaseApiKey'},
    const {'1': 'userEmail', '3': 8, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'userPassword', '3': 9, '4': 1, '5': 9, '10': 'userPassword'},
  ],
};

/// Descriptor for `SBFirebaseAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sBFirebaseAccountInformationDescriptor = $convert.base64Decode('ChxTQkZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uEiwKEWZpcmVCYXNlUHJvamVjdElkGAYgASgJUhFmaXJlQmFzZVByb2plY3RJZBImCg5maXJlQmFzZUFwaUtleRgHIAEoCVIOZmlyZUJhc2VBcGlLZXkSHAoJdXNlckVtYWlsGAggASgJUgl1c2VyRW1haWwSIgoMdXNlclBhc3N3b3JkGAkgASgJUgx1c2VyUGFzc3dvcmQ=');
@$core.Deprecated('Use compSecurityBearInfoDescriptor instead')
const CompSecurityBearInfo$json = const {
  '1': 'CompSecurityBearInfo',
  '2': const [
    const {'1': 'cbjInfo', '3': 12, '4': 1, '5': 11, '6': '.SecurityBearConnections.CbjSecurityBearIno', '10': 'cbjInfo'},
    const {'1': 'compSpecs', '3': 13, '4': 1, '5': 11, '6': '.SecurityBearConnections.CompSecurityBearSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompSecurityBearInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compSecurityBearInfoDescriptor = $convert.base64Decode('ChRDb21wU2VjdXJpdHlCZWFySW5mbxJFCgdjYmpJbmZvGAwgASgLMisuU2VjdXJpdHlCZWFyQ29ubmVjdGlvbnMuQ2JqU2VjdXJpdHlCZWFySW5vUgdjYmpJbmZvEkwKCWNvbXBTcGVjcxgNIAEoCzIuLlNlY3VyaXR5QmVhckNvbm5lY3Rpb25zLkNvbXBTZWN1cml0eUJlYXJTcGVjc1IJY29tcFNwZWNz');
@$core.Deprecated('Use cbjSecurityBearInoDescriptor instead')
const CbjSecurityBearIno$json = const {
  '1': 'CbjSecurityBearIno',
  '2': const [
    const {'1': 'deviceName', '3': 14, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'pubspecYamlVersion', '3': 15, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    const {'1': 'pubspecYamlBuildNumber', '3': 23, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    const {'1': 'protoLastGenDate', '3': 16, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    const {'1': 'dartSdkVersion', '3': 24, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjSecurityBearIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSecurityBearInoDescriptor = $convert.base64Decode('ChJDYmpTZWN1cml0eUJlYXJJbm8SHgoKZGV2aWNlTmFtZRgOIAEoCVIKZGV2aWNlTmFtZRIuChJwdWJzcGVjWWFtbFZlcnNpb24YDyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyGBcgASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTGFzdEdlbkRhdGUYECABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YGCABKAlSDmRhcnRTZGtWZXJzaW9u');
@$core.Deprecated('Use compSecurityBearSpecsDescriptor instead')
const CompSecurityBearSpecs$json = const {
  '1': 'CompSecurityBearSpecs',
  '2': const [
    const {'1': 'compId', '3': 17, '4': 1, '5': 9, '10': 'compId'},
    const {'1': 'compUuid', '3': 18, '4': 1, '5': 9, '10': 'compUuid'},
    const {'1': 'compOs', '3': 19, '4': 1, '5': 9, '10': 'compOs'},
    const {'1': 'compModel', '3': 20, '4': 1, '5': 9, '10': 'compModel'},
    const {'1': 'compType', '3': 21, '4': 1, '5': 9, '10': 'compType'},
    const {'1': 'compIp', '3': 22, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompSecurityBearSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compSecurityBearSpecsDescriptor = $convert.base64Decode('ChVDb21wU2VjdXJpdHlCZWFyU3BlY3MSFgoGY29tcElkGBEgASgJUgZjb21wSWQSGgoIY29tcFV1aWQYEiABKAlSCGNvbXBVdWlkEhYKBmNvbXBPcxgTIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgUIAEoCVIJY29tcE1vZGVsEhoKCGNvbXBUeXBlGBUgASgJUghjb21wVHlwZRIWCgZjb21wSXAYFiABKAlSBmNvbXBJcA==');
