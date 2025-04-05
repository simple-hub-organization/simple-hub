//
//  Generated code. Do not modify.
//  source: aioesphomeapi/api_options.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class APISourceType extends $pb.ProtobufEnum {
  static const APISourceType SOURCE_BOTH = APISourceType._(0, _omitEnumNames ? '' : 'SOURCE_BOTH');
  static const APISourceType SOURCE_SERVER = APISourceType._(1, _omitEnumNames ? '' : 'SOURCE_SERVER');
  static const APISourceType SOURCE_CLIENT = APISourceType._(2, _omitEnumNames ? '' : 'SOURCE_CLIENT');

  static const $core.List<APISourceType> values = <APISourceType> [
    SOURCE_BOTH,
    SOURCE_SERVER,
    SOURCE_CLIENT,
  ];

  static final $core.Map<$core.int, APISourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static APISourceType? valueOf($core.int value) => _byValue[value];

  const APISourceType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
