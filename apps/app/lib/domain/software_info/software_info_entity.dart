import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/software_info/software_info_failures.dart';
import 'package:simple_hub/domain/software_info/software_info_value_objects.dart';
import 'package:simple_hub/infrastructure/software_info/software_info_dtos.dart';

class SoftwareInfoEntity {
  SoftwareInfoEntity({
    required this.deviceName,
    required this.pubspecYamlVersion,
    required this.protoLastGenDate,
    required this.dartSdkVersion,
    required this.compId,
    required this.compUuid,
    required this.compOs,
    required this.compModel,
    required this.compType,
    required this.compIp,
  });

  factory SoftwareInfoEntity.empty() => SoftwareInfoEntity(
        deviceName: SoftwareInfoDeviceName(''),
        pubspecYamlVersion: SoftwareInfoPubspecYamlVersion(''),
        protoLastGenDate: SoftwareInfoProtoLastGenDate(''),
        dartSdkVersion: SoftwareInfoDartSdkVersion(''),
        compId: SoftwareInfoCompId(''),
        compUuid: SoftwareInfoCompUuid(''),
        compOs: SoftwareInfoCompOs(''),
        compModel: SoftwareInfoCompModel(''),
        compType: SoftwareInfoCompType(''),
        compIp: SoftwareInfoCompIp(''),
      );

  factory SoftwareInfoEntity.compAppInfo(CompAppInfo compAppInfo) {
    final CbjAppIno cbjAppIno = compAppInfo.cbjInfo;

    final CompAppSpecs compAppSpecs = compAppInfo.compSpecs;

    return SoftwareInfoEntity(
      deviceName: SoftwareInfoDeviceName(cbjAppIno.deviceName),
      pubspecYamlVersion:
          SoftwareInfoPubspecYamlVersion(cbjAppIno.pubspecYamlVersion),
      protoLastGenDate:
          SoftwareInfoProtoLastGenDate(cbjAppIno.protoLastGenDate),
      dartSdkVersion: SoftwareInfoDartSdkVersion(cbjAppIno.dartSdkVersion),
      compId: SoftwareInfoCompId(compAppSpecs.compId),
      compUuid: SoftwareInfoCompUuid(compAppSpecs.compUuid),
      compOs: SoftwareInfoCompOs(compAppSpecs.compOs),
      compModel: SoftwareInfoCompModel(compAppSpecs.compModel),
      compType: SoftwareInfoCompType(compAppSpecs.compType),
      compIp: SoftwareInfoCompIp(compAppSpecs.compIp),
    );
  }

  factory SoftwareInfoEntity.compHubInfo(CompHubInfo compHubInfo) {
    final CbjHubIno cbjHubIno = compHubInfo.cbjInfo;

    final CompHubSpecs compAppSpecs = compHubInfo.compSpecs;

    return SoftwareInfoEntity(
      deviceName: SoftwareInfoDeviceName(cbjHubIno.entityName),
      pubspecYamlVersion:
          SoftwareInfoPubspecYamlVersion(cbjHubIno.pubspecYamlVersion),
      protoLastGenDate:
          SoftwareInfoProtoLastGenDate(cbjHubIno.protoLastGenDate),
      dartSdkVersion: SoftwareInfoDartSdkVersion(cbjHubIno.dartSdkVersion),
      compId: SoftwareInfoCompId(compAppSpecs.compId),
      compUuid: SoftwareInfoCompUuid(compAppSpecs.compUuid),
      compOs: SoftwareInfoCompOs(compAppSpecs.compOs),
      compModel: SoftwareInfoCompModel(compAppSpecs.compModel),
      compType: SoftwareInfoCompType(compAppSpecs.compType),
      compIp: SoftwareInfoCompIp(compAppSpecs.compIp),
    );
  }

  factory SoftwareInfoEntity.compSecurityBearInfo(
    CompSecurityBearInfo compSecurityBearInfo,
  ) {
    final CbjSecurityBearIno securityBearIno = compSecurityBearInfo.cbjInfo;

    final CompSecurityBearSpecs compAppSpecs = compSecurityBearInfo.compSpecs;

    return SoftwareInfoEntity(
      deviceName: SoftwareInfoDeviceName(securityBearIno.deviceName),
      pubspecYamlVersion:
          SoftwareInfoPubspecYamlVersion(securityBearIno.pubspecYamlVersion),
      protoLastGenDate:
          SoftwareInfoProtoLastGenDate(securityBearIno.protoLastGenDate),
      dartSdkVersion:
          SoftwareInfoDartSdkVersion(securityBearIno.dartSdkVersion),
      compId: SoftwareInfoCompId(compAppSpecs.compId),
      compUuid: SoftwareInfoCompUuid(compAppSpecs.compUuid),
      compOs: SoftwareInfoCompOs(compAppSpecs.compOs),
      compModel: SoftwareInfoCompModel(compAppSpecs.compModel),
      compType: SoftwareInfoCompType(compAppSpecs.compType),
      compIp: SoftwareInfoCompIp(compAppSpecs.compIp),
    );
  }

  SoftwareInfoDeviceName deviceName;
  SoftwareInfoPubspecYamlVersion pubspecYamlVersion;
  SoftwareInfoProtoLastGenDate protoLastGenDate;
  SoftwareInfoDartSdkVersion dartSdkVersion;
  SoftwareInfoCompId compId;
  SoftwareInfoCompUuid compUuid;
  SoftwareInfoCompOs compOs;
  SoftwareInfoCompModel compModel;
  SoftwareInfoCompType compType;
  SoftwareInfoCompIp compIp;

  Option<SoftwareInfoFailures<dynamic>> get failureOption {
    return deviceName.value.fold((f) => some(f), (_) => none());
  }

  SoftwareInfoDtos toInfrastructure() {
    return SoftwareInfoDtos(
      deviceName: deviceName.getOrCrash(),
      pubspecYamlVersion: pubspecYamlVersion.getOrCrash(),
      protoLastGenDate: protoLastGenDate.getOrCrash(),
      dartSdkVersion: dartSdkVersion.getOrCrash(),
      compId: compId.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      compOs: compOs.getOrCrash(),
      compModel: compModel.getOrCrash(),
      compType: compType.getOrCrash(),
      compIp: compIp.getOrCrash(),
    );
  }
}
