//
//  Generated code. Do not modify.
//  source: cbj_app_connections.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use compInfoSBDescriptor instead')
const CompInfoSB$json = {
  '1': 'CompInfoSB',
  '2': [
    {'1': 'compIP', '3': 2, '4': 1, '5': 9, '10': 'compIP'},
  ],
};

/// Descriptor for `CompInfoSB`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compInfoSBDescriptor = $convert.base64Decode(
    'CgpDb21wSW5mb1NCEhYKBmNvbXBJUBgCIAEoCVIGY29tcElQ');

@$core.Deprecated('Use cBJCommendStatusDescriptor instead')
const CBJCommendStatus$json = {
  '1': 'CBJCommendStatus',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CBJCommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cBJCommendStatusDescriptor = $convert.base64Decode(
    'ChBDQkpDb21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use compAppInfoDescriptor instead')
const CompAppInfo$json = {
  '1': 'CompAppInfo',
  '2': [
    {'1': 'cbjInfo', '3': 3, '4': 1, '5': 11, '6': '.CBJAppConnections.CbjAppIno', '10': 'cbjInfo'},
    {'1': 'compSpecs', '3': 4, '4': 1, '5': 11, '6': '.CBJAppConnections.CompAppSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompAppInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compAppInfoDescriptor = $convert.base64Decode(
    'CgtDb21wQXBwSW5mbxI2CgdjYmpJbmZvGAMgASgLMhwuQ0JKQXBwQ29ubmVjdGlvbnMuQ2JqQX'
    'BwSW5vUgdjYmpJbmZvEj0KCWNvbXBTcGVjcxgEIAEoCzIfLkNCSkFwcENvbm5lY3Rpb25zLkNv'
    'bXBBcHBTcGVjc1IJY29tcFNwZWNz');

@$core.Deprecated('Use cbjAppInoDescriptor instead')
const CbjAppIno$json = {
  '1': 'CbjAppIno',
  '2': [
    {'1': 'deviceName', '3': 5, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'pubspecYamlVersion', '3': 6, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    {'1': 'pubspecYamlBuildNumber', '3': 14, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    {'1': 'protoLastGenDate', '3': 7, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    {'1': 'dartSdkVersion', '3': 15, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjAppIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjAppInoDescriptor = $convert.base64Decode(
    'CglDYmpBcHBJbm8SHgoKZGV2aWNlTmFtZRgFIAEoCVIKZGV2aWNlTmFtZRIuChJwdWJzcGVjWW'
    'FtbFZlcnNpb24YBiABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVjWWFtbEJ1aWxk'
    'TnVtYmVyGA4gASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTGFzdEdlbkRhdG'
    'UYByABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YDyABKAlSDmRhcnRT'
    'ZGtWZXJzaW9u');

@$core.Deprecated('Use compAppSpecsDescriptor instead')
const CompAppSpecs$json = {
  '1': 'CompAppSpecs',
  '2': [
    {'1': 'compId', '3': 8, '4': 1, '5': 9, '10': 'compId'},
    {'1': 'compUuid', '3': 9, '4': 1, '5': 9, '10': 'compUuid'},
    {'1': 'compOs', '3': 10, '4': 1, '5': 9, '10': 'compOs'},
    {'1': 'compModel', '3': 11, '4': 1, '5': 9, '10': 'compModel'},
    {'1': 'compType', '3': 12, '4': 1, '5': 9, '10': 'compType'},
    {'1': 'compIp', '3': 13, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompAppSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compAppSpecsDescriptor = $convert.base64Decode(
    'CgxDb21wQXBwU3BlY3MSFgoGY29tcElkGAggASgJUgZjb21wSWQSGgoIY29tcFV1aWQYCSABKA'
    'lSCGNvbXBVdWlkEhYKBmNvbXBPcxgKIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgLIAEoCVIJ'
    'Y29tcE1vZGVsEhoKCGNvbXBUeXBlGAwgASgJUghjb21wVHlwZRIWCgZjb21wSXAYDSABKAlSBm'
    'NvbXBJcA==');

