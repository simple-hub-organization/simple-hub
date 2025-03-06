//
//  Generated code. Do not modify.
//  source: security_bear_connections.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use securityBearSetupDescriptor instead')
const SecurityBearSetup$json = {
  '1': 'SecurityBearSetup',
  '2': [
    {'1': 'wiFiFirstPriority', '3': 3, '4': 1, '5': 11, '6': '.SecurityBearConnections.WiFiInformation', '10': 'wiFiFirstPriority'},
    {'1': 'wiFiSecondPriority', '3': 4, '4': 1, '5': 11, '6': '.SecurityBearConnections.WiFiInformation', '10': 'wiFiSecondPriority'},
  ],
};

/// Descriptor for `SecurityBearSetup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securityBearSetupDescriptor = $convert.base64Decode(
    'ChFTZWN1cml0eUJlYXJTZXR1cBJWChF3aUZpRmlyc3RQcmlvcml0eRgDIAEoCzIoLlNlY3VyaX'
    'R5QmVhckNvbm5lY3Rpb25zLldpRmlJbmZvcm1hdGlvblIRd2lGaUZpcnN0UHJpb3JpdHkSWAoS'
    'd2lGaVNlY29uZFByaW9yaXR5GAQgASgLMiguU2VjdXJpdHlCZWFyQ29ubmVjdGlvbnMuV2lGaU'
    'luZm9ybWF0aW9uUhJ3aUZpU2Vjb25kUHJpb3JpdHk=');

@$core.Deprecated('Use wiFiInformationDescriptor instead')
const WiFiInformation$json = {
  '1': 'WiFiInformation',
  '2': [
    {'1': 'wiFiName', '3': 1, '4': 1, '5': 9, '10': 'wiFiName'},
    {'1': 'wiFiPassword', '3': 2, '4': 1, '5': 9, '10': 'wiFiPassword'},
  ],
};

/// Descriptor for `WiFiInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wiFiInformationDescriptor = $convert.base64Decode(
    'Cg9XaUZpSW5mb3JtYXRpb24SGgoId2lGaU5hbWUYASABKAlSCHdpRmlOYW1lEiIKDHdpRmlQYX'
    'Nzd29yZBgCIAEoCVIMd2lGaVBhc3N3b3Jk');

@$core.Deprecated('Use sBCommendStatusDescriptor instead')
const SBCommendStatus$json = {
  '1': 'SBCommendStatus',
  '2': [
    {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SBCommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sBCommendStatusDescriptor = $convert.base64Decode(
    'Cg9TQkNvbW1lbmRTdGF0dXMSGAoHc3VjY2VzcxgFIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use sBFirebaseAccountAndSecurityBearSetupDescriptor instead')
const SBFirebaseAccountAndSecurityBearSetup$json = {
  '1': 'SBFirebaseAccountAndSecurityBearSetup',
  '2': [
    {'1': 'sBFirebaseAccountInformation', '3': 10, '4': 1, '5': 11, '6': '.SecurityBearConnections.SBFirebaseAccountInformation', '10': 'sBFirebaseAccountInformation'},
    {'1': 'securityBearSetup', '3': 11, '4': 1, '5': 11, '6': '.SecurityBearConnections.SecurityBearSetup', '10': 'securityBearSetup'},
  ],
};

/// Descriptor for `SBFirebaseAccountAndSecurityBearSetup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sBFirebaseAccountAndSecurityBearSetupDescriptor = $convert.base64Decode(
    'CiVTQkZpcmViYXNlQWNjb3VudEFuZFNlY3VyaXR5QmVhclNldHVwEnkKHHNCRmlyZWJhc2VBY2'
    'NvdW50SW5mb3JtYXRpb24YCiABKAsyNS5TZWN1cml0eUJlYXJDb25uZWN0aW9ucy5TQkZpcmVi'
    'YXNlQWNjb3VudEluZm9ybWF0aW9uUhxzQkZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uElgKEX'
    'NlY3VyaXR5QmVhclNldHVwGAsgASgLMiouU2VjdXJpdHlCZWFyQ29ubmVjdGlvbnMuU2VjdXJp'
    'dHlCZWFyU2V0dXBSEXNlY3VyaXR5QmVhclNldHVw');

@$core.Deprecated('Use sBFirebaseAccountInformationDescriptor instead')
const SBFirebaseAccountInformation$json = {
  '1': 'SBFirebaseAccountInformation',
  '2': [
    {'1': 'fireBaseProjectId', '3': 6, '4': 1, '5': 9, '10': 'fireBaseProjectId'},
    {'1': 'fireBaseApiKey', '3': 7, '4': 1, '5': 9, '10': 'fireBaseApiKey'},
    {'1': 'userEmail', '3': 8, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'userPassword', '3': 9, '4': 1, '5': 9, '10': 'userPassword'},
  ],
};

/// Descriptor for `SBFirebaseAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sBFirebaseAccountInformationDescriptor = $convert.base64Decode(
    'ChxTQkZpcmViYXNlQWNjb3VudEluZm9ybWF0aW9uEiwKEWZpcmVCYXNlUHJvamVjdElkGAYgAS'
    'gJUhFmaXJlQmFzZVByb2plY3RJZBImCg5maXJlQmFzZUFwaUtleRgHIAEoCVIOZmlyZUJhc2VB'
    'cGlLZXkSHAoJdXNlckVtYWlsGAggASgJUgl1c2VyRW1haWwSIgoMdXNlclBhc3N3b3JkGAkgAS'
    'gJUgx1c2VyUGFzc3dvcmQ=');

@$core.Deprecated('Use compSecurityBearInfoDescriptor instead')
const CompSecurityBearInfo$json = {
  '1': 'CompSecurityBearInfo',
  '2': [
    {'1': 'cbjInfo', '3': 12, '4': 1, '5': 11, '6': '.SecurityBearConnections.CbjSecurityBearIno', '10': 'cbjInfo'},
    {'1': 'compSpecs', '3': 13, '4': 1, '5': 11, '6': '.SecurityBearConnections.CompSecurityBearSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompSecurityBearInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compSecurityBearInfoDescriptor = $convert.base64Decode(
    'ChRDb21wU2VjdXJpdHlCZWFySW5mbxJFCgdjYmpJbmZvGAwgASgLMisuU2VjdXJpdHlCZWFyQ2'
    '9ubmVjdGlvbnMuQ2JqU2VjdXJpdHlCZWFySW5vUgdjYmpJbmZvEkwKCWNvbXBTcGVjcxgNIAEo'
    'CzIuLlNlY3VyaXR5QmVhckNvbm5lY3Rpb25zLkNvbXBTZWN1cml0eUJlYXJTcGVjc1IJY29tcF'
    'NwZWNz');

@$core.Deprecated('Use cbjSecurityBearInoDescriptor instead')
const CbjSecurityBearIno$json = {
  '1': 'CbjSecurityBearIno',
  '2': [
    {'1': 'deviceName', '3': 14, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'pubspecYamlVersion', '3': 15, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    {'1': 'pubspecYamlBuildNumber', '3': 23, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    {'1': 'protoLastGenDate', '3': 16, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    {'1': 'dartSdkVersion', '3': 24, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjSecurityBearIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjSecurityBearInoDescriptor = $convert.base64Decode(
    'ChJDYmpTZWN1cml0eUJlYXJJbm8SHgoKZGV2aWNlTmFtZRgOIAEoCVIKZGV2aWNlTmFtZRIuCh'
    'JwdWJzcGVjWWFtbFZlcnNpb24YDyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVj'
    'WWFtbEJ1aWxkTnVtYmVyGBcgASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTG'
    'FzdEdlbkRhdGUYECABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YGCAB'
    'KAlSDmRhcnRTZGtWZXJzaW9u');

@$core.Deprecated('Use compSecurityBearSpecsDescriptor instead')
const CompSecurityBearSpecs$json = {
  '1': 'CompSecurityBearSpecs',
  '2': [
    {'1': 'compId', '3': 17, '4': 1, '5': 9, '10': 'compId'},
    {'1': 'compUuid', '3': 18, '4': 1, '5': 9, '10': 'compUuid'},
    {'1': 'compOs', '3': 19, '4': 1, '5': 9, '10': 'compOs'},
    {'1': 'compModel', '3': 20, '4': 1, '5': 9, '10': 'compModel'},
    {'1': 'compType', '3': 21, '4': 1, '5': 9, '10': 'compType'},
    {'1': 'compIp', '3': 22, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompSecurityBearSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compSecurityBearSpecsDescriptor = $convert.base64Decode(
    'ChVDb21wU2VjdXJpdHlCZWFyU3BlY3MSFgoGY29tcElkGBEgASgJUgZjb21wSWQSGgoIY29tcF'
    'V1aWQYEiABKAlSCGNvbXBVdWlkEhYKBmNvbXBPcxgTIAEoCVIGY29tcE9zEhwKCWNvbXBNb2Rl'
    'bBgUIAEoCVIJY29tcE1vZGVsEhoKCGNvbXBUeXBlGBUgASgJUghjb21wVHlwZRIWCgZjb21wSX'
    'AYFiABKAlSBmNvbXBJcA==');

