//
//  Generated code. Do not modify.
//  source: security_bear_connections.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SecurityBearSetup extends $pb.GeneratedMessage {
  factory SecurityBearSetup({
    WiFiInformation? wiFiFirstPriority,
    WiFiInformation? wiFiSecondPriority,
  }) {
    final $result = create();
    if (wiFiFirstPriority != null) {
      $result.wiFiFirstPriority = wiFiFirstPriority;
    }
    if (wiFiSecondPriority != null) {
      $result.wiFiSecondPriority = wiFiSecondPriority;
    }
    return $result;
  }
  SecurityBearSetup._() : super();
  factory SecurityBearSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecurityBearSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SecurityBearSetup', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOM<WiFiInformation>(3, _omitFieldNames ? '' : 'wiFiFirstPriority', protoName: 'wiFiFirstPriority', subBuilder: WiFiInformation.create)
    ..aOM<WiFiInformation>(4, _omitFieldNames ? '' : 'wiFiSecondPriority', protoName: 'wiFiSecondPriority', subBuilder: WiFiInformation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecurityBearSetup clone() => SecurityBearSetup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecurityBearSetup copyWith(void Function(SecurityBearSetup) updates) => super.copyWith((message) => updates(message as SecurityBearSetup)) as SecurityBearSetup;

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
  factory WiFiInformation({
    $core.String? wiFiName,
    $core.String? wiFiPassword,
  }) {
    final $result = create();
    if (wiFiName != null) {
      $result.wiFiName = wiFiName;
    }
    if (wiFiPassword != null) {
      $result.wiFiPassword = wiFiPassword;
    }
    return $result;
  }
  WiFiInformation._() : super();
  factory WiFiInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WiFiInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WiFiInformation', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'wiFiName', protoName: 'wiFiName')
    ..aOS(2, _omitFieldNames ? '' : 'wiFiPassword', protoName: 'wiFiPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WiFiInformation clone() => WiFiInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WiFiInformation copyWith(void Function(WiFiInformation) updates) => super.copyWith((message) => updates(message as WiFiInformation)) as WiFiInformation;

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

/// Did the commend succeeded (true) or not (false)
class SBCommendStatus extends $pb.GeneratedMessage {
  factory SBCommendStatus({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  SBCommendStatus._() : super();
  factory SBCommendStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SBCommendStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SBCommendStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOB(5, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SBCommendStatus clone() => SBCommendStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SBCommendStatus copyWith(void Function(SBCommendStatus) updates) => super.copyWith((message) => updates(message as SBCommendStatus)) as SBCommendStatus;

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
  factory SBFirebaseAccountAndSecurityBearSetup({
    SBFirebaseAccountInformation? sBFirebaseAccountInformation,
    SecurityBearSetup? securityBearSetup,
  }) {
    final $result = create();
    if (sBFirebaseAccountInformation != null) {
      $result.sBFirebaseAccountInformation = sBFirebaseAccountInformation;
    }
    if (securityBearSetup != null) {
      $result.securityBearSetup = securityBearSetup;
    }
    return $result;
  }
  SBFirebaseAccountAndSecurityBearSetup._() : super();
  factory SBFirebaseAccountAndSecurityBearSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SBFirebaseAccountAndSecurityBearSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SBFirebaseAccountAndSecurityBearSetup', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOM<SBFirebaseAccountInformation>(10, _omitFieldNames ? '' : 'sBFirebaseAccountInformation', protoName: 'sBFirebaseAccountInformation', subBuilder: SBFirebaseAccountInformation.create)
    ..aOM<SecurityBearSetup>(11, _omitFieldNames ? '' : 'securityBearSetup', protoName: 'securityBearSetup', subBuilder: SecurityBearSetup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountAndSecurityBearSetup clone() => SBFirebaseAccountAndSecurityBearSetup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountAndSecurityBearSetup copyWith(void Function(SBFirebaseAccountAndSecurityBearSetup) updates) => super.copyWith((message) => updates(message as SBFirebaseAccountAndSecurityBearSetup)) as SBFirebaseAccountAndSecurityBearSetup;

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
  factory SBFirebaseAccountInformation({
    $core.String? fireBaseProjectId,
    $core.String? fireBaseApiKey,
    $core.String? userEmail,
    $core.String? userPassword,
  }) {
    final $result = create();
    if (fireBaseProjectId != null) {
      $result.fireBaseProjectId = fireBaseProjectId;
    }
    if (fireBaseApiKey != null) {
      $result.fireBaseApiKey = fireBaseApiKey;
    }
    if (userEmail != null) {
      $result.userEmail = userEmail;
    }
    if (userPassword != null) {
      $result.userPassword = userPassword;
    }
    return $result;
  }
  SBFirebaseAccountInformation._() : super();
  factory SBFirebaseAccountInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SBFirebaseAccountInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SBFirebaseAccountInformation', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(6, _omitFieldNames ? '' : 'fireBaseProjectId', protoName: 'fireBaseProjectId')
    ..aOS(7, _omitFieldNames ? '' : 'fireBaseApiKey', protoName: 'fireBaseApiKey')
    ..aOS(8, _omitFieldNames ? '' : 'userEmail', protoName: 'userEmail')
    ..aOS(9, _omitFieldNames ? '' : 'userPassword', protoName: 'userPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountInformation clone() => SBFirebaseAccountInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SBFirebaseAccountInformation copyWith(void Function(SBFirebaseAccountInformation) updates) => super.copyWith((message) => updates(message as SBFirebaseAccountInformation)) as SBFirebaseAccountInformation;

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
  factory CompSecurityBearInfo({
    CbjSecurityBearIno? cbjInfo,
    CompSecurityBearSpecs? compSpecs,
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
  CompSecurityBearInfo._() : super();
  factory CompSecurityBearInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompSecurityBearInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompSecurityBearInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOM<CbjSecurityBearIno>(12, _omitFieldNames ? '' : 'cbjInfo', protoName: 'cbjInfo', subBuilder: CbjSecurityBearIno.create)
    ..aOM<CompSecurityBearSpecs>(13, _omitFieldNames ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CompSecurityBearSpecs.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompSecurityBearInfo clone() => CompSecurityBearInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompSecurityBearInfo copyWith(void Function(CompSecurityBearInfo) updates) => super.copyWith((message) => updates(message as CompSecurityBearInfo)) as CompSecurityBearInfo;

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
  factory CbjSecurityBearIno({
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
  CbjSecurityBearIno._() : super();
  factory CbjSecurityBearIno.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjSecurityBearIno.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CbjSecurityBearIno', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(14, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(15, _omitFieldNames ? '' : 'pubspecYamlVersion', protoName: 'pubspecYamlVersion')
    ..aOS(16, _omitFieldNames ? '' : 'protoLastGenDate', protoName: 'protoLastGenDate')
    ..aOS(23, _omitFieldNames ? '' : 'pubspecYamlBuildNumber', protoName: 'pubspecYamlBuildNumber')
    ..aOS(24, _omitFieldNames ? '' : 'dartSdkVersion', protoName: 'dartSdkVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjSecurityBearIno clone() => CbjSecurityBearIno()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjSecurityBearIno copyWith(void Function(CbjSecurityBearIno) updates) => super.copyWith((message) => updates(message as CbjSecurityBearIno)) as CbjSecurityBearIno;

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
  factory CompSecurityBearSpecs({
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
  CompSecurityBearSpecs._() : super();
  factory CompSecurityBearSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompSecurityBearSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompSecurityBearSpecs', package: const $pb.PackageName(_omitMessageNames ? '' : 'SecurityBearConnections'), createEmptyInstance: create)
    ..aOS(17, _omitFieldNames ? '' : 'compId', protoName: 'compId')
    ..aOS(18, _omitFieldNames ? '' : 'compUuid', protoName: 'compUuid')
    ..aOS(19, _omitFieldNames ? '' : 'compOs', protoName: 'compOs')
    ..aOS(20, _omitFieldNames ? '' : 'compModel', protoName: 'compModel')
    ..aOS(21, _omitFieldNames ? '' : 'compType', protoName: 'compType')
    ..aOS(22, _omitFieldNames ? '' : 'compIp', protoName: 'compIp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompSecurityBearSpecs clone() => CompSecurityBearSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompSecurityBearSpecs copyWith(void Function(CompSecurityBearSpecs) updates) => super.copyWith((message) => updates(message as CompSecurityBearSpecs)) as CompSecurityBearSpecs;

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
