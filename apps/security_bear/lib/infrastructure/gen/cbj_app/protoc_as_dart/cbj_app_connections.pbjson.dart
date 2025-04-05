///
//  Generated code. Do not modify.
//  source: cbj_app_connections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use compInfoSBDescriptor instead')
const CompInfoSB$json = const {
  '1': 'CompInfoSB',
  '2': const [
    const {'1': 'compIP', '3': 2, '4': 1, '5': 9, '10': 'compIP'},
  ],
};

/// Descriptor for `CompInfoSB`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compInfoSBDescriptor = $convert.base64Decode('CgpDb21wSW5mb1NCEhYKBmNvbXBJUBgCIAEoCVIGY29tcElQ');
@$core.Deprecated('Use cBJCommendStatusDescriptor instead')
const CBJCommendStatus$json = const {
  '1': 'CBJCommendStatus',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CBJCommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cBJCommendStatusDescriptor = $convert.base64Decode('ChBDQkpDb21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use compAppInfoDescriptor instead')
const CompAppInfo$json = const {
  '1': 'CompAppInfo',
  '2': const [
    const {'1': 'cbjInfo', '3': 3, '4': 1, '5': 11, '6': '.CBJAppConnections.CbjAppIno', '10': 'cbjInfo'},
    const {'1': 'compSpecs', '3': 4, '4': 1, '5': 11, '6': '.CBJAppConnections.CompAppSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompAppInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compAppInfoDescriptor = $convert.base64Decode('CgtDb21wQXBwSW5mbxI2CgdjYmpJbmZvGAMgASgLMhwuQ0JKQXBwQ29ubmVjdGlvbnMuQ2JqQXBwSW5vUgdjYmpJbmZvEj0KCWNvbXBTcGVjcxgEIAEoCzIfLkNCSkFwcENvbm5lY3Rpb25zLkNvbXBBcHBTcGVjc1IJY29tcFNwZWNz');
@$core.Deprecated('Use cbjAppInoDescriptor instead')
const CbjAppIno$json = const {
  '1': 'CbjAppIno',
  '2': const [
    const {'1': 'deviceName', '3': 5, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'pubspecYamlVersion', '3': 6, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    const {'1': 'pubspecYamlBuildNumber', '3': 14, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    const {'1': 'protoLastGenDate', '3': 7, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    const {'1': 'dartSdkVersion', '3': 15, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjAppIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjAppInoDescriptor = $convert.base64Decode('CglDYmpBcHBJbm8SHgoKZGV2aWNlTmFtZRgFIAEoCVIKZGV2aWNlTmFtZRIuChJwdWJzcGVjWWFtbFZlcnNpb24YBiABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyGA4gASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTGFzdEdlbkRhdGUYByABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YDyABKAlSDmRhcnRTZGtWZXJzaW9u');
@$core.Deprecated('Use compAppSpecsDescriptor instead')
const CompAppSpecs$json = const {
  '1': 'CompAppSpecs',
  '2': const [
    const {'1': 'compId', '3': 8, '4': 1, '5': 9, '10': 'compId'},
    const {'1': 'compUuid', '3': 9, '4': 1, '5': 9, '10': 'compUuid'},
    const {'1': 'compOs', '3': 10, '4': 1, '5': 9, '10': 'compOs'},
    const {'1': 'compModel', '3': 11, '4': 1, '5': 9, '10': 'compModel'},
    const {'1': 'compType', '3': 12, '4': 1, '5': 9, '10': 'compType'},
    const {'1': 'compIp', '3': 13, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompAppSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compAppSpecsDescriptor = $convert.base64Decode('CgxDb21wQXBwU3BlY3MSFgoGY29tcElkGAggASgJUgZjb21wSWQSGgoIY29tcFV1aWQYCSABKAlSCGNvbXBVdWlkEhYKBmNvbXBPcxgKIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgLIAEoCVIJY29tcE1vZGVsEhoKCGNvbXBUeXBlGAwgASgJUghjb21wVHlwZRIWCgZjb21wSXAYDSABKAlSBmNvbXBJcA==');
