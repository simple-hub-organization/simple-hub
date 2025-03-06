//
//  Generated code. Do not modify.
//  source: cbj_app_connections.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CompInfoSB extends $pb.GeneratedMessage {
  factory CompInfoSB({
    $core.String? compIP,
  }) {
    final $result = create();
    if (compIP != null) {
      $result.compIP = compIP;
    }
    return $result;
  }
  CompInfoSB._() : super();
  factory CompInfoSB.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompInfoSB.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompInfoSB', package: const $pb.PackageName(_omitMessageNames ? '' : 'CBJAppConnections'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'compIP', protoName: 'compIP')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompInfoSB clone() => CompInfoSB()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompInfoSB copyWith(void Function(CompInfoSB) updates) => super.copyWith((message) => updates(message as CompInfoSB)) as CompInfoSB;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompInfoSB create() => CompInfoSB._();
  CompInfoSB createEmptyInstance() => create();
  static $pb.PbList<CompInfoSB> createRepeated() => $pb.PbList<CompInfoSB>();
  @$core.pragma('dart2js:noInline')
  static CompInfoSB getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompInfoSB>(create);
  static CompInfoSB? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get compIP => $_getSZ(0);
  @$pb.TagNumber(2)
  set compIP($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompIP() => $_has(0);
  @$pb.TagNumber(2)
  void clearCompIP() => clearField(2);
}

/// Did the commend arrived (true) or not (false)
class CBJCommendStatus extends $pb.GeneratedMessage {
  factory CBJCommendStatus({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  CBJCommendStatus._() : super();
  factory CBJCommendStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CBJCommendStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CBJCommendStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'CBJAppConnections'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CBJCommendStatus clone() => CBJCommendStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CBJCommendStatus copyWith(void Function(CBJCommendStatus) updates) => super.copyWith((message) => updates(message as CBJCommendStatus)) as CBJCommendStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CBJCommendStatus create() => CBJCommendStatus._();
  CBJCommendStatus createEmptyInstance() => create();
  static $pb.PbList<CBJCommendStatus> createRepeated() => $pb.PbList<CBJCommendStatus>();
  @$core.pragma('dart2js:noInline')
  static CBJCommendStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CBJCommendStatus>(create);
  static CBJCommendStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CompAppInfo extends $pb.GeneratedMessage {
  factory CompAppInfo({
    CbjAppIno? cbjInfo,
    CompAppSpecs? compSpecs,
  }) {
    final $result = create();
    if (cbjInfo != null) {
      $result.cbjInfo = cbjInfo;
    }
    if (compSpecs != null) {
      $result.compSpecs = compSpecs;
    }
    return $result;
  }
  CompAppInfo._() : super();
  factory CompAppInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompAppInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompAppInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'CBJAppConnections'), createEmptyInstance: create)
    ..aOM<CbjAppIno>(3, _omitFieldNames ? '' : 'cbjInfo', protoName: 'cbjInfo', subBuilder: CbjAppIno.create)
    ..aOM<CompAppSpecs>(4, _omitFieldNames ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CompAppSpecs.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompAppInfo clone() => CompAppInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompAppInfo copyWith(void Function(CompAppInfo) updates) => super.copyWith((message) => updates(message as CompAppInfo)) as CompAppInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompAppInfo create() => CompAppInfo._();
  CompAppInfo createEmptyInstance() => create();
  static $pb.PbList<CompAppInfo> createRepeated() => $pb.PbList<CompAppInfo>();
  @$core.pragma('dart2js:noInline')
  static CompAppInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompAppInfo>(create);
  static CompAppInfo? _defaultInstance;

  @$pb.TagNumber(3)
  CbjAppIno get cbjInfo => $_getN(0);
  @$pb.TagNumber(3)
  set cbjInfo(CbjAppIno v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCbjInfo() => $_has(0);
  @$pb.TagNumber(3)
  void clearCbjInfo() => clearField(3);
  @$pb.TagNumber(3)
  CbjAppIno ensureCbjInfo() => $_ensure(0);

  @$pb.TagNumber(4)
  CompAppSpecs get compSpecs => $_getN(1);
  @$pb.TagNumber(4)
  set compSpecs(CompAppSpecs v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompSpecs() => $_has(1);
  @$pb.TagNumber(4)
  void clearCompSpecs() => clearField(4);
  @$pb.TagNumber(4)
  CompAppSpecs ensureCompSpecs() => $_ensure(1);
}

class CbjAppIno extends $pb.GeneratedMessage {
  factory CbjAppIno({
    $core.String? deviceName,
    $core.String? pubspecYamlVersion,
    $core.String? protoLastGenDate,
    $core.String? pubspecYamlBuildNumber,
    $core.String? dartSdkVersion,
  }) {
    final $result = create();
    if (deviceName != null) {
      $result.deviceName = deviceName;
    }
    if (pubspecYamlVersion != null) {
      $result.pubspecYamlVersion = pubspecYamlVersion;
    }
    if (protoLastGenDate != null) {
      $result.protoLastGenDate = protoLastGenDate;
    }
    if (pubspecYamlBuildNumber != null) {
      $result.pubspecYamlBuildNumber = pubspecYamlBuildNumber;
    }
    if (dartSdkVersion != null) {
      $result.dartSdkVersion = dartSdkVersion;
    }
    return $result;
  }
  CbjAppIno._() : super();
  factory CbjAppIno.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjAppIno.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CbjAppIno', package: const $pb.PackageName(_omitMessageNames ? '' : 'CBJAppConnections'), createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(6, _omitFieldNames ? '' : 'pubspecYamlVersion', protoName: 'pubspecYamlVersion')
    ..aOS(7, _omitFieldNames ? '' : 'protoLastGenDate', protoName: 'protoLastGenDate')
    ..aOS(14, _omitFieldNames ? '' : 'pubspecYamlBuildNumber', protoName: 'pubspecYamlBuildNumber')
    ..aOS(15, _omitFieldNames ? '' : 'dartSdkVersion', protoName: 'dartSdkVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjAppIno clone() => CbjAppIno()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjAppIno copyWith(void Function(CbjAppIno) updates) => super.copyWith((message) => updates(message as CbjAppIno)) as CbjAppIno;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CbjAppIno create() => CbjAppIno._();
  CbjAppIno createEmptyInstance() => create();
  static $pb.PbList<CbjAppIno> createRepeated() => $pb.PbList<CbjAppIno>();
  @$core.pragma('dart2js:noInline')
  static CbjAppIno getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjAppIno>(create);
  static CbjAppIno? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get deviceName => $_getSZ(0);
  @$pb.TagNumber(5)
  set deviceName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceName() => $_has(0);
  @$pb.TagNumber(5)
  void clearDeviceName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pubspecYamlVersion => $_getSZ(1);
  @$pb.TagNumber(6)
  set pubspecYamlVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(6)
  $core.bool hasPubspecYamlVersion() => $_has(1);
  @$pb.TagNumber(6)
  void clearPubspecYamlVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get protoLastGenDate => $_getSZ(2);
  @$pb.TagNumber(7)
  set protoLastGenDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(7)
  $core.bool hasProtoLastGenDate() => $_has(2);
  @$pb.TagNumber(7)
  void clearProtoLastGenDate() => clearField(7);

  @$pb.TagNumber(14)
  $core.String get pubspecYamlBuildNumber => $_getSZ(3);
  @$pb.TagNumber(14)
  set pubspecYamlBuildNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(14)
  $core.bool hasPubspecYamlBuildNumber() => $_has(3);
  @$pb.TagNumber(14)
  void clearPubspecYamlBuildNumber() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get dartSdkVersion => $_getSZ(4);
  @$pb.TagNumber(15)
  set dartSdkVersion($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(15)
  $core.bool hasDartSdkVersion() => $_has(4);
  @$pb.TagNumber(15)
  void clearDartSdkVersion() => clearField(15);
}

class CompAppSpecs extends $pb.GeneratedMessage {
  factory CompAppSpecs({
    $core.String? compId,
    $core.String? compUuid,
    $core.String? compOs,
    $core.String? compModel,
    $core.String? compType,
    $core.String? compIp,
  }) {
    final $result = create();
    if (compId != null) {
      $result.compId = compId;
    }
    if (compUuid != null) {
      $result.compUuid = compUuid;
    }
    if (compOs != null) {
      $result.compOs = compOs;
    }
    if (compModel != null) {
      $result.compModel = compModel;
    }
    if (compType != null) {
      $result.compType = compType;
    }
    if (compIp != null) {
      $result.compIp = compIp;
    }
    return $result;
  }
  CompAppSpecs._() : super();
  factory CompAppSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompAppSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompAppSpecs', package: const $pb.PackageName(_omitMessageNames ? '' : 'CBJAppConnections'), createEmptyInstance: create)
    ..aOS(8, _omitFieldNames ? '' : 'compId', protoName: 'compId')
    ..aOS(9, _omitFieldNames ? '' : 'compUuid', protoName: 'compUuid')
    ..aOS(10, _omitFieldNames ? '' : 'compOs', protoName: 'compOs')
    ..aOS(11, _omitFieldNames ? '' : 'compModel', protoName: 'compModel')
    ..aOS(12, _omitFieldNames ? '' : 'compType', protoName: 'compType')
    ..aOS(13, _omitFieldNames ? '' : 'compIp', protoName: 'compIp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompAppSpecs clone() => CompAppSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompAppSpecs copyWith(void Function(CompAppSpecs) updates) => super.copyWith((message) => updates(message as CompAppSpecs)) as CompAppSpecs;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompAppSpecs create() => CompAppSpecs._();
  CompAppSpecs createEmptyInstance() => create();
  static $pb.PbList<CompAppSpecs> createRepeated() => $pb.PbList<CompAppSpecs>();
  @$core.pragma('dart2js:noInline')
  static CompAppSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompAppSpecs>(create);
  static CompAppSpecs? _defaultInstance;

  @$pb.TagNumber(8)
  $core.String get compId => $_getSZ(0);
  @$pb.TagNumber(8)
  set compId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(8)
  $core.bool hasCompId() => $_has(0);
  @$pb.TagNumber(8)
  void clearCompId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get compUuid => $_getSZ(1);
  @$pb.TagNumber(9)
  set compUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(9)
  $core.bool hasCompUuid() => $_has(1);
  @$pb.TagNumber(9)
  void clearCompUuid() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get compOs => $_getSZ(2);
  @$pb.TagNumber(10)
  set compOs($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(10)
  $core.bool hasCompOs() => $_has(2);
  @$pb.TagNumber(10)
  void clearCompOs() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get compModel => $_getSZ(3);
  @$pb.TagNumber(11)
  set compModel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(11)
  $core.bool hasCompModel() => $_has(3);
  @$pb.TagNumber(11)
  void clearCompModel() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get compType => $_getSZ(4);
  @$pb.TagNumber(12)
  set compType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(12)
  $core.bool hasCompType() => $_has(4);
  @$pb.TagNumber(12)
  void clearCompType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get compIp => $_getSZ(5);
  @$pb.TagNumber(13)
  set compIp($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(13)
  $core.bool hasCompIp() => $_has(5);
  @$pb.TagNumber(13)
  void clearCompIp() => clearField(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
