///
//  Generated code. Do not modify.
//  source: security_bear_connections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SecurityBearSetup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearSetup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOM<WiFiInformation>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wiFiFirstPriority', protoName: 'wiFiFirstPriority', subBuilder: WiFiInformation.create)
    ..aOM<WiFiInformation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wiFiSecondPriority', protoName: 'wiFiSecondPriority', subBuilder: WiFiInformation.create)
    ..hasRequiredFields = false
  ;

  SecurityBearSetup._() : super();
  factory SecurityBearSetup({
    WiFiInformation? wiFiFirstPriority,
    WiFiInformation? wiFiSecondPriority,
  }) {
    final _result = create();
    if (wiFiFirstPriority != null) {
      _result.wiFiFirstPriority = wiFiFirstPriority;
    }
    if (wiFiSecondPriority != null) {
      _result.wiFiSecondPriority = wiFiSecondPriority;
    }
    return _result;
  }
  factory SecurityBearSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecurityBearSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecurityBearSetup clone() => SecurityBearSetup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecurityBearSetup copyWith(void Function(SecurityBearSetup) updates) => super.copyWith((message) => updates(message as SecurityBearSetup)) as SecurityBearSetup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecurityBearSetup create() => SecurityBearSetup._();
  SecurityBearSetup createEmptyInstance() => create();
  static $pb.PbList<SecurityBearSetup> createRepeated() => $pb.PbList<SecurityBearSetup>();
  @$core.pragma('dart2js:noInline')
  static SecurityBearSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecurityBearSetup>(create);
  static SecurityBearSetup? _defaultInstance;

  @$pb.TagNumber(3)
  WiFiInformation get wiFiFirstPriority => $_getN(0);
  @$pb.TagNumber(3)
  set wiFiFirstPriority(WiFiInformation v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasWiFiFirstPriority() => $_has(0);
  @$pb.TagNumber(3)
  void clearWiFiFirstPriority() => clearField(3);
  @$pb.TagNumber(3)
  WiFiInformation ensureWiFiFirstPriority() => $_ensure(0);

  @$pb.TagNumber(4)
  WiFiInformation get wiFiSecondPriority => $_getN(1);
  @$pb.TagNumber(4)
  set wiFiSecondPriority(WiFiInformation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasWiFiSecondPriority() => $_has(1);
  @$pb.TagNumber(4)
  void clearWiFiSecondPriority() => clearField(4);
  @$pb.TagNumber(4)
  WiFiInformation ensureWiFiSecondPriority() => $_ensure(1);
}

class WiFiInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WiFiInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wiFiName', protoName: 'wiFiName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wiFiPassword', protoName: 'wiFiPassword')
    ..hasRequiredFields = false
  ;

  WiFiInformation._() : super();
  factory WiFiInformation({
    $core.String? wiFiName,
    $core.String? wiFiPassword,
  }) {
    final _result = create();
    if (wiFiName != null) {
      _result.wiFiName = wiFiName;
    }
    if (wiFiPassword != null) {
      _result.wiFiPassword = wiFiPassword;
    }
    return _result;
  }
  factory WiFiInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WiFiInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WiFiInformation clone() => WiFiInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WiFiInformation copyWith(void Function(WiFiInformation) updates) => super.copyWith((message) => updates(message as WiFiInformation)) as WiFiInformation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WiFiInformation create() => WiFiInformation._();
  WiFiInformation createEmptyInstance() => create();
  static $pb.PbList<WiFiInformation> createRepeated() => $pb.PbList<WiFiInformation>();
  @$core.pragma('dart2js:noInline')
  static WiFiInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WiFiInformation>(create);
  static WiFiInformation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get wiFiName => $_getSZ(0);
  @$pb.TagNumber(1)
  set wiFiName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWiFiName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWiFiName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get wiFiPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set wiFiPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWiFiPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearWiFiPassword() => clearField(2);
}

class SBCommendStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SBCommendStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  SBCommendStatus._() : super();
  factory SBCommendStatus({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory SBCommendStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SBCommendStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SBCommendStatus clone() => SBCommendStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SBCommendStatus copyWith(void Function(SBCommendStatus) updates) => super.copyWith((message) => updates(message as SBCommendStatus)) as SBCommendStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SBCommendStatus create() => SBCommendStatus._();
  SBCommendStatus createEmptyInstance() => create();
  static $pb.PbList<SBCommendStatus> createRepeated() => $pb.PbList<SBCommendStatus>();
  @$core.pragma('dart2js:noInline')
  static SBCommendStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SBCommendStatus>(create);
  static SBCommendStatus? _defaultInstance;

  @$pb.TagNumber(5)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(5)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(5)
  void clearSuccess() => clearField(5);
}

class SBFirebaseAccountAndSecurityBearSetup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SBFirebaseAccountAndSecurityBearSetup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOM<SBFirebaseAccountInformation>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sBFirebaseAccountInformation', protoName: 'sBFirebaseAccountInformation', subBuilder: SBFirebaseAccountInformation.create)
    ..aOM<SecurityBearSetup>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'securityBearSetup', protoName: 'securityBearSetup', subBuilder: SecurityBearSetup.create)
    ..hasRequiredFields = false
  ;

  SBFirebaseAccountAndSecurityBearSetup._() : super();
  factory SBFirebaseAccountAndSecurityBearSetup({
    SBFirebaseAccountInformation? sBFirebaseAccountInformation,
    SecurityBearSetup? securityBearSetup,
  }) {
    final _result = create();
    if (sBFirebaseAccountInformation != null) {
      _result.sBFirebaseAccountInformation = sBFirebaseAccountInformation;
    }
    if (securityBearSetup != null) {
      _result.securityBearSetup = securityBearSetup;
    }
    return _result;
  }
  factory SBFirebaseAccountAndSecurityBearSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SBFirebaseAccountAndSecurityBearSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountAndSecurityBearSetup clone() => SBFirebaseAccountAndSecurityBearSetup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountAndSecurityBearSetup copyWith(void Function(SBFirebaseAccountAndSecurityBearSetup) updates) => super.copyWith((message) => updates(message as SBFirebaseAccountAndSecurityBearSetup)) as SBFirebaseAccountAndSecurityBearSetup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SBFirebaseAccountAndSecurityBearSetup create() => SBFirebaseAccountAndSecurityBearSetup._();
  SBFirebaseAccountAndSecurityBearSetup createEmptyInstance() => create();
  static $pb.PbList<SBFirebaseAccountAndSecurityBearSetup> createRepeated() => $pb.PbList<SBFirebaseAccountAndSecurityBearSetup>();
  @$core.pragma('dart2js:noInline')
  static SBFirebaseAccountAndSecurityBearSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SBFirebaseAccountAndSecurityBearSetup>(create);
  static SBFirebaseAccountAndSecurityBearSetup? _defaultInstance;

  @$pb.TagNumber(10)
  SBFirebaseAccountInformation get sBFirebaseAccountInformation => $_getN(0);
  @$pb.TagNumber(10)
  set sBFirebaseAccountInformation(SBFirebaseAccountInformation v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasSBFirebaseAccountInformation() => $_has(0);
  @$pb.TagNumber(10)
  void clearSBFirebaseAccountInformation() => clearField(10);
  @$pb.TagNumber(10)
  SBFirebaseAccountInformation ensureSBFirebaseAccountInformation() => $_ensure(0);

  @$pb.TagNumber(11)
  SecurityBearSetup get securityBearSetup => $_getN(1);
  @$pb.TagNumber(11)
  set securityBearSetup(SecurityBearSetup v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasSecurityBearSetup() => $_has(1);
  @$pb.TagNumber(11)
  void clearSecurityBearSetup() => clearField(11);
  @$pb.TagNumber(11)
  SecurityBearSetup ensureSecurityBearSetup() => $_ensure(1);
}

class SBFirebaseAccountInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SBFirebaseAccountInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fireBaseProjectId', protoName: 'fireBaseProjectId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fireBaseApiKey', protoName: 'fireBaseApiKey')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userEmail', protoName: 'userEmail')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPassword', protoName: 'userPassword')
    ..hasRequiredFields = false
  ;

  SBFirebaseAccountInformation._() : super();
  factory SBFirebaseAccountInformation({
    $core.String? fireBaseProjectId,
    $core.String? fireBaseApiKey,
    $core.String? userEmail,
    $core.String? userPassword,
  }) {
    final _result = create();
    if (fireBaseProjectId != null) {
      _result.fireBaseProjectId = fireBaseProjectId;
    }
    if (fireBaseApiKey != null) {
      _result.fireBaseApiKey = fireBaseApiKey;
    }
    if (userEmail != null) {
      _result.userEmail = userEmail;
    }
    if (userPassword != null) {
      _result.userPassword = userPassword;
    }
    return _result;
  }
  factory SBFirebaseAccountInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SBFirebaseAccountInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountInformation clone() => SBFirebaseAccountInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountInformation copyWith(void Function(SBFirebaseAccountInformation) updates) => super.copyWith((message) => updates(message as SBFirebaseAccountInformation)) as SBFirebaseAccountInformation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SBFirebaseAccountInformation create() => SBFirebaseAccountInformation._();
  SBFirebaseAccountInformation createEmptyInstance() => create();
  static $pb.PbList<SBFirebaseAccountInformation> createRepeated() => $pb.PbList<SBFirebaseAccountInformation>();
  @$core.pragma('dart2js:noInline')
  static SBFirebaseAccountInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SBFirebaseAccountInformation>(create);
  static SBFirebaseAccountInformation? _defaultInstance;

  @$pb.TagNumber(6)
  $core.String get fireBaseProjectId => $_getSZ(0);
  @$pb.TagNumber(6)
  set fireBaseProjectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(6)
  $core.bool hasFireBaseProjectId() => $_has(0);
  @$pb.TagNumber(6)
  void clearFireBaseProjectId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fireBaseApiKey => $_getSZ(1);
  @$pb.TagNumber(7)
  set fireBaseApiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(7)
  $core.bool hasFireBaseApiKey() => $_has(1);
  @$pb.TagNumber(7)
  void clearFireBaseApiKey() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get userEmail => $_getSZ(2);
  @$pb.TagNumber(8)
  set userEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(8)
  $core.bool hasUserEmail() => $_has(2);
  @$pb.TagNumber(8)
  void clearUserEmail() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get userPassword => $_getSZ(3);
  @$pb.TagNumber(9)
  set userPassword($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(9)
  $core.bool hasUserPassword() => $_has(3);
  @$pb.TagNumber(9)
  void clearUserPassword() => clearField(9);
}

class CompSecurityBearInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompSecurityBearInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOM<CbjSecurityBearIno>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cbjInfo', protoName: 'cbjInfo', subBuilder: CbjSecurityBearIno.create)
    ..aOM<CompSecurityBearSpecs>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CompSecurityBearSpecs.create)
    ..hasRequiredFields = false
  ;

  CompSecurityBearInfo._() : super();
  factory CompSecurityBearInfo({
    CbjSecurityBearIno? cbjInfo,
    CompSecurityBearSpecs? compSpecs,
  }) {
    final _result = create();
    if (cbjInfo != null) {
      _result.cbjInfo = cbjInfo;
    }
    if (compSpecs != null) {
      _result.compSpecs = compSpecs;
    }
    return _result;
  }
  factory CompSecurityBearInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompSecurityBearInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompSecurityBearInfo clone() => CompSecurityBearInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompSecurityBearInfo copyWith(void Function(CompSecurityBearInfo) updates) => super.copyWith((message) => updates(message as CompSecurityBearInfo)) as CompSecurityBearInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompSecurityBearInfo create() => CompSecurityBearInfo._();
  CompSecurityBearInfo createEmptyInstance() => create();
  static $pb.PbList<CompSecurityBearInfo> createRepeated() => $pb.PbList<CompSecurityBearInfo>();
  @$core.pragma('dart2js:noInline')
  static CompSecurityBearInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompSecurityBearInfo>(create);
  static CompSecurityBearInfo? _defaultInstance;

  @$pb.TagNumber(12)
  CbjSecurityBearIno get cbjInfo => $_getN(0);
  @$pb.TagNumber(12)
  set cbjInfo(CbjSecurityBearIno v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCbjInfo() => $_has(0);
  @$pb.TagNumber(12)
  void clearCbjInfo() => clearField(12);
  @$pb.TagNumber(12)
  CbjSecurityBearIno ensureCbjInfo() => $_ensure(0);

  @$pb.TagNumber(13)
  CompSecurityBearSpecs get compSpecs => $_getN(1);
  @$pb.TagNumber(13)
  set compSpecs(CompSecurityBearSpecs v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasCompSpecs() => $_has(1);
  @$pb.TagNumber(13)
  void clearCompSpecs() => clearField(13);
  @$pb.TagNumber(13)
  CompSecurityBearSpecs ensureCompSpecs() => $_ensure(1);
}

class CbjSecurityBearIno extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSecurityBearIno', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubspecYamlVersion', protoName: 'pubspecYamlVersion')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protoLastGenDate', protoName: 'protoLastGenDate')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubspecYamlBuildNumber', protoName: 'pubspecYamlBuildNumber')
    ..aOS(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dartSdkVersion', protoName: 'dartSdkVersion')
    ..hasRequiredFields = false
  ;

  CbjSecurityBearIno._() : super();
  factory CbjSecurityBearIno({
    $core.String? deviceName,
    $core.String? pubspecYamlVersion,
    $core.String? protoLastGenDate,
    $core.String? pubspecYamlBuildNumber,
    $core.String? dartSdkVersion,
  }) {
    final _result = create();
    if (deviceName != null) {
      _result.deviceName = deviceName;
    }
    if (pubspecYamlVersion != null) {
      _result.pubspecYamlVersion = pubspecYamlVersion;
    }
    if (protoLastGenDate != null) {
      _result.protoLastGenDate = protoLastGenDate;
    }
    if (pubspecYamlBuildNumber != null) {
      _result.pubspecYamlBuildNumber = pubspecYamlBuildNumber;
    }
    if (dartSdkVersion != null) {
      _result.dartSdkVersion = dartSdkVersion;
    }
    return _result;
  }
  factory CbjSecurityBearIno.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjSecurityBearIno.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjSecurityBearIno clone() => CbjSecurityBearIno()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjSecurityBearIno copyWith(void Function(CbjSecurityBearIno) updates) => super.copyWith((message) => updates(message as CbjSecurityBearIno)) as CbjSecurityBearIno; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjSecurityBearIno create() => CbjSecurityBearIno._();
  CbjSecurityBearIno createEmptyInstance() => create();
  static $pb.PbList<CbjSecurityBearIno> createRepeated() => $pb.PbList<CbjSecurityBearIno>();
  @$core.pragma('dart2js:noInline')
  static CbjSecurityBearIno getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjSecurityBearIno>(create);
  static CbjSecurityBearIno? _defaultInstance;

  @$pb.TagNumber(14)
  $core.String get deviceName => $_getSZ(0);
  @$pb.TagNumber(14)
  set deviceName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(14)
  $core.bool hasDeviceName() => $_has(0);
  @$pb.TagNumber(14)
  void clearDeviceName() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get pubspecYamlVersion => $_getSZ(1);
  @$pb.TagNumber(15)
  set pubspecYamlVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(15)
  $core.bool hasPubspecYamlVersion() => $_has(1);
  @$pb.TagNumber(15)
  void clearPubspecYamlVersion() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get protoLastGenDate => $_getSZ(2);
  @$pb.TagNumber(16)
  set protoLastGenDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(16)
  $core.bool hasProtoLastGenDate() => $_has(2);
  @$pb.TagNumber(16)
  void clearProtoLastGenDate() => clearField(16);

  @$pb.TagNumber(23)
  $core.String get pubspecYamlBuildNumber => $_getSZ(3);
  @$pb.TagNumber(23)
  set pubspecYamlBuildNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(23)
  $core.bool hasPubspecYamlBuildNumber() => $_has(3);
  @$pb.TagNumber(23)
  void clearPubspecYamlBuildNumber() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get dartSdkVersion => $_getSZ(4);
  @$pb.TagNumber(24)
  set dartSdkVersion($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(24)
  $core.bool hasDartSdkVersion() => $_has(4);
  @$pb.TagNumber(24)
  void clearDartSdkVersion() => clearField(24);
}

class CompSecurityBearSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompSecurityBearSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compId', protoName: 'compId')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compUuid', protoName: 'compUuid')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compOs', protoName: 'compOs')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compModel', protoName: 'compModel')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compType', protoName: 'compType')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compIp', protoName: 'compIp')
    ..hasRequiredFields = false
  ;

  CompSecurityBearSpecs._() : super();
  factory CompSecurityBearSpecs({
    $core.String? compId,
    $core.String? compUuid,
    $core.String? compOs,
    $core.String? compModel,
    $core.String? compType,
    $core.String? compIp,
  }) {
    final _result = create();
    if (compId != null) {
      _result.compId = compId;
    }
    if (compUuid != null) {
      _result.compUuid = compUuid;
    }
    if (compOs != null) {
      _result.compOs = compOs;
    }
    if (compModel != null) {
      _result.compModel = compModel;
    }
    if (compType != null) {
      _result.compType = compType;
    }
    if (compIp != null) {
      _result.compIp = compIp;
    }
    return _result;
  }
  factory CompSecurityBearSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompSecurityBearSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompSecurityBearSpecs clone() => CompSecurityBearSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompSecurityBearSpecs copyWith(void Function(CompSecurityBearSpecs) updates) => super.copyWith((message) => updates(message as CompSecurityBearSpecs)) as CompSecurityBearSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompSecurityBearSpecs create() => CompSecurityBearSpecs._();
  CompSecurityBearSpecs createEmptyInstance() => create();
  static $pb.PbList<CompSecurityBearSpecs> createRepeated() => $pb.PbList<CompSecurityBearSpecs>();
  @$core.pragma('dart2js:noInline')
  static CompSecurityBearSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompSecurityBearSpecs>(create);
  static CompSecurityBearSpecs? _defaultInstance;

  @$pb.TagNumber(17)
  $core.String get compId => $_getSZ(0);
  @$pb.TagNumber(17)
  set compId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(17)
  $core.bool hasCompId() => $_has(0);
  @$pb.TagNumber(17)
  void clearCompId() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get compUuid => $_getSZ(1);
  @$pb.TagNumber(18)
  set compUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(18)
  $core.bool hasCompUuid() => $_has(1);
  @$pb.TagNumber(18)
  void clearCompUuid() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get compOs => $_getSZ(2);
  @$pb.TagNumber(19)
  set compOs($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(19)
  $core.bool hasCompOs() => $_has(2);
  @$pb.TagNumber(19)
  void clearCompOs() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get compModel => $_getSZ(3);
  @$pb.TagNumber(20)
  set compModel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(20)
  $core.bool hasCompModel() => $_has(3);
  @$pb.TagNumber(20)
  void clearCompModel() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get compType => $_getSZ(4);
  @$pb.TagNumber(21)
  set compType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(21)
  $core.bool hasCompType() => $_has(4);
  @$pb.TagNumber(21)
  void clearCompType() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get compIp => $_getSZ(5);
  @$pb.TagNumber(22)
  set compIp($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(22)
  $core.bool hasCompIp() => $_has(5);
  @$pb.TagNumber(22)
  void clearCompIp() => clearField(22);
}

