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

import 'api_options.pbenum.dart';

export 'api_options.pbenum.dart';

class void_ extends $pb.GeneratedMessage {
  factory void_() => create();
  void_._() : super();
  factory void_.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory void_.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'void', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  void_ clone() => void_()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  void_ copyWith(void Function(void_) updates) => super.copyWith((message) => updates(message as void_)) as void_;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static void_ create() => void_._();
  void_ createEmptyInstance() => create();
  static $pb.PbList<void_> createRepeated() => $pb.PbList<void_>();
  @$core.pragma('dart2js:noInline')
  static void_ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<void_>(create);
  static void_? _defaultInstance;
}

class Api_options {
  static final needsSetupConnection = $pb.Extension<$core.bool>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'needsSetupConnection', 1038, $pb.PbFieldType.OB, defaultOrMaker: true);
  static final needsAuthentication = $pb.Extension<$core.bool>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'needsAuthentication', 1039, $pb.PbFieldType.OB, defaultOrMaker: true);
  static final id = $pb.Extension<$core.int>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'id', 1036, $pb.PbFieldType.OU3);
  static final source = $pb.Extension<APISourceType>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'source', 1037, $pb.PbFieldType.OE, defaultOrMaker: APISourceType.SOURCE_BOTH, valueOf: APISourceType.valueOf, enumValues: APISourceType.values);
  static final ifdef = $pb.Extension<$core.String>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'ifdef', 1038, $pb.PbFieldType.OS);
  static final log = $pb.Extension<$core.bool>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'log', 1039, $pb.PbFieldType.OB, defaultOrMaker: true);
  static final noDelay = $pb.Extension<$core.bool>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'noDelay', 1040, $pb.PbFieldType.OB);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(needsSetupConnection);
    registry.add(needsAuthentication);
    registry.add(id);
    registry.add(source);
    registry.add(ifdef);
    registry.add(log);
    registry.add(noDelay);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
