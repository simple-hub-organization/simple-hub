//
//  Generated code. Do not modify.
//  source: aioesphomeapi/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'api_options.pbjson.dart' as $0;

@$core.Deprecated('Use legacyCoverStateDescriptor instead')
const LegacyCoverState$json = {
  '1': 'LegacyCoverState',
  '2': [
    {'1': 'LEGACY_COVER_STATE_OPEN', '2': 0},
    {'1': 'LEGACY_COVER_STATE_CLOSED', '2': 1},
  ],
};

/// Descriptor for `LegacyCoverState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List legacyCoverStateDescriptor = $convert.base64Decode(
    'ChBMZWdhY3lDb3ZlclN0YXRlEhsKF0xFR0FDWV9DT1ZFUl9TVEFURV9PUEVOEAASHQoZTEVHQU'
    'NZX0NPVkVSX1NUQVRFX0NMT1NFRBAB');

@$core.Deprecated('Use coverOperationDescriptor instead')
const CoverOperation$json = {
  '1': 'CoverOperation',
  '2': [
    {'1': 'COVER_OPERATION_IDLE', '2': 0},
    {'1': 'COVER_OPERATION_IS_OPENING', '2': 1},
    {'1': 'COVER_OPERATION_IS_CLOSING', '2': 2},
  ],
};

/// Descriptor for `CoverOperation`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List coverOperationDescriptor = $convert.base64Decode(
    'Cg5Db3Zlck9wZXJhdGlvbhIYChRDT1ZFUl9PUEVSQVRJT05fSURMRRAAEh4KGkNPVkVSX09QRV'
    'JBVElPTl9JU19PUEVOSU5HEAESHgoaQ09WRVJfT1BFUkFUSU9OX0lTX0NMT1NJTkcQAg==');

@$core.Deprecated('Use legacyCoverCommandDescriptor instead')
const LegacyCoverCommand$json = {
  '1': 'LegacyCoverCommand',
  '2': [
    {'1': 'LEGACY_COVER_COMMAND_OPEN', '2': 0},
    {'1': 'LEGACY_COVER_COMMAND_CLOSE', '2': 1},
    {'1': 'LEGACY_COVER_COMMAND_STOP', '2': 2},
  ],
};

/// Descriptor for `LegacyCoverCommand`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List legacyCoverCommandDescriptor = $convert.base64Decode(
    'ChJMZWdhY3lDb3ZlckNvbW1hbmQSHQoZTEVHQUNZX0NPVkVSX0NPTU1BTkRfT1BFThAAEh4KGk'
    'xFR0FDWV9DT1ZFUl9DT01NQU5EX0NMT1NFEAESHQoZTEVHQUNZX0NPVkVSX0NPTU1BTkRfU1RP'
    'UBAC');

@$core.Deprecated('Use fanSpeedDescriptor instead')
const FanSpeed$json = {
  '1': 'FanSpeed',
  '2': [
    {'1': 'FAN_SPEED_LOW', '2': 0},
    {'1': 'FAN_SPEED_MEDIUM', '2': 1},
    {'1': 'FAN_SPEED_HIGH', '2': 2},
  ],
};

/// Descriptor for `FanSpeed`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fanSpeedDescriptor = $convert.base64Decode(
    'CghGYW5TcGVlZBIRCg1GQU5fU1BFRURfTE9XEAASFAoQRkFOX1NQRUVEX01FRElVTRABEhIKDk'
    'ZBTl9TUEVFRF9ISUdIEAI=');

@$core.Deprecated('Use fanDirectionDescriptor instead')
const FanDirection$json = {
  '1': 'FanDirection',
  '2': [
    {'1': 'FAN_DIRECTION_FORWARD', '2': 0},
    {'1': 'FAN_DIRECTION_REVERSE', '2': 1},
  ],
};

/// Descriptor for `FanDirection`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fanDirectionDescriptor = $convert.base64Decode(
    'CgxGYW5EaXJlY3Rpb24SGQoVRkFOX0RJUkVDVElPTl9GT1JXQVJEEAASGQoVRkFOX0RJUkVDVE'
    'lPTl9SRVZFUlNFEAE=');

@$core.Deprecated('Use sensorStateClassDescriptor instead')
const SensorStateClass$json = {
  '1': 'SensorStateClass',
  '2': [
    {'1': 'STATE_CLASS_NONE', '2': 0},
    {'1': 'STATE_CLASS_MEASUREMENT', '2': 1},
  ],
};

/// Descriptor for `SensorStateClass`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sensorStateClassDescriptor = $convert.base64Decode(
    'ChBTZW5zb3JTdGF0ZUNsYXNzEhQKEFNUQVRFX0NMQVNTX05PTkUQABIbChdTVEFURV9DTEFTU1'
    '9NRUFTVVJFTUVOVBAB');

@$core.Deprecated('Use logLevelDescriptor instead')
const LogLevel$json = {
  '1': 'LogLevel',
  '2': [
    {'1': 'LOG_LEVEL_NONE', '2': 0},
    {'1': 'LOG_LEVEL_ERROR', '2': 1},
    {'1': 'LOG_LEVEL_WARN', '2': 2},
    {'1': 'LOG_LEVEL_INFO', '2': 3},
    {'1': 'LOG_LEVEL_DEBUG', '2': 4},
    {'1': 'LOG_LEVEL_VERBOSE', '2': 5},
    {'1': 'LOG_LEVEL_VERY_VERBOSE', '2': 6},
  ],
};

/// Descriptor for `LogLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List logLevelDescriptor = $convert.base64Decode(
    'CghMb2dMZXZlbBISCg5MT0dfTEVWRUxfTk9ORRAAEhMKD0xPR19MRVZFTF9FUlJPUhABEhIKDk'
    'xPR19MRVZFTF9XQVJOEAISEgoOTE9HX0xFVkVMX0lORk8QAxITCg9MT0dfTEVWRUxfREVCVUcQ'
    'BBIVChFMT0dfTEVWRUxfVkVSQk9TRRAFEhoKFkxPR19MRVZFTF9WRVJZX1ZFUkJPU0UQBg==');

@$core.Deprecated('Use serviceArgTypeDescriptor instead')
const ServiceArgType$json = {
  '1': 'ServiceArgType',
  '2': [
    {'1': 'SERVICE_ARG_TYPE_BOOL', '2': 0},
    {'1': 'SERVICE_ARG_TYPE_INT', '2': 1},
    {'1': 'SERVICE_ARG_TYPE_FLOAT', '2': 2},
    {'1': 'SERVICE_ARG_TYPE_STRING', '2': 3},
    {'1': 'SERVICE_ARG_TYPE_BOOL_ARRAY', '2': 4},
    {'1': 'SERVICE_ARG_TYPE_INT_ARRAY', '2': 5},
    {'1': 'SERVICE_ARG_TYPE_FLOAT_ARRAY', '2': 6},
    {'1': 'SERVICE_ARG_TYPE_STRING_ARRAY', '2': 7},
  ],
};

/// Descriptor for `ServiceArgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serviceArgTypeDescriptor = $convert.base64Decode(
    'Cg5TZXJ2aWNlQXJnVHlwZRIZChVTRVJWSUNFX0FSR19UWVBFX0JPT0wQABIYChRTRVJWSUNFX0'
    'FSR19UWVBFX0lOVBABEhoKFlNFUlZJQ0VfQVJHX1RZUEVfRkxPQVQQAhIbChdTRVJWSUNFX0FS'
    'R19UWVBFX1NUUklORxADEh8KG1NFUlZJQ0VfQVJHX1RZUEVfQk9PTF9BUlJBWRAEEh4KGlNFUl'
    'ZJQ0VfQVJHX1RZUEVfSU5UX0FSUkFZEAUSIAocU0VSVklDRV9BUkdfVFlQRV9GTE9BVF9BUlJB'
    'WRAGEiEKHVNFUlZJQ0VfQVJHX1RZUEVfU1RSSU5HX0FSUkFZEAc=');

@$core.Deprecated('Use climateModeDescriptor instead')
const ClimateMode$json = {
  '1': 'ClimateMode',
  '2': [
    {'1': 'CLIMATE_MODE_OFF', '2': 0},
    {'1': 'CLIMATE_MODE_HEAT_COOL', '2': 1},
    {'1': 'CLIMATE_MODE_COOL', '2': 2},
    {'1': 'CLIMATE_MODE_HEAT', '2': 3},
    {'1': 'CLIMATE_MODE_FAN_ONLY', '2': 4},
    {'1': 'CLIMATE_MODE_DRY', '2': 5},
    {'1': 'CLIMATE_MODE_AUTO', '2': 6},
  ],
};

/// Descriptor for `ClimateMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List climateModeDescriptor = $convert.base64Decode(
    'CgtDbGltYXRlTW9kZRIUChBDTElNQVRFX01PREVfT0ZGEAASGgoWQ0xJTUFURV9NT0RFX0hFQV'
    'RfQ09PTBABEhUKEUNMSU1BVEVfTU9ERV9DT09MEAISFQoRQ0xJTUFURV9NT0RFX0hFQVQQAxIZ'
    'ChVDTElNQVRFX01PREVfRkFOX09OTFkQBBIUChBDTElNQVRFX01PREVfRFJZEAUSFQoRQ0xJTU'
    'FURV9NT0RFX0FVVE8QBg==');

@$core.Deprecated('Use climateFanModeDescriptor instead')
const ClimateFanMode$json = {
  '1': 'ClimateFanMode',
  '2': [
    {'1': 'CLIMATE_FAN_ON', '2': 0},
    {'1': 'CLIMATE_FAN_OFF', '2': 1},
    {'1': 'CLIMATE_FAN_AUTO', '2': 2},
    {'1': 'CLIMATE_FAN_LOW', '2': 3},
    {'1': 'CLIMATE_FAN_MEDIUM', '2': 4},
    {'1': 'CLIMATE_FAN_HIGH', '2': 5},
    {'1': 'CLIMATE_FAN_MIDDLE', '2': 6},
    {'1': 'CLIMATE_FAN_FOCUS', '2': 7},
    {'1': 'CLIMATE_FAN_DIFFUSE', '2': 8},
  ],
};

/// Descriptor for `ClimateFanMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List climateFanModeDescriptor = $convert.base64Decode(
    'Cg5DbGltYXRlRmFuTW9kZRISCg5DTElNQVRFX0ZBTl9PThAAEhMKD0NMSU1BVEVfRkFOX09GRh'
    'ABEhQKEENMSU1BVEVfRkFOX0FVVE8QAhITCg9DTElNQVRFX0ZBTl9MT1cQAxIWChJDTElNQVRF'
    'X0ZBTl9NRURJVU0QBBIUChBDTElNQVRFX0ZBTl9ISUdIEAUSFgoSQ0xJTUFURV9GQU5fTUlERE'
    'xFEAYSFQoRQ0xJTUFURV9GQU5fRk9DVVMQBxIXChNDTElNQVRFX0ZBTl9ESUZGVVNFEAg=');

@$core.Deprecated('Use climateSwingModeDescriptor instead')
const ClimateSwingMode$json = {
  '1': 'ClimateSwingMode',
  '2': [
    {'1': 'CLIMATE_SWING_OFF', '2': 0},
    {'1': 'CLIMATE_SWING_BOTH', '2': 1},
    {'1': 'CLIMATE_SWING_VERTICAL', '2': 2},
    {'1': 'CLIMATE_SWING_HORIZONTAL', '2': 3},
  ],
};

/// Descriptor for `ClimateSwingMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List climateSwingModeDescriptor = $convert.base64Decode(
    'ChBDbGltYXRlU3dpbmdNb2RlEhUKEUNMSU1BVEVfU1dJTkdfT0ZGEAASFgoSQ0xJTUFURV9TV0'
    'lOR19CT1RIEAESGgoWQ0xJTUFURV9TV0lOR19WRVJUSUNBTBACEhwKGENMSU1BVEVfU1dJTkdf'
    'SE9SSVpPTlRBTBAD');

@$core.Deprecated('Use climateActionDescriptor instead')
const ClimateAction$json = {
  '1': 'ClimateAction',
  '2': [
    {'1': 'CLIMATE_ACTION_OFF', '2': 0},
    {'1': 'CLIMATE_ACTION_COOLING', '2': 2},
    {'1': 'CLIMATE_ACTION_HEATING', '2': 3},
    {'1': 'CLIMATE_ACTION_IDLE', '2': 4},
    {'1': 'CLIMATE_ACTION_DRYING', '2': 5},
    {'1': 'CLIMATE_ACTION_FAN', '2': 6},
  ],
};

/// Descriptor for `ClimateAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List climateActionDescriptor = $convert.base64Decode(
    'Cg1DbGltYXRlQWN0aW9uEhYKEkNMSU1BVEVfQUNUSU9OX09GRhAAEhoKFkNMSU1BVEVfQUNUSU'
    '9OX0NPT0xJTkcQAhIaChZDTElNQVRFX0FDVElPTl9IRUFUSU5HEAMSFwoTQ0xJTUFURV9BQ1RJ'
    'T05fSURMRRAEEhkKFUNMSU1BVEVfQUNUSU9OX0RSWUlORxAFEhYKEkNMSU1BVEVfQUNUSU9OX0'
    'ZBThAG');

@$core.Deprecated('Use climatePresetDescriptor instead')
const ClimatePreset$json = {
  '1': 'ClimatePreset',
  '2': [
    {'1': 'CLIMATE_PRESET_NONE', '2': 0},
    {'1': 'CLIMATE_PRESET_HOME', '2': 1},
    {'1': 'CLIMATE_PRESET_AWAY', '2': 2},
    {'1': 'CLIMATE_PRESET_BOOST', '2': 3},
    {'1': 'CLIMATE_PRESET_COMFORT', '2': 4},
    {'1': 'CLIMATE_PRESET_ECO', '2': 5},
    {'1': 'CLIMATE_PRESET_SLEEP', '2': 6},
    {'1': 'CLIMATE_PRESET_ACTIVITY', '2': 7},
  ],
};

/// Descriptor for `ClimatePreset`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List climatePresetDescriptor = $convert.base64Decode(
    'Cg1DbGltYXRlUHJlc2V0EhcKE0NMSU1BVEVfUFJFU0VUX05PTkUQABIXChNDTElNQVRFX1BSRV'
    'NFVF9IT01FEAESFwoTQ0xJTUFURV9QUkVTRVRfQVdBWRACEhgKFENMSU1BVEVfUFJFU0VUX0JP'
    'T1NUEAMSGgoWQ0xJTUFURV9QUkVTRVRfQ09NRk9SVBAEEhYKEkNMSU1BVEVfUFJFU0VUX0VDTx'
    'AFEhgKFENMSU1BVEVfUFJFU0VUX1NMRUVQEAYSGwoXQ0xJTUFURV9QUkVTRVRfQUNUSVZJVFkQ'
    'Bw==');

@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = {
  '1': 'HelloRequest',
  '2': [
    {'1': 'client_info', '3': 1, '4': 1, '5': 9, '10': 'clientInfo'},
  ],
  '7': {},
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode(
    'CgxIZWxsb1JlcXVlc3QSHwoLY2xpZW50X2luZm8YASABKAlSCmNsaWVudEluZm86CeBAAehAAo'
    'BBAQ==');

@$core.Deprecated('Use helloResponseDescriptor instead')
const HelloResponse$json = {
  '1': 'HelloResponse',
  '2': [
    {'1': 'api_version_major', '3': 1, '4': 1, '5': 13, '10': 'apiVersionMajor'},
    {'1': 'api_version_minor', '3': 2, '4': 1, '5': 13, '10': 'apiVersionMinor'},
    {'1': 'server_info', '3': 3, '4': 1, '5': 9, '10': 'serverInfo'},
  ],
  '7': {},
};

/// Descriptor for `HelloResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloResponseDescriptor = $convert.base64Decode(
    'Cg1IZWxsb1Jlc3BvbnNlEioKEWFwaV92ZXJzaW9uX21ham9yGAEgASgNUg9hcGlWZXJzaW9uTW'
    'Fqb3ISKgoRYXBpX3ZlcnNpb25fbWlub3IYAiABKA1SD2FwaVZlcnNpb25NaW5vchIfCgtzZXJ2'
    'ZXJfaW5mbxgDIAEoCVIKc2VydmVySW5mbzoJ4EAC6EABgEEB');

@$core.Deprecated('Use connectRequestDescriptor instead')
const ConnectRequest$json = {
  '1': 'ConnectRequest',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
  ],
  '7': {},
};

/// Descriptor for `ConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectRequestDescriptor = $convert.base64Decode(
    'Cg5Db25uZWN0UmVxdWVzdBIaCghwYXNzd29yZBgBIAEoCVIIcGFzc3dvcmQ6CeBAA+hAAoBBAQ'
    '==');

@$core.Deprecated('Use connectResponseDescriptor instead')
const ConnectResponse$json = {
  '1': 'ConnectResponse',
  '2': [
    {'1': 'invalid_password', '3': 1, '4': 1, '5': 8, '10': 'invalidPassword'},
  ],
  '7': {},
};

/// Descriptor for `ConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectResponseDescriptor = $convert.base64Decode(
    'Cg9Db25uZWN0UmVzcG9uc2USKQoQaW52YWxpZF9wYXNzd29yZBgBIAEoCFIPaW52YWxpZFBhc3'
    'N3b3JkOgngQAToQAGAQQE=');

@$core.Deprecated('Use disconnectRequestDescriptor instead')
const DisconnectRequest$json = {
  '1': 'DisconnectRequest',
  '7': {},
};

/// Descriptor for `DisconnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectRequestDescriptor = $convert.base64Decode(
    'ChFEaXNjb25uZWN0UmVxdWVzdDoJ4EAF6EAAgEEB');

@$core.Deprecated('Use disconnectResponseDescriptor instead')
const DisconnectResponse$json = {
  '1': 'DisconnectResponse',
  '7': {},
};

/// Descriptor for `DisconnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectResponseDescriptor = $convert.base64Decode(
    'ChJEaXNjb25uZWN0UmVzcG9uc2U6CeBABuhAAIBBAQ==');

@$core.Deprecated('Use pingRequestDescriptor instead')
const PingRequest$json = {
  '1': 'PingRequest',
  '7': {},
};

/// Descriptor for `PingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingRequestDescriptor = $convert.base64Decode(
    'CgtQaW5nUmVxdWVzdDoG4EAH6EAA');

@$core.Deprecated('Use pingResponseDescriptor instead')
const PingResponse$json = {
  '1': 'PingResponse',
  '7': {},
};

/// Descriptor for `PingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingResponseDescriptor = $convert.base64Decode(
    'CgxQaW5nUmVzcG9uc2U6BuBACOhAAA==');

@$core.Deprecated('Use deviceInfoRequestDescriptor instead')
const DeviceInfoRequest$json = {
  '1': 'DeviceInfoRequest',
  '7': {},
};

/// Descriptor for `DeviceInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceInfoRequestDescriptor = $convert.base64Decode(
    'ChFEZXZpY2VJbmZvUmVxdWVzdDoG4EAJ6EAC');

@$core.Deprecated('Use deviceInfoResponseDescriptor instead')
const DeviceInfoResponse$json = {
  '1': 'DeviceInfoResponse',
  '2': [
    {'1': 'uses_password', '3': 1, '4': 1, '5': 8, '10': 'usesPassword'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'mac_address', '3': 3, '4': 1, '5': 9, '10': 'macAddress'},
    {'1': 'esphome_version', '3': 4, '4': 1, '5': 9, '10': 'esphomeVersion'},
    {'1': 'compilation_time', '3': 5, '4': 1, '5': 9, '10': 'compilationTime'},
    {'1': 'model', '3': 6, '4': 1, '5': 9, '10': 'model'},
    {'1': 'has_deep_sleep', '3': 7, '4': 1, '5': 8, '10': 'hasDeepSleep'},
    {'1': 'project_name', '3': 8, '4': 1, '5': 9, '10': 'projectName'},
    {'1': 'project_version', '3': 9, '4': 1, '5': 9, '10': 'projectVersion'},
  ],
  '7': {},
};

/// Descriptor for `DeviceInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceInfoResponseDescriptor = $convert.base64Decode(
    'ChJEZXZpY2VJbmZvUmVzcG9uc2USIwoNdXNlc19wYXNzd29yZBgBIAEoCFIMdXNlc1Bhc3N3b3'
    'JkEhIKBG5hbWUYAiABKAlSBG5hbWUSHwoLbWFjX2FkZHJlc3MYAyABKAlSCm1hY0FkZHJlc3MS'
    'JwoPZXNwaG9tZV92ZXJzaW9uGAQgASgJUg5lc3Bob21lVmVyc2lvbhIpChBjb21waWxhdGlvbl'
    '90aW1lGAUgASgJUg9jb21waWxhdGlvblRpbWUSFAoFbW9kZWwYBiABKAlSBW1vZGVsEiQKDmhh'
    'c19kZWVwX3NsZWVwGAcgASgIUgxoYXNEZWVwU2xlZXASIQoMcHJvamVjdF9uYW1lGAggASgJUg'
    'twcm9qZWN0TmFtZRInCg9wcm9qZWN0X3ZlcnNpb24YCSABKAlSDnByb2plY3RWZXJzaW9uOgbg'
    'QAroQAE=');

@$core.Deprecated('Use listEntitiesRequestDescriptor instead')
const ListEntitiesRequest$json = {
  '1': 'ListEntitiesRequest',
  '7': {},
};

/// Descriptor for `ListEntitiesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0RW50aXRpZXNSZXF1ZXN0OgbgQAvoQAI=');

@$core.Deprecated('Use listEntitiesDoneResponseDescriptor instead')
const ListEntitiesDoneResponse$json = {
  '1': 'ListEntitiesDoneResponse',
  '7': {},
};

/// Descriptor for `ListEntitiesDoneResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesDoneResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0RW50aXRpZXNEb25lUmVzcG9uc2U6CeBAE+hAAYBBAQ==');

@$core.Deprecated('Use subscribeStatesRequestDescriptor instead')
const SubscribeStatesRequest$json = {
  '1': 'SubscribeStatesRequest',
  '7': {},
};

/// Descriptor for `SubscribeStatesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeStatesRequestDescriptor = $convert.base64Decode(
    'ChZTdWJzY3JpYmVTdGF0ZXNSZXF1ZXN0OgbgQBToQAI=');

@$core.Deprecated('Use listEntitiesBinarySensorResponseDescriptor instead')
const ListEntitiesBinarySensorResponse$json = {
  '1': 'ListEntitiesBinarySensorResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'device_class', '3': 5, '4': 1, '5': 9, '10': 'deviceClass'},
    {'1': 'is_status_binary_sensor', '3': 6, '4': 1, '5': 8, '10': 'isStatusBinarySensor'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesBinarySensorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesBinarySensorResponseDescriptor = $convert.base64Decode(
    'CiBMaXN0RW50aXRpZXNCaW5hcnlTZW5zb3JSZXNwb25zZRIbCglvYmplY3RfaWQYASABKAlSCG'
    '9iamVjdElkEhAKA2tleRgCIAEoB1IDa2V5EhIKBG5hbWUYAyABKAlSBG5hbWUSGwoJdW5pcXVl'
    'X2lkGAQgASgJUgh1bmlxdWVJZBIhCgxkZXZpY2VfY2xhc3MYBSABKAlSC2RldmljZUNsYXNzEj'
    'UKF2lzX3N0YXR1c19iaW5hcnlfc2Vuc29yGAYgASgIUhRpc1N0YXR1c0JpbmFyeVNlbnNvcjoa'
    '4EAM6EAB8kARVVNFX0JJTkFSWV9TRU5TT1I=');

@$core.Deprecated('Use binarySensorStateResponseDescriptor instead')
const BinarySensorStateResponse$json = {
  '1': 'BinarySensorStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
    {'1': 'missing_state', '3': 3, '4': 1, '5': 8, '10': 'missingState'},
  ],
  '7': {},
};

/// Descriptor for `BinarySensorStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List binarySensorStateResponseDescriptor = $convert.base64Decode(
    'ChlCaW5hcnlTZW5zb3JTdGF0ZVJlc3BvbnNlEhAKA2tleRgBIAEoB1IDa2V5EhQKBXN0YXRlGA'
    'IgASgIUgVzdGF0ZRIjCg1taXNzaW5nX3N0YXRlGAMgASgIUgxtaXNzaW5nU3RhdGU6HeBAFehA'
    'AfJAEVVTRV9CSU5BUllfU0VOU09SgEEB');

@$core.Deprecated('Use listEntitiesCoverResponseDescriptor instead')
const ListEntitiesCoverResponse$json = {
  '1': 'ListEntitiesCoverResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'assumed_state', '3': 5, '4': 1, '5': 8, '10': 'assumedState'},
    {'1': 'supports_position', '3': 6, '4': 1, '5': 8, '10': 'supportsPosition'},
    {'1': 'supports_tilt', '3': 7, '4': 1, '5': 8, '10': 'supportsTilt'},
    {'1': 'device_class', '3': 8, '4': 1, '5': 9, '10': 'deviceClass'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesCoverResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesCoverResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0RW50aXRpZXNDb3ZlclJlc3BvbnNlEhsKCW9iamVjdF9pZBgBIAEoCVIIb2JqZWN0SW'
    'QSEAoDa2V5GAIgASgHUgNrZXkSEgoEbmFtZRgDIAEoCVIEbmFtZRIbCgl1bmlxdWVfaWQYBCAB'
    'KAlSCHVuaXF1ZUlkEiMKDWFzc3VtZWRfc3RhdGUYBSABKAhSDGFzc3VtZWRTdGF0ZRIrChFzdX'
    'Bwb3J0c19wb3NpdGlvbhgGIAEoCFIQc3VwcG9ydHNQb3NpdGlvbhIjCg1zdXBwb3J0c190aWx0'
    'GAcgASgIUgxzdXBwb3J0c1RpbHQSIQoMZGV2aWNlX2NsYXNzGAggASgJUgtkZXZpY2VDbGFzcz'
    'oS4EAN6EAB8kAJVVNFX0NPVkVS');

@$core.Deprecated('Use coverStateResponseDescriptor instead')
const CoverStateResponse$json = {
  '1': 'CoverStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'legacy_state', '3': 2, '4': 1, '5': 14, '6': '.LegacyCoverState', '10': 'legacyState'},
    {'1': 'position', '3': 3, '4': 1, '5': 2, '10': 'position'},
    {'1': 'tilt', '3': 4, '4': 1, '5': 2, '10': 'tilt'},
    {'1': 'current_operation', '3': 5, '4': 1, '5': 14, '6': '.CoverOperation', '10': 'currentOperation'},
  ],
  '7': {},
};

/// Descriptor for `CoverStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coverStateResponseDescriptor = $convert.base64Decode(
    'ChJDb3ZlclN0YXRlUmVzcG9uc2USEAoDa2V5GAEgASgHUgNrZXkSNAoMbGVnYWN5X3N0YXRlGA'
    'IgASgOMhEuTGVnYWN5Q292ZXJTdGF0ZVILbGVnYWN5U3RhdGUSGgoIcG9zaXRpb24YAyABKAJS'
    'CHBvc2l0aW9uEhIKBHRpbHQYBCABKAJSBHRpbHQSPAoRY3VycmVudF9vcGVyYXRpb24YBSABKA'
    '4yDy5Db3Zlck9wZXJhdGlvblIQY3VycmVudE9wZXJhdGlvbjoV4EAW6EAB8kAJVVNFX0NPVkVS'
    'gEEB');

@$core.Deprecated('Use coverCommandRequestDescriptor instead')
const CoverCommandRequest$json = {
  '1': 'CoverCommandRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'has_legacy_command', '3': 2, '4': 1, '5': 8, '10': 'hasLegacyCommand'},
    {'1': 'legacy_command', '3': 3, '4': 1, '5': 14, '6': '.LegacyCoverCommand', '10': 'legacyCommand'},
    {'1': 'has_position', '3': 4, '4': 1, '5': 8, '10': 'hasPosition'},
    {'1': 'position', '3': 5, '4': 1, '5': 2, '10': 'position'},
    {'1': 'has_tilt', '3': 6, '4': 1, '5': 8, '10': 'hasTilt'},
    {'1': 'tilt', '3': 7, '4': 1, '5': 2, '10': 'tilt'},
    {'1': 'stop', '3': 8, '4': 1, '5': 8, '10': 'stop'},
  ],
  '7': {},
};

/// Descriptor for `CoverCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coverCommandRequestDescriptor = $convert.base64Decode(
    'ChNDb3ZlckNvbW1hbmRSZXF1ZXN0EhAKA2tleRgBIAEoB1IDa2V5EiwKEmhhc19sZWdhY3lfY2'
    '9tbWFuZBgCIAEoCFIQaGFzTGVnYWN5Q29tbWFuZBI6Cg5sZWdhY3lfY29tbWFuZBgDIAEoDjIT'
    'LkxlZ2FjeUNvdmVyQ29tbWFuZFINbGVnYWN5Q29tbWFuZBIhCgxoYXNfcG9zaXRpb24YBCABKA'
    'hSC2hhc1Bvc2l0aW9uEhoKCHBvc2l0aW9uGAUgASgCUghwb3NpdGlvbhIZCghoYXNfdGlsdBgG'
    'IAEoCFIHaGFzVGlsdBISCgR0aWx0GAcgASgCUgR0aWx0EhIKBHN0b3AYCCABKAhSBHN0b3A6Fe'
    'BAHuhAAvJACVVTRV9DT1ZFUoBBAQ==');

@$core.Deprecated('Use listEntitiesFanResponseDescriptor instead')
const ListEntitiesFanResponse$json = {
  '1': 'ListEntitiesFanResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'supports_oscillation', '3': 5, '4': 1, '5': 8, '10': 'supportsOscillation'},
    {'1': 'supports_speed', '3': 6, '4': 1, '5': 8, '10': 'supportsSpeed'},
    {'1': 'supports_direction', '3': 7, '4': 1, '5': 8, '10': 'supportsDirection'},
    {'1': 'supported_speed_levels', '3': 8, '4': 1, '5': 5, '10': 'supportedSpeedLevels'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesFanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesFanResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0RW50aXRpZXNGYW5SZXNwb25zZRIbCglvYmplY3RfaWQYASABKAlSCG9iamVjdElkEh'
    'AKA2tleRgCIAEoB1IDa2V5EhIKBG5hbWUYAyABKAlSBG5hbWUSGwoJdW5pcXVlX2lkGAQgASgJ'
    'Ugh1bmlxdWVJZBIxChRzdXBwb3J0c19vc2NpbGxhdGlvbhgFIAEoCFITc3VwcG9ydHNPc2NpbG'
    'xhdGlvbhIlCg5zdXBwb3J0c19zcGVlZBgGIAEoCFINc3VwcG9ydHNTcGVlZBItChJzdXBwb3J0'
    'c19kaXJlY3Rpb24YByABKAhSEXN1cHBvcnRzRGlyZWN0aW9uEjQKFnN1cHBvcnRlZF9zcGVlZF'
    '9sZXZlbHMYCCABKAVSFHN1cHBvcnRlZFNwZWVkTGV2ZWxzOhDgQA7oQAHyQAdVU0VfRkFO');

@$core.Deprecated('Use fanStateResponseDescriptor instead')
const FanStateResponse$json = {
  '1': 'FanStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
    {'1': 'oscillating', '3': 3, '4': 1, '5': 8, '10': 'oscillating'},
    {
      '1': 'speed',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.FanSpeed',
      '8': {'3': true},
      '10': 'speed',
    },
    {'1': 'direction', '3': 5, '4': 1, '5': 14, '6': '.FanDirection', '10': 'direction'},
    {'1': 'speed_level', '3': 6, '4': 1, '5': 5, '10': 'speedLevel'},
  ],
  '7': {},
};

/// Descriptor for `FanStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fanStateResponseDescriptor = $convert.base64Decode(
    'ChBGYW5TdGF0ZVJlc3BvbnNlEhAKA2tleRgBIAEoB1IDa2V5EhQKBXN0YXRlGAIgASgIUgVzdG'
    'F0ZRIgCgtvc2NpbGxhdGluZxgDIAEoCFILb3NjaWxsYXRpbmcSIwoFc3BlZWQYBCABKA4yCS5G'
    'YW5TcGVlZEICGAFSBXNwZWVkEisKCWRpcmVjdGlvbhgFIAEoDjINLkZhbkRpcmVjdGlvblIJZG'
    'lyZWN0aW9uEh8KC3NwZWVkX2xldmVsGAYgASgFUgpzcGVlZExldmVsOhPgQBfoQAHyQAdVU0Vf'
    'RkFOgEEB');

@$core.Deprecated('Use fanCommandRequestDescriptor instead')
const FanCommandRequest$json = {
  '1': 'FanCommandRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'has_state', '3': 2, '4': 1, '5': 8, '10': 'hasState'},
    {'1': 'state', '3': 3, '4': 1, '5': 8, '10': 'state'},
    {
      '1': 'has_speed',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'hasSpeed',
    },
    {
      '1': 'speed',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.FanSpeed',
      '8': {'3': true},
      '10': 'speed',
    },
    {'1': 'has_oscillating', '3': 6, '4': 1, '5': 8, '10': 'hasOscillating'},
    {'1': 'oscillating', '3': 7, '4': 1, '5': 8, '10': 'oscillating'},
    {'1': 'has_direction', '3': 8, '4': 1, '5': 8, '10': 'hasDirection'},
    {'1': 'direction', '3': 9, '4': 1, '5': 14, '6': '.FanDirection', '10': 'direction'},
    {'1': 'has_speed_level', '3': 10, '4': 1, '5': 8, '10': 'hasSpeedLevel'},
    {'1': 'speed_level', '3': 11, '4': 1, '5': 5, '10': 'speedLevel'},
  ],
  '7': {},
};

/// Descriptor for `FanCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fanCommandRequestDescriptor = $convert.base64Decode(
    'ChFGYW5Db21tYW5kUmVxdWVzdBIQCgNrZXkYASABKAdSA2tleRIbCgloYXNfc3RhdGUYAiABKA'
    'hSCGhhc1N0YXRlEhQKBXN0YXRlGAMgASgIUgVzdGF0ZRIfCgloYXNfc3BlZWQYBCABKAhCAhgB'
    'UghoYXNTcGVlZBIjCgVzcGVlZBgFIAEoDjIJLkZhblNwZWVkQgIYAVIFc3BlZWQSJwoPaGFzX2'
    '9zY2lsbGF0aW5nGAYgASgIUg5oYXNPc2NpbGxhdGluZxIgCgtvc2NpbGxhdGluZxgHIAEoCFIL'
    'b3NjaWxsYXRpbmcSIwoNaGFzX2RpcmVjdGlvbhgIIAEoCFIMaGFzRGlyZWN0aW9uEisKCWRpcm'
    'VjdGlvbhgJIAEoDjINLkZhbkRpcmVjdGlvblIJZGlyZWN0aW9uEiYKD2hhc19zcGVlZF9sZXZl'
    'bBgKIAEoCFINaGFzU3BlZWRMZXZlbBIfCgtzcGVlZF9sZXZlbBgLIAEoBVIKc3BlZWRMZXZlbD'
    'oT4EAf6EAC8kAHVVNFX0ZBToBBAQ==');

@$core.Deprecated('Use listEntitiesLightResponseDescriptor instead')
const ListEntitiesLightResponse$json = {
  '1': 'ListEntitiesLightResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'supports_brightness', '3': 5, '4': 1, '5': 8, '10': 'supportsBrightness'},
    {'1': 'supports_rgb', '3': 6, '4': 1, '5': 8, '10': 'supportsRgb'},
    {'1': 'supports_white_value', '3': 7, '4': 1, '5': 8, '10': 'supportsWhiteValue'},
    {'1': 'supports_color_temperature', '3': 8, '4': 1, '5': 8, '10': 'supportsColorTemperature'},
    {'1': 'min_mireds', '3': 9, '4': 1, '5': 2, '10': 'minMireds'},
    {'1': 'max_mireds', '3': 10, '4': 1, '5': 2, '10': 'maxMireds'},
    {'1': 'effects', '3': 11, '4': 3, '5': 9, '10': 'effects'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesLightResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesLightResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0RW50aXRpZXNMaWdodFJlc3BvbnNlEhsKCW9iamVjdF9pZBgBIAEoCVIIb2JqZWN0SW'
    'QSEAoDa2V5GAIgASgHUgNrZXkSEgoEbmFtZRgDIAEoCVIEbmFtZRIbCgl1bmlxdWVfaWQYBCAB'
    'KAlSCHVuaXF1ZUlkEi8KE3N1cHBvcnRzX2JyaWdodG5lc3MYBSABKAhSEnN1cHBvcnRzQnJpZ2'
    'h0bmVzcxIhCgxzdXBwb3J0c19yZ2IYBiABKAhSC3N1cHBvcnRzUmdiEjAKFHN1cHBvcnRzX3do'
    'aXRlX3ZhbHVlGAcgASgIUhJzdXBwb3J0c1doaXRlVmFsdWUSPAoac3VwcG9ydHNfY29sb3JfdG'
    'VtcGVyYXR1cmUYCCABKAhSGHN1cHBvcnRzQ29sb3JUZW1wZXJhdHVyZRIdCgptaW5fbWlyZWRz'
    'GAkgASgCUgltaW5NaXJlZHMSHQoKbWF4X21pcmVkcxgKIAEoAlIJbWF4TWlyZWRzEhgKB2VmZm'
    'VjdHMYCyADKAlSB2VmZmVjdHM6EuBAD+hAAfJACVVTRV9MSUdIVA==');

@$core.Deprecated('Use lightStateResponseDescriptor instead')
const LightStateResponse$json = {
  '1': 'LightStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
    {'1': 'brightness', '3': 3, '4': 1, '5': 2, '10': 'brightness'},
    {'1': 'red', '3': 4, '4': 1, '5': 2, '10': 'red'},
    {'1': 'green', '3': 5, '4': 1, '5': 2, '10': 'green'},
    {'1': 'blue', '3': 6, '4': 1, '5': 2, '10': 'blue'},
    {'1': 'white', '3': 7, '4': 1, '5': 2, '10': 'white'},
    {'1': 'color_temperature', '3': 8, '4': 1, '5': 2, '10': 'colorTemperature'},
    {'1': 'effect', '3': 9, '4': 1, '5': 9, '10': 'effect'},
  ],
  '7': {},
};

/// Descriptor for `LightStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lightStateResponseDescriptor = $convert.base64Decode(
    'ChJMaWdodFN0YXRlUmVzcG9uc2USEAoDa2V5GAEgASgHUgNrZXkSFAoFc3RhdGUYAiABKAhSBX'
    'N0YXRlEh4KCmJyaWdodG5lc3MYAyABKAJSCmJyaWdodG5lc3MSEAoDcmVkGAQgASgCUgNyZWQS'
    'FAoFZ3JlZW4YBSABKAJSBWdyZWVuEhIKBGJsdWUYBiABKAJSBGJsdWUSFAoFd2hpdGUYByABKA'
    'JSBXdoaXRlEisKEWNvbG9yX3RlbXBlcmF0dXJlGAggASgCUhBjb2xvclRlbXBlcmF0dXJlEhYK'
    'BmVmZmVjdBgJIAEoCVIGZWZmZWN0OhXgQBjoQAHyQAlVU0VfTElHSFSAQQE=');

@$core.Deprecated('Use lightCommandRequestDescriptor instead')
const LightCommandRequest$json = {
  '1': 'LightCommandRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'has_state', '3': 2, '4': 1, '5': 8, '10': 'hasState'},
    {'1': 'state', '3': 3, '4': 1, '5': 8, '10': 'state'},
    {'1': 'has_brightness', '3': 4, '4': 1, '5': 8, '10': 'hasBrightness'},
    {'1': 'brightness', '3': 5, '4': 1, '5': 2, '10': 'brightness'},
    {'1': 'has_rgb', '3': 6, '4': 1, '5': 8, '10': 'hasRgb'},
    {'1': 'red', '3': 7, '4': 1, '5': 2, '10': 'red'},
    {'1': 'green', '3': 8, '4': 1, '5': 2, '10': 'green'},
    {'1': 'blue', '3': 9, '4': 1, '5': 2, '10': 'blue'},
    {'1': 'has_white', '3': 10, '4': 1, '5': 8, '10': 'hasWhite'},
    {'1': 'white', '3': 11, '4': 1, '5': 2, '10': 'white'},
    {'1': 'has_color_temperature', '3': 12, '4': 1, '5': 8, '10': 'hasColorTemperature'},
    {'1': 'color_temperature', '3': 13, '4': 1, '5': 2, '10': 'colorTemperature'},
    {'1': 'has_transition_length', '3': 14, '4': 1, '5': 8, '10': 'hasTransitionLength'},
    {'1': 'transition_length', '3': 15, '4': 1, '5': 13, '10': 'transitionLength'},
    {'1': 'has_flash_length', '3': 16, '4': 1, '5': 8, '10': 'hasFlashLength'},
    {'1': 'flash_length', '3': 17, '4': 1, '5': 13, '10': 'flashLength'},
    {'1': 'has_effect', '3': 18, '4': 1, '5': 8, '10': 'hasEffect'},
    {'1': 'effect', '3': 19, '4': 1, '5': 9, '10': 'effect'},
  ],
  '7': {},
};

/// Descriptor for `LightCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lightCommandRequestDescriptor = $convert.base64Decode(
    'ChNMaWdodENvbW1hbmRSZXF1ZXN0EhAKA2tleRgBIAEoB1IDa2V5EhsKCWhhc19zdGF0ZRgCIA'
    'EoCFIIaGFzU3RhdGUSFAoFc3RhdGUYAyABKAhSBXN0YXRlEiUKDmhhc19icmlnaHRuZXNzGAQg'
    'ASgIUg1oYXNCcmlnaHRuZXNzEh4KCmJyaWdodG5lc3MYBSABKAJSCmJyaWdodG5lc3MSFwoHaG'
    'FzX3JnYhgGIAEoCFIGaGFzUmdiEhAKA3JlZBgHIAEoAlIDcmVkEhQKBWdyZWVuGAggASgCUgVn'
    'cmVlbhISCgRibHVlGAkgASgCUgRibHVlEhsKCWhhc193aGl0ZRgKIAEoCFIIaGFzV2hpdGUSFA'
    'oFd2hpdGUYCyABKAJSBXdoaXRlEjIKFWhhc19jb2xvcl90ZW1wZXJhdHVyZRgMIAEoCFITaGFz'
    'Q29sb3JUZW1wZXJhdHVyZRIrChFjb2xvcl90ZW1wZXJhdHVyZRgNIAEoAlIQY29sb3JUZW1wZX'
    'JhdHVyZRIyChVoYXNfdHJhbnNpdGlvbl9sZW5ndGgYDiABKAhSE2hhc1RyYW5zaXRpb25MZW5n'
    'dGgSKwoRdHJhbnNpdGlvbl9sZW5ndGgYDyABKA1SEHRyYW5zaXRpb25MZW5ndGgSKAoQaGFzX2'
    'ZsYXNoX2xlbmd0aBgQIAEoCFIOaGFzRmxhc2hMZW5ndGgSIQoMZmxhc2hfbGVuZ3RoGBEgASgN'
    'UgtmbGFzaExlbmd0aBIdCgpoYXNfZWZmZWN0GBIgASgIUgloYXNFZmZlY3QSFgoGZWZmZWN0GB'
    'MgASgJUgZlZmZlY3Q6FeBAIOhAAvJACVVTRV9MSUdIVIBBAQ==');

@$core.Deprecated('Use listEntitiesSensorResponseDescriptor instead')
const ListEntitiesSensorResponse$json = {
  '1': 'ListEntitiesSensorResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'unit_of_measurement', '3': 6, '4': 1, '5': 9, '10': 'unitOfMeasurement'},
    {'1': 'accuracy_decimals', '3': 7, '4': 1, '5': 5, '10': 'accuracyDecimals'},
    {'1': 'force_update', '3': 8, '4': 1, '5': 8, '10': 'forceUpdate'},
    {'1': 'device_class', '3': 9, '4': 1, '5': 9, '10': 'deviceClass'},
    {'1': 'state_class', '3': 10, '4': 1, '5': 14, '6': '.SensorStateClass', '10': 'stateClass'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesSensorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesSensorResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0RW50aXRpZXNTZW5zb3JSZXNwb25zZRIbCglvYmplY3RfaWQYASABKAlSCG9iamVjdE'
    'lkEhAKA2tleRgCIAEoB1IDa2V5EhIKBG5hbWUYAyABKAlSBG5hbWUSGwoJdW5pcXVlX2lkGAQg'
    'ASgJUgh1bmlxdWVJZBISCgRpY29uGAUgASgJUgRpY29uEi4KE3VuaXRfb2ZfbWVhc3VyZW1lbn'
    'QYBiABKAlSEXVuaXRPZk1lYXN1cmVtZW50EisKEWFjY3VyYWN5X2RlY2ltYWxzGAcgASgFUhBh'
    'Y2N1cmFjeURlY2ltYWxzEiEKDGZvcmNlX3VwZGF0ZRgIIAEoCFILZm9yY2VVcGRhdGUSIQoMZG'
    'V2aWNlX2NsYXNzGAkgASgJUgtkZXZpY2VDbGFzcxIyCgtzdGF0ZV9jbGFzcxgKIAEoDjIRLlNl'
    'bnNvclN0YXRlQ2xhc3NSCnN0YXRlQ2xhc3M6E+BAEOhAAfJAClVTRV9TRU5TT1I=');

@$core.Deprecated('Use sensorStateResponseDescriptor instead')
const SensorStateResponse$json = {
  '1': 'SensorStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 2, '10': 'state'},
    {'1': 'missing_state', '3': 3, '4': 1, '5': 8, '10': 'missingState'},
  ],
  '7': {},
};

/// Descriptor for `SensorStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sensorStateResponseDescriptor = $convert.base64Decode(
    'ChNTZW5zb3JTdGF0ZVJlc3BvbnNlEhAKA2tleRgBIAEoB1IDa2V5EhQKBXN0YXRlGAIgASgCUg'
    'VzdGF0ZRIjCg1taXNzaW5nX3N0YXRlGAMgASgIUgxtaXNzaW5nU3RhdGU6FuBAGehAAfJAClVT'
    'RV9TRU5TT1KAQQE=');

@$core.Deprecated('Use listEntitiesSwitchResponseDescriptor instead')
const ListEntitiesSwitchResponse$json = {
  '1': 'ListEntitiesSwitchResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'assumed_state', '3': 6, '4': 1, '5': 8, '10': 'assumedState'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesSwitchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesSwitchResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0RW50aXRpZXNTd2l0Y2hSZXNwb25zZRIbCglvYmplY3RfaWQYASABKAlSCG9iamVjdE'
    'lkEhAKA2tleRgCIAEoB1IDa2V5EhIKBG5hbWUYAyABKAlSBG5hbWUSGwoJdW5pcXVlX2lkGAQg'
    'ASgJUgh1bmlxdWVJZBISCgRpY29uGAUgASgJUgRpY29uEiMKDWFzc3VtZWRfc3RhdGUYBiABKA'
    'hSDGFzc3VtZWRTdGF0ZToT4EAR6EAB8kAKVVNFX1NXSVRDSA==');

@$core.Deprecated('Use switchStateResponseDescriptor instead')
const SwitchStateResponse$json = {
  '1': 'SwitchStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
  ],
  '7': {},
};

/// Descriptor for `SwitchStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switchStateResponseDescriptor = $convert.base64Decode(
    'ChNTd2l0Y2hTdGF0ZVJlc3BvbnNlEhAKA2tleRgBIAEoB1IDa2V5EhQKBXN0YXRlGAIgASgIUg'
    'VzdGF0ZToW4EAa6EAB8kAKVVNFX1NXSVRDSIBBAQ==');

@$core.Deprecated('Use switchCommandRequestDescriptor instead')
const SwitchCommandRequest$json = {
  '1': 'SwitchCommandRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
  ],
  '7': {},
};

/// Descriptor for `SwitchCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switchCommandRequestDescriptor = $convert.base64Decode(
    'ChRTd2l0Y2hDb21tYW5kUmVxdWVzdBIQCgNrZXkYASABKAdSA2tleRIUCgVzdGF0ZRgCIAEoCF'
    'IFc3RhdGU6FuBAIehAAvJAClVTRV9TV0lUQ0iAQQE=');

@$core.Deprecated('Use listEntitiesTextSensorResponseDescriptor instead')
const ListEntitiesTextSensorResponse$json = {
  '1': 'ListEntitiesTextSensorResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesTextSensorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesTextSensorResponseDescriptor = $convert.base64Decode(
    'Ch5MaXN0RW50aXRpZXNUZXh0U2Vuc29yUmVzcG9uc2USGwoJb2JqZWN0X2lkGAEgASgJUghvYm'
    'plY3RJZBIQCgNrZXkYAiABKAdSA2tleRISCgRuYW1lGAMgASgJUgRuYW1lEhsKCXVuaXF1ZV9p'
    'ZBgEIAEoCVIIdW5pcXVlSWQSEgoEaWNvbhgFIAEoCVIEaWNvbjoY4EAS6EAB8kAPVVNFX1RFWF'
    'RfU0VOU09S');

@$core.Deprecated('Use textSensorStateResponseDescriptor instead')
const TextSensorStateResponse$json = {
  '1': 'TextSensorStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 9, '10': 'state'},
    {'1': 'missing_state', '3': 3, '4': 1, '5': 8, '10': 'missingState'},
  ],
  '7': {},
};

/// Descriptor for `TextSensorStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textSensorStateResponseDescriptor = $convert.base64Decode(
    'ChdUZXh0U2Vuc29yU3RhdGVSZXNwb25zZRIQCgNrZXkYASABKAdSA2tleRIUCgVzdGF0ZRgCIA'
    'EoCVIFc3RhdGUSIwoNbWlzc2luZ19zdGF0ZRgDIAEoCFIMbWlzc2luZ1N0YXRlOhvgQBvoQAHy'
    'QA9VU0VfVEVYVF9TRU5TT1KAQQE=');

@$core.Deprecated('Use subscribeLogsRequestDescriptor instead')
const SubscribeLogsRequest$json = {
  '1': 'SubscribeLogsRequest',
  '2': [
    {'1': 'level', '3': 1, '4': 1, '5': 14, '6': '.LogLevel', '10': 'level'},
    {'1': 'dump_config', '3': 2, '4': 1, '5': 8, '10': 'dumpConfig'},
  ],
  '7': {},
};

/// Descriptor for `SubscribeLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeLogsRequestDescriptor = $convert.base64Decode(
    'ChRTdWJzY3JpYmVMb2dzUmVxdWVzdBIfCgVsZXZlbBgBIAEoDjIJLkxvZ0xldmVsUgVsZXZlbB'
    'IfCgtkdW1wX2NvbmZpZxgCIAEoCFIKZHVtcENvbmZpZzoG4EAc6EAC');

@$core.Deprecated('Use subscribeLogsResponseDescriptor instead')
const SubscribeLogsResponse$json = {
  '1': 'SubscribeLogsResponse',
  '2': [
    {'1': 'level', '3': 1, '4': 1, '5': 14, '6': '.LogLevel', '10': 'level'},
    {'1': 'tag', '3': 2, '4': 1, '5': 9, '10': 'tag'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'send_failed', '3': 4, '4': 1, '5': 8, '10': 'sendFailed'},
  ],
  '7': {},
};

/// Descriptor for `SubscribeLogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeLogsResponseDescriptor = $convert.base64Decode(
    'ChVTdWJzY3JpYmVMb2dzUmVzcG9uc2USHwoFbGV2ZWwYASABKA4yCS5Mb2dMZXZlbFIFbGV2ZW'
    'wSEAoDdGFnGAIgASgJUgN0YWcSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIfCgtzZW5kX2Zh'
    'aWxlZBgEIAEoCFIKc2VuZEZhaWxlZDoM4EAd6EAB+EAAgEEA');

@$core.Deprecated('Use subscribeHomeassistantServicesRequestDescriptor instead')
const SubscribeHomeassistantServicesRequest$json = {
  '1': 'SubscribeHomeassistantServicesRequest',
  '7': {},
};

/// Descriptor for `SubscribeHomeassistantServicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeHomeassistantServicesRequestDescriptor = $convert.base64Decode(
    'CiVTdWJzY3JpYmVIb21lYXNzaXN0YW50U2VydmljZXNSZXF1ZXN0OgbgQCLoQAI=');

@$core.Deprecated('Use homeassistantServiceMapDescriptor instead')
const HomeassistantServiceMap$json = {
  '1': 'HomeassistantServiceMap',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `HomeassistantServiceMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeassistantServiceMapDescriptor = $convert.base64Decode(
    'ChdIb21lYXNzaXN0YW50U2VydmljZU1hcBIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIA'
    'EoCVIFdmFsdWU=');

@$core.Deprecated('Use homeassistantServiceResponseDescriptor instead')
const HomeassistantServiceResponse$json = {
  '1': 'HomeassistantServiceResponse',
  '2': [
    {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
    {'1': 'data', '3': 2, '4': 3, '5': 11, '6': '.HomeassistantServiceMap', '10': 'data'},
    {'1': 'data_template', '3': 3, '4': 3, '5': 11, '6': '.HomeassistantServiceMap', '10': 'dataTemplate'},
    {'1': 'variables', '3': 4, '4': 3, '5': 11, '6': '.HomeassistantServiceMap', '10': 'variables'},
    {'1': 'is_event', '3': 5, '4': 1, '5': 8, '10': 'isEvent'},
  ],
  '7': {},
};

/// Descriptor for `HomeassistantServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeassistantServiceResponseDescriptor = $convert.base64Decode(
    'ChxIb21lYXNzaXN0YW50U2VydmljZVJlc3BvbnNlEhgKB3NlcnZpY2UYASABKAlSB3NlcnZpY2'
    'USLAoEZGF0YRgCIAMoCzIYLkhvbWVhc3Npc3RhbnRTZXJ2aWNlTWFwUgRkYXRhEj0KDWRhdGFf'
    'dGVtcGxhdGUYAyADKAsyGC5Ib21lYXNzaXN0YW50U2VydmljZU1hcFIMZGF0YVRlbXBsYXRlEj'
    'YKCXZhcmlhYmxlcxgEIAMoCzIYLkhvbWVhc3Npc3RhbnRTZXJ2aWNlTWFwUgl2YXJpYWJsZXMS'
    'GQoIaXNfZXZlbnQYBSABKAhSB2lzRXZlbnQ6CeBAI+hAAYBBAQ==');

@$core.Deprecated('Use subscribeHomeAssistantStatesRequestDescriptor instead')
const SubscribeHomeAssistantStatesRequest$json = {
  '1': 'SubscribeHomeAssistantStatesRequest',
  '7': {},
};

/// Descriptor for `SubscribeHomeAssistantStatesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeHomeAssistantStatesRequestDescriptor = $convert.base64Decode(
    'CiNTdWJzY3JpYmVIb21lQXNzaXN0YW50U3RhdGVzUmVxdWVzdDoG4EAm6EAC');

@$core.Deprecated('Use subscribeHomeAssistantStateResponseDescriptor instead')
const SubscribeHomeAssistantStateResponse$json = {
  '1': 'SubscribeHomeAssistantStateResponse',
  '2': [
    {'1': 'entity_id', '3': 1, '4': 1, '5': 9, '10': 'entityId'},
    {'1': 'attribute', '3': 2, '4': 1, '5': 9, '10': 'attribute'},
  ],
  '7': {},
};

/// Descriptor for `SubscribeHomeAssistantStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeHomeAssistantStateResponseDescriptor = $convert.base64Decode(
    'CiNTdWJzY3JpYmVIb21lQXNzaXN0YW50U3RhdGVSZXNwb25zZRIbCgllbnRpdHlfaWQYASABKA'
    'lSCGVudGl0eUlkEhwKCWF0dHJpYnV0ZRgCIAEoCVIJYXR0cmlidXRlOgbgQCfoQAE=');

@$core.Deprecated('Use homeAssistantStateResponseDescriptor instead')
const HomeAssistantStateResponse$json = {
  '1': 'HomeAssistantStateResponse',
  '2': [
    {'1': 'entity_id', '3': 1, '4': 1, '5': 9, '10': 'entityId'},
    {'1': 'state', '3': 2, '4': 1, '5': 9, '10': 'state'},
    {'1': 'attribute', '3': 3, '4': 1, '5': 9, '10': 'attribute'},
  ],
  '7': {},
};

/// Descriptor for `HomeAssistantStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeAssistantStateResponseDescriptor = $convert.base64Decode(
    'ChpIb21lQXNzaXN0YW50U3RhdGVSZXNwb25zZRIbCgllbnRpdHlfaWQYASABKAlSCGVudGl0eU'
    'lkEhQKBXN0YXRlGAIgASgJUgVzdGF0ZRIcCglhdHRyaWJ1dGUYAyABKAlSCWF0dHJpYnV0ZToJ'
    '4EAo6EACgEEB');

@$core.Deprecated('Use getTimeRequestDescriptor instead')
const GetTimeRequest$json = {
  '1': 'GetTimeRequest',
  '7': {},
};

/// Descriptor for `GetTimeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTimeRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRUaW1lUmVxdWVzdDoG4EAk6EAA');

@$core.Deprecated('Use getTimeResponseDescriptor instead')
const GetTimeResponse$json = {
  '1': 'GetTimeResponse',
  '2': [
    {'1': 'epoch_seconds', '3': 1, '4': 1, '5': 7, '10': 'epochSeconds'},
  ],
  '7': {},
};

/// Descriptor for `GetTimeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTimeResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRUaW1lUmVzcG9uc2USIwoNZXBvY2hfc2Vjb25kcxgBIAEoB1IMZXBvY2hTZWNvbmRzOg'
    'ngQCXoQACAQQE=');

@$core.Deprecated('Use listEntitiesServicesArgumentDescriptor instead')
const ListEntitiesServicesArgument$json = {
  '1': 'ListEntitiesServicesArgument',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.ServiceArgType', '10': 'type'},
  ],
};

/// Descriptor for `ListEntitiesServicesArgument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesServicesArgumentDescriptor = $convert.base64Decode(
    'ChxMaXN0RW50aXRpZXNTZXJ2aWNlc0FyZ3VtZW50EhIKBG5hbWUYASABKAlSBG5hbWUSIwoEdH'
    'lwZRgCIAEoDjIPLlNlcnZpY2VBcmdUeXBlUgR0eXBl');

@$core.Deprecated('Use listEntitiesServicesResponseDescriptor instead')
const ListEntitiesServicesResponse$json = {
  '1': 'ListEntitiesServicesResponse',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'args', '3': 3, '4': 3, '5': 11, '6': '.ListEntitiesServicesArgument', '10': 'args'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesServicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesServicesResponseDescriptor = $convert.base64Decode(
    'ChxMaXN0RW50aXRpZXNTZXJ2aWNlc1Jlc3BvbnNlEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDa2'
    'V5GAIgASgHUgNrZXkSMQoEYXJncxgDIAMoCzIdLkxpc3RFbnRpdGllc1NlcnZpY2VzQXJndW1l'
    'bnRSBGFyZ3M6BuBAKehAAQ==');

@$core.Deprecated('Use executeServiceArgumentDescriptor instead')
const ExecuteServiceArgument$json = {
  '1': 'ExecuteServiceArgument',
  '2': [
    {'1': 'bool_', '3': 1, '4': 1, '5': 8, '10': 'bool'},
    {'1': 'legacy_int', '3': 2, '4': 1, '5': 5, '10': 'legacyInt'},
    {'1': 'float_', '3': 3, '4': 1, '5': 2, '10': 'float'},
    {'1': 'string_', '3': 4, '4': 1, '5': 9, '10': 'string'},
    {'1': 'int_', '3': 5, '4': 1, '5': 17, '10': 'int'},
    {
      '1': 'bool_array',
      '3': 6,
      '4': 3,
      '5': 8,
      '8': {'2': false},
      '10': 'boolArray',
    },
    {
      '1': 'int_array',
      '3': 7,
      '4': 3,
      '5': 17,
      '8': {'2': false},
      '10': 'intArray',
    },
    {
      '1': 'float_array',
      '3': 8,
      '4': 3,
      '5': 2,
      '8': {'2': false},
      '10': 'floatArray',
    },
    {'1': 'string_array', '3': 9, '4': 3, '5': 9, '10': 'stringArray'},
  ],
};

/// Descriptor for `ExecuteServiceArgument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeServiceArgumentDescriptor = $convert.base64Decode(
    'ChZFeGVjdXRlU2VydmljZUFyZ3VtZW50EhMKBWJvb2xfGAEgASgIUgRib29sEh0KCmxlZ2FjeV'
    '9pbnQYAiABKAVSCWxlZ2FjeUludBIVCgZmbG9hdF8YAyABKAJSBWZsb2F0EhcKB3N0cmluZ18Y'
    'BCABKAlSBnN0cmluZxIRCgRpbnRfGAUgASgRUgNpbnQSIQoKYm9vbF9hcnJheRgGIAMoCEICEA'
    'BSCWJvb2xBcnJheRIfCglpbnRfYXJyYXkYByADKBFCAhAAUghpbnRBcnJheRIjCgtmbG9hdF9h'
    'cnJheRgIIAMoAkICEABSCmZsb2F0QXJyYXkSIQoMc3RyaW5nX2FycmF5GAkgAygJUgtzdHJpbm'
    'dBcnJheQ==');

@$core.Deprecated('Use executeServiceRequestDescriptor instead')
const ExecuteServiceRequest$json = {
  '1': 'ExecuteServiceRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'args', '3': 2, '4': 3, '5': 11, '6': '.ExecuteServiceArgument', '10': 'args'},
  ],
  '7': {},
};

/// Descriptor for `ExecuteServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeServiceRequestDescriptor = $convert.base64Decode(
    'ChVFeGVjdXRlU2VydmljZVJlcXVlc3QSEAoDa2V5GAEgASgHUgNrZXkSKwoEYXJncxgCIAMoCz'
    'IXLkV4ZWN1dGVTZXJ2aWNlQXJndW1lbnRSBGFyZ3M6CeBAKuhAAoBBAQ==');

@$core.Deprecated('Use listEntitiesCameraResponseDescriptor instead')
const ListEntitiesCameraResponse$json = {
  '1': 'ListEntitiesCameraResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesCameraResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesCameraResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0RW50aXRpZXNDYW1lcmFSZXNwb25zZRIbCglvYmplY3RfaWQYASABKAlSCG9iamVjdE'
    'lkEhAKA2tleRgCIAEoB1IDa2V5EhIKBG5hbWUYAyABKAlSBG5hbWUSGwoJdW5pcXVlX2lkGAQg'
    'ASgJUgh1bmlxdWVJZDoZ4EAr6EAB8kAQVVNFX0VTUDMyX0NBTUVSQQ==');

@$core.Deprecated('Use cameraImageResponseDescriptor instead')
const CameraImageResponse$json = {
  '1': 'CameraImageResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {'1': 'done', '3': 3, '4': 1, '5': 8, '10': 'done'},
  ],
  '7': {},
};

/// Descriptor for `CameraImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraImageResponseDescriptor = $convert.base64Decode(
    'ChNDYW1lcmFJbWFnZVJlc3BvbnNlEhAKA2tleRgBIAEoB1IDa2V5EhIKBGRhdGEYAiABKAxSBG'
    'RhdGESEgoEZG9uZRgDIAEoCFIEZG9uZToZ4EAs6EAB8kAQVVNFX0VTUDMyX0NBTUVSQQ==');

@$core.Deprecated('Use cameraImageRequestDescriptor instead')
const CameraImageRequest$json = {
  '1': 'CameraImageRequest',
  '2': [
    {'1': 'single', '3': 1, '4': 1, '5': 8, '10': 'single'},
    {'1': 'stream', '3': 2, '4': 1, '5': 8, '10': 'stream'},
  ],
  '7': {},
};

/// Descriptor for `CameraImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraImageRequestDescriptor = $convert.base64Decode(
    'ChJDYW1lcmFJbWFnZVJlcXVlc3QSFgoGc2luZ2xlGAEgASgIUgZzaW5nbGUSFgoGc3RyZWFtGA'
    'IgASgIUgZzdHJlYW06HOBALehAAvJAEFVTRV9FU1AzMl9DQU1FUkGAQQE=');

@$core.Deprecated('Use listEntitiesClimateResponseDescriptor instead')
const ListEntitiesClimateResponse$json = {
  '1': 'ListEntitiesClimateResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'supports_current_temperature', '3': 5, '4': 1, '5': 8, '10': 'supportsCurrentTemperature'},
    {'1': 'supports_two_point_target_temperature', '3': 6, '4': 1, '5': 8, '10': 'supportsTwoPointTargetTemperature'},
    {'1': 'supported_modes', '3': 7, '4': 3, '5': 14, '6': '.ClimateMode', '10': 'supportedModes'},
    {'1': 'visual_min_temperature', '3': 8, '4': 1, '5': 2, '10': 'visualMinTemperature'},
    {'1': 'visual_max_temperature', '3': 9, '4': 1, '5': 2, '10': 'visualMaxTemperature'},
    {'1': 'visual_temperature_step', '3': 10, '4': 1, '5': 2, '10': 'visualTemperatureStep'},
    {'1': 'legacy_supports_away', '3': 11, '4': 1, '5': 8, '10': 'legacySupportsAway'},
    {'1': 'supports_action', '3': 12, '4': 1, '5': 8, '10': 'supportsAction'},
    {'1': 'supported_fan_modes', '3': 13, '4': 3, '5': 14, '6': '.ClimateFanMode', '10': 'supportedFanModes'},
    {'1': 'supported_swing_modes', '3': 14, '4': 3, '5': 14, '6': '.ClimateSwingMode', '10': 'supportedSwingModes'},
    {'1': 'supported_custom_fan_modes', '3': 15, '4': 3, '5': 9, '10': 'supportedCustomFanModes'},
    {'1': 'supported_presets', '3': 16, '4': 3, '5': 14, '6': '.ClimatePreset', '10': 'supportedPresets'},
    {'1': 'supported_custom_presets', '3': 17, '4': 3, '5': 9, '10': 'supportedCustomPresets'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesClimateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesClimateResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0RW50aXRpZXNDbGltYXRlUmVzcG9uc2USGwoJb2JqZWN0X2lkGAEgASgJUghvYmplY3'
    'RJZBIQCgNrZXkYAiABKAdSA2tleRISCgRuYW1lGAMgASgJUgRuYW1lEhsKCXVuaXF1ZV9pZBgE'
    'IAEoCVIIdW5pcXVlSWQSQAocc3VwcG9ydHNfY3VycmVudF90ZW1wZXJhdHVyZRgFIAEoCFIac3'
    'VwcG9ydHNDdXJyZW50VGVtcGVyYXR1cmUSUAolc3VwcG9ydHNfdHdvX3BvaW50X3RhcmdldF90'
    'ZW1wZXJhdHVyZRgGIAEoCFIhc3VwcG9ydHNUd29Qb2ludFRhcmdldFRlbXBlcmF0dXJlEjUKD3'
    'N1cHBvcnRlZF9tb2RlcxgHIAMoDjIMLkNsaW1hdGVNb2RlUg5zdXBwb3J0ZWRNb2RlcxI0ChZ2'
    'aXN1YWxfbWluX3RlbXBlcmF0dXJlGAggASgCUhR2aXN1YWxNaW5UZW1wZXJhdHVyZRI0ChZ2aX'
    'N1YWxfbWF4X3RlbXBlcmF0dXJlGAkgASgCUhR2aXN1YWxNYXhUZW1wZXJhdHVyZRI2Chd2aXN1'
    'YWxfdGVtcGVyYXR1cmVfc3RlcBgKIAEoAlIVdmlzdWFsVGVtcGVyYXR1cmVTdGVwEjAKFGxlZ2'
    'FjeV9zdXBwb3J0c19hd2F5GAsgASgIUhJsZWdhY3lTdXBwb3J0c0F3YXkSJwoPc3VwcG9ydHNf'
    'YWN0aW9uGAwgASgIUg5zdXBwb3J0c0FjdGlvbhI/ChNzdXBwb3J0ZWRfZmFuX21vZGVzGA0gAy'
    'gOMg8uQ2xpbWF0ZUZhbk1vZGVSEXN1cHBvcnRlZEZhbk1vZGVzEkUKFXN1cHBvcnRlZF9zd2lu'
    'Z19tb2RlcxgOIAMoDjIRLkNsaW1hdGVTd2luZ01vZGVSE3N1cHBvcnRlZFN3aW5nTW9kZXMSOw'
    'oac3VwcG9ydGVkX2N1c3RvbV9mYW5fbW9kZXMYDyADKAlSF3N1cHBvcnRlZEN1c3RvbUZhbk1v'
    'ZGVzEjsKEXN1cHBvcnRlZF9wcmVzZXRzGBAgAygOMg4uQ2xpbWF0ZVByZXNldFIQc3VwcG9ydG'
    'VkUHJlc2V0cxI4ChhzdXBwb3J0ZWRfY3VzdG9tX3ByZXNldHMYESADKAlSFnN1cHBvcnRlZEN1'
    'c3RvbVByZXNldHM6FOBALuhAAfJAC1VTRV9DTElNQVRF');

@$core.Deprecated('Use climateStateResponseDescriptor instead')
const ClimateStateResponse$json = {
  '1': 'ClimateStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'mode', '3': 2, '4': 1, '5': 14, '6': '.ClimateMode', '10': 'mode'},
    {'1': 'current_temperature', '3': 3, '4': 1, '5': 2, '10': 'currentTemperature'},
    {'1': 'target_temperature', '3': 4, '4': 1, '5': 2, '10': 'targetTemperature'},
    {'1': 'target_temperature_low', '3': 5, '4': 1, '5': 2, '10': 'targetTemperatureLow'},
    {'1': 'target_temperature_high', '3': 6, '4': 1, '5': 2, '10': 'targetTemperatureHigh'},
    {'1': 'legacy_away', '3': 7, '4': 1, '5': 8, '10': 'legacyAway'},
    {'1': 'action', '3': 8, '4': 1, '5': 14, '6': '.ClimateAction', '10': 'action'},
    {'1': 'fan_mode', '3': 9, '4': 1, '5': 14, '6': '.ClimateFanMode', '10': 'fanMode'},
    {'1': 'swing_mode', '3': 10, '4': 1, '5': 14, '6': '.ClimateSwingMode', '10': 'swingMode'},
    {'1': 'custom_fan_mode', '3': 11, '4': 1, '5': 9, '10': 'customFanMode'},
    {'1': 'preset', '3': 12, '4': 1, '5': 14, '6': '.ClimatePreset', '10': 'preset'},
    {'1': 'custom_preset', '3': 13, '4': 1, '5': 9, '10': 'customPreset'},
  ],
  '7': {},
};

/// Descriptor for `ClimateStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List climateStateResponseDescriptor = $convert.base64Decode(
    'ChRDbGltYXRlU3RhdGVSZXNwb25zZRIQCgNrZXkYASABKAdSA2tleRIgCgRtb2RlGAIgASgOMg'
    'wuQ2xpbWF0ZU1vZGVSBG1vZGUSLwoTY3VycmVudF90ZW1wZXJhdHVyZRgDIAEoAlISY3VycmVu'
    'dFRlbXBlcmF0dXJlEi0KEnRhcmdldF90ZW1wZXJhdHVyZRgEIAEoAlIRdGFyZ2V0VGVtcGVyYX'
    'R1cmUSNAoWdGFyZ2V0X3RlbXBlcmF0dXJlX2xvdxgFIAEoAlIUdGFyZ2V0VGVtcGVyYXR1cmVM'
    'b3cSNgoXdGFyZ2V0X3RlbXBlcmF0dXJlX2hpZ2gYBiABKAJSFXRhcmdldFRlbXBlcmF0dXJlSG'
    'lnaBIfCgtsZWdhY3lfYXdheRgHIAEoCFIKbGVnYWN5QXdheRImCgZhY3Rpb24YCCABKA4yDi5D'
    'bGltYXRlQWN0aW9uUgZhY3Rpb24SKgoIZmFuX21vZGUYCSABKA4yDy5DbGltYXRlRmFuTW9kZV'
    'IHZmFuTW9kZRIwCgpzd2luZ19tb2RlGAogASgOMhEuQ2xpbWF0ZVN3aW5nTW9kZVIJc3dpbmdN'
    'b2RlEiYKD2N1c3RvbV9mYW5fbW9kZRgLIAEoCVINY3VzdG9tRmFuTW9kZRImCgZwcmVzZXQYDC'
    'ABKA4yDi5DbGltYXRlUHJlc2V0UgZwcmVzZXQSIwoNY3VzdG9tX3ByZXNldBgNIAEoCVIMY3Vz'
    'dG9tUHJlc2V0OhfgQC/oQAHyQAtVU0VfQ0xJTUFURYBBAQ==');

@$core.Deprecated('Use climateCommandRequestDescriptor instead')
const ClimateCommandRequest$json = {
  '1': 'ClimateCommandRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'has_mode', '3': 2, '4': 1, '5': 8, '10': 'hasMode'},
    {'1': 'mode', '3': 3, '4': 1, '5': 14, '6': '.ClimateMode', '10': 'mode'},
    {'1': 'has_target_temperature', '3': 4, '4': 1, '5': 8, '10': 'hasTargetTemperature'},
    {'1': 'target_temperature', '3': 5, '4': 1, '5': 2, '10': 'targetTemperature'},
    {'1': 'has_target_temperature_low', '3': 6, '4': 1, '5': 8, '10': 'hasTargetTemperatureLow'},
    {'1': 'target_temperature_low', '3': 7, '4': 1, '5': 2, '10': 'targetTemperatureLow'},
    {'1': 'has_target_temperature_high', '3': 8, '4': 1, '5': 8, '10': 'hasTargetTemperatureHigh'},
    {'1': 'target_temperature_high', '3': 9, '4': 1, '5': 2, '10': 'targetTemperatureHigh'},
    {'1': 'has_legacy_away', '3': 10, '4': 1, '5': 8, '10': 'hasLegacyAway'},
    {'1': 'legacy_away', '3': 11, '4': 1, '5': 8, '10': 'legacyAway'},
    {'1': 'has_fan_mode', '3': 12, '4': 1, '5': 8, '10': 'hasFanMode'},
    {'1': 'fan_mode', '3': 13, '4': 1, '5': 14, '6': '.ClimateFanMode', '10': 'fanMode'},
    {'1': 'has_swing_mode', '3': 14, '4': 1, '5': 8, '10': 'hasSwingMode'},
    {'1': 'swing_mode', '3': 15, '4': 1, '5': 14, '6': '.ClimateSwingMode', '10': 'swingMode'},
    {'1': 'has_custom_fan_mode', '3': 16, '4': 1, '5': 8, '10': 'hasCustomFanMode'},
    {'1': 'custom_fan_mode', '3': 17, '4': 1, '5': 9, '10': 'customFanMode'},
    {'1': 'has_preset', '3': 18, '4': 1, '5': 8, '10': 'hasPreset'},
    {'1': 'preset', '3': 19, '4': 1, '5': 14, '6': '.ClimatePreset', '10': 'preset'},
    {'1': 'has_custom_preset', '3': 20, '4': 1, '5': 8, '10': 'hasCustomPreset'},
    {'1': 'custom_preset', '3': 21, '4': 1, '5': 9, '10': 'customPreset'},
  ],
  '7': {},
};

/// Descriptor for `ClimateCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List climateCommandRequestDescriptor = $convert.base64Decode(
    'ChVDbGltYXRlQ29tbWFuZFJlcXVlc3QSEAoDa2V5GAEgASgHUgNrZXkSGQoIaGFzX21vZGUYAi'
    'ABKAhSB2hhc01vZGUSIAoEbW9kZRgDIAEoDjIMLkNsaW1hdGVNb2RlUgRtb2RlEjQKFmhhc190'
    'YXJnZXRfdGVtcGVyYXR1cmUYBCABKAhSFGhhc1RhcmdldFRlbXBlcmF0dXJlEi0KEnRhcmdldF'
    '90ZW1wZXJhdHVyZRgFIAEoAlIRdGFyZ2V0VGVtcGVyYXR1cmUSOwoaaGFzX3RhcmdldF90ZW1w'
    'ZXJhdHVyZV9sb3cYBiABKAhSF2hhc1RhcmdldFRlbXBlcmF0dXJlTG93EjQKFnRhcmdldF90ZW'
    '1wZXJhdHVyZV9sb3cYByABKAJSFHRhcmdldFRlbXBlcmF0dXJlTG93Ej0KG2hhc190YXJnZXRf'
    'dGVtcGVyYXR1cmVfaGlnaBgIIAEoCFIYaGFzVGFyZ2V0VGVtcGVyYXR1cmVIaWdoEjYKF3Rhcm'
    'dldF90ZW1wZXJhdHVyZV9oaWdoGAkgASgCUhV0YXJnZXRUZW1wZXJhdHVyZUhpZ2gSJgoPaGFz'
    'X2xlZ2FjeV9hd2F5GAogASgIUg1oYXNMZWdhY3lBd2F5Eh8KC2xlZ2FjeV9hd2F5GAsgASgIUg'
    'psZWdhY3lBd2F5EiAKDGhhc19mYW5fbW9kZRgMIAEoCFIKaGFzRmFuTW9kZRIqCghmYW5fbW9k'
    'ZRgNIAEoDjIPLkNsaW1hdGVGYW5Nb2RlUgdmYW5Nb2RlEiQKDmhhc19zd2luZ19tb2RlGA4gAS'
    'gIUgxoYXNTd2luZ01vZGUSMAoKc3dpbmdfbW9kZRgPIAEoDjIRLkNsaW1hdGVTd2luZ01vZGVS'
    'CXN3aW5nTW9kZRItChNoYXNfY3VzdG9tX2Zhbl9tb2RlGBAgASgIUhBoYXNDdXN0b21GYW5Nb2'
    'RlEiYKD2N1c3RvbV9mYW5fbW9kZRgRIAEoCVINY3VzdG9tRmFuTW9kZRIdCgpoYXNfcHJlc2V0'
    'GBIgASgIUgloYXNQcmVzZXQSJgoGcHJlc2V0GBMgASgOMg4uQ2xpbWF0ZVByZXNldFIGcHJlc2'
    'V0EioKEWhhc19jdXN0b21fcHJlc2V0GBQgASgIUg9oYXNDdXN0b21QcmVzZXQSIwoNY3VzdG9t'
    'X3ByZXNldBgVIAEoCVIMY3VzdG9tUHJlc2V0OhfgQDDoQALyQAtVU0VfQ0xJTUFURYBBAQ==');

@$core.Deprecated('Use listEntitiesNumberResponseDescriptor instead')
const ListEntitiesNumberResponse$json = {
  '1': 'ListEntitiesNumberResponse',
  '2': [
    {'1': 'object_id', '3': 1, '4': 1, '5': 9, '10': 'objectId'},
    {'1': 'key', '3': 2, '4': 1, '5': 7, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'unique_id', '3': 4, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'min_value', '3': 6, '4': 1, '5': 2, '10': 'minValue'},
    {'1': 'max_value', '3': 7, '4': 1, '5': 2, '10': 'maxValue'},
    {'1': 'step', '3': 8, '4': 1, '5': 2, '10': 'step'},
  ],
  '7': {},
};

/// Descriptor for `ListEntitiesNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEntitiesNumberResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0RW50aXRpZXNOdW1iZXJSZXNwb25zZRIbCglvYmplY3RfaWQYASABKAlSCG9iamVjdE'
    'lkEhAKA2tleRgCIAEoB1IDa2V5EhIKBG5hbWUYAyABKAlSBG5hbWUSGwoJdW5pcXVlX2lkGAQg'
    'ASgJUgh1bmlxdWVJZBISCgRpY29uGAUgASgJUgRpY29uEhsKCW1pbl92YWx1ZRgGIAEoAlIIbW'
    'luVmFsdWUSGwoJbWF4X3ZhbHVlGAcgASgCUghtYXhWYWx1ZRISCgRzdGVwGAggASgCUgRzdGVw'
    'OhPgQDHoQAHyQApVU0VfTlVNQkVS');

@$core.Deprecated('Use numberStateResponseDescriptor instead')
const NumberStateResponse$json = {
  '1': 'NumberStateResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 2, '10': 'state'},
    {'1': 'missing_state', '3': 3, '4': 1, '5': 8, '10': 'missingState'},
  ],
  '7': {},
};

/// Descriptor for `NumberStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberStateResponseDescriptor = $convert.base64Decode(
    'ChNOdW1iZXJTdGF0ZVJlc3BvbnNlEhAKA2tleRgBIAEoB1IDa2V5EhQKBXN0YXRlGAIgASgCUg'
    'VzdGF0ZRIjCg1taXNzaW5nX3N0YXRlGAMgASgIUgxtaXNzaW5nU3RhdGU6FuBAMuhAAfJAClVT'
    'RV9OVU1CRVKAQQE=');

@$core.Deprecated('Use numberCommandRequestDescriptor instead')
const NumberCommandRequest$json = {
  '1': 'NumberCommandRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'state', '3': 2, '4': 1, '5': 2, '10': 'state'},
  ],
  '7': {},
};

/// Descriptor for `NumberCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberCommandRequestDescriptor = $convert.base64Decode(
    'ChROdW1iZXJDb21tYW5kUmVxdWVzdBIQCgNrZXkYASABKAdSA2tleRIUCgVzdGF0ZRgCIAEoAl'
    'IFc3RhdGU6FuBAM+hAAvJAClVTRV9OVU1CRVKAQQE=');

const $core.Map<$core.String, $core.dynamic> APIConnectionServiceBase$json = {
  '1': 'APIConnection',
  '2': [
    {'1': 'hello', '2': '.HelloRequest', '3': '.HelloResponse', '4': {}},
    {'1': 'connect', '2': '.ConnectRequest', '3': '.ConnectResponse', '4': {}},
    {'1': 'disconnect', '2': '.DisconnectRequest', '3': '.DisconnectResponse', '4': {}},
    {'1': 'ping', '2': '.PingRequest', '3': '.PingResponse', '4': {}},
    {'1': 'device_info', '2': '.DeviceInfoRequest', '3': '.DeviceInfoResponse', '4': {}},
    {'1': 'list_entities', '2': '.ListEntitiesRequest', '3': '.void', '4': {}},
    {'1': 'subscribe_states', '2': '.SubscribeStatesRequest', '3': '.void', '4': {}},
    {'1': 'subscribe_logs', '2': '.SubscribeLogsRequest', '3': '.void', '4': {}},
    {'1': 'subscribe_homeassistant_services', '2': '.SubscribeHomeassistantServicesRequest', '3': '.void', '4': {}},
    {'1': 'subscribe_home_assistant_states', '2': '.SubscribeHomeAssistantStatesRequest', '3': '.void', '4': {}},
    {'1': 'get_time', '2': '.GetTimeRequest', '3': '.GetTimeResponse', '4': {}},
    {'1': 'execute_service', '2': '.ExecuteServiceRequest', '3': '.void', '4': {}},
    {'1': 'cover_command', '2': '.CoverCommandRequest', '3': '.void', '4': {}},
    {'1': 'fan_command', '2': '.FanCommandRequest', '3': '.void', '4': {}},
    {'1': 'light_command', '2': '.LightCommandRequest', '3': '.void', '4': {}},
    {'1': 'switch_command', '2': '.SwitchCommandRequest', '3': '.void', '4': {}},
    {'1': 'camera_image', '2': '.CameraImageRequest', '3': '.void', '4': {}},
    {'1': 'climate_command', '2': '.ClimateCommandRequest', '3': '.void', '4': {}},
    {'1': 'number_command', '2': '.NumberCommandRequest', '3': '.void', '4': {}},
  ],
};

@$core.Deprecated('Use aPIConnectionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> APIConnectionServiceBase$messageJson = {
  '.HelloRequest': HelloRequest$json,
  '.HelloResponse': HelloResponse$json,
  '.ConnectRequest': ConnectRequest$json,
  '.ConnectResponse': ConnectResponse$json,
  '.DisconnectRequest': DisconnectRequest$json,
  '.DisconnectResponse': DisconnectResponse$json,
  '.PingRequest': PingRequest$json,
  '.PingResponse': PingResponse$json,
  '.DeviceInfoRequest': DeviceInfoRequest$json,
  '.DeviceInfoResponse': DeviceInfoResponse$json,
  '.ListEntitiesRequest': ListEntitiesRequest$json,
  '.void': $0.void_$json,
  '.SubscribeStatesRequest': SubscribeStatesRequest$json,
  '.SubscribeLogsRequest': SubscribeLogsRequest$json,
  '.SubscribeHomeassistantServicesRequest': SubscribeHomeassistantServicesRequest$json,
  '.SubscribeHomeAssistantStatesRequest': SubscribeHomeAssistantStatesRequest$json,
  '.GetTimeRequest': GetTimeRequest$json,
  '.GetTimeResponse': GetTimeResponse$json,
  '.ExecuteServiceRequest': ExecuteServiceRequest$json,
  '.ExecuteServiceArgument': ExecuteServiceArgument$json,
  '.CoverCommandRequest': CoverCommandRequest$json,
  '.FanCommandRequest': FanCommandRequest$json,
  '.LightCommandRequest': LightCommandRequest$json,
  '.SwitchCommandRequest': SwitchCommandRequest$json,
  '.CameraImageRequest': CameraImageRequest$json,
  '.ClimateCommandRequest': ClimateCommandRequest$json,
  '.NumberCommandRequest': NumberCommandRequest$json,
};

/// Descriptor for `APIConnection`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List aPIConnectionServiceDescriptor = $convert.base64Decode(
    'Cg1BUElDb25uZWN0aW9uEi4KBWhlbGxvEg0uSGVsbG9SZXF1ZXN0Gg4uSGVsbG9SZXNwb25zZS'
    'IG8EAA+EAAEjQKB2Nvbm5lY3QSDy5Db25uZWN0UmVxdWVzdBoQLkNvbm5lY3RSZXNwb25zZSIG'
    '8EAA+EAAEj0KCmRpc2Nvbm5lY3QSEi5EaXNjb25uZWN0UmVxdWVzdBoTLkRpc2Nvbm5lY3RSZX'
    'Nwb25zZSIG8EAA+EAAEisKBHBpbmcSDC5QaW5nUmVxdWVzdBoNLlBpbmdSZXNwb25zZSIG8EAA'
    '+EAAEjsKC2RldmljZV9pbmZvEhIuRGV2aWNlSW5mb1JlcXVlc3QaEy5EZXZpY2VJbmZvUmVzcG'
    '9uc2UiA/hAABIuCg1saXN0X2VudGl0aWVzEhQuTGlzdEVudGl0aWVzUmVxdWVzdBoFLnZvaWQi'
    'ABI0ChBzdWJzY3JpYmVfc3RhdGVzEhcuU3Vic2NyaWJlU3RhdGVzUmVxdWVzdBoFLnZvaWQiAB'
    'IwCg5zdWJzY3JpYmVfbG9ncxIVLlN1YnNjcmliZUxvZ3NSZXF1ZXN0GgUudm9pZCIAElMKIHN1'
    'YnNjcmliZV9ob21lYXNzaXN0YW50X3NlcnZpY2VzEiYuU3Vic2NyaWJlSG9tZWFzc2lzdGFudF'
    'NlcnZpY2VzUmVxdWVzdBoFLnZvaWQiABJQCh9zdWJzY3JpYmVfaG9tZV9hc3Npc3RhbnRfc3Rh'
    'dGVzEiQuU3Vic2NyaWJlSG9tZUFzc2lzdGFudFN0YXRlc1JlcXVlc3QaBS52b2lkIgASMgoIZ2'
    'V0X3RpbWUSDy5HZXRUaW1lUmVxdWVzdBoQLkdldFRpbWVSZXNwb25zZSID+EAAEjIKD2V4ZWN1'
    'dGVfc2VydmljZRIWLkV4ZWN1dGVTZXJ2aWNlUmVxdWVzdBoFLnZvaWQiABIuCg1jb3Zlcl9jb2'
    '1tYW5kEhQuQ292ZXJDb21tYW5kUmVxdWVzdBoFLnZvaWQiABIqCgtmYW5fY29tbWFuZBISLkZh'
    'bkNvbW1hbmRSZXF1ZXN0GgUudm9pZCIAEi4KDWxpZ2h0X2NvbW1hbmQSFC5MaWdodENvbW1hbm'
    'RSZXF1ZXN0GgUudm9pZCIAEjAKDnN3aXRjaF9jb21tYW5kEhUuU3dpdGNoQ29tbWFuZFJlcXVl'
    'c3QaBS52b2lkIgASLAoMY2FtZXJhX2ltYWdlEhMuQ2FtZXJhSW1hZ2VSZXF1ZXN0GgUudm9pZC'
    'IAEjIKD2NsaW1hdGVfY29tbWFuZBIWLkNsaW1hdGVDb21tYW5kUmVxdWVzdBoFLnZvaWQiABIw'
    'Cg5udW1iZXJfY29tbWFuZBIVLk51bWJlckNvbW1hbmRSZXF1ZXN0GgUudm9pZCIA');

