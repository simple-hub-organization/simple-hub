part of 'package:cybearjinni/domain/software_info/i_software_info_repository.dart';

class _SoftwareInfoRepository implements ISoftwareInfoRepository {
  @override
  Future<Either<SoftwareInfoFailures, SoftwareInfoEntity>>
      getAppSoftwareInfo() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final NetworkInfo networkInfo = NetworkInfo();

      final CbjAppIno cbjAppIno = CbjAppIno(
        deviceName: 'cbj App',
        pubspecYamlVersion: packageInfo.version,
        pubspecYamlBuildNumber: packageInfo.buildNumber,
        protoLastGenDate: appServerProtocGenDate,
        dartSdkVersion: Platform.version,
      );

      final CompAppSpecs compAppSpecs = CompAppSpecs(
        compOs: Platform.operatingSystem,
        compIp: await networkInfo.getWifiIP(),
      );

      final CompAppInfo compAppInfo = CompAppInfo(
        cbjInfo: cbjAppIno,
        compSpecs: compAppSpecs,
      );

      final SoftwareInfoEntity softwareInfoEntity =
          SoftwareInfoEntity.compAppInfo(compAppInfo);

      return right(softwareInfoEntity);
    } catch (e) {
      return left(const SoftwareInfoFailures.unexpected());
    }
  }

  @override
  Future<Either<SoftwareInfoFailures, SoftwareInfoEntity>>
      getHubSoftwareInfo() async {
    try {
      CompHubInfo? appInfoForHub =
          (await getAppInfoForHub()).fold((l) => null, (r) => r);

      appInfoForHub ??= CompHubInfo();

      // final Either<HubFailures, CompHubInfo> hubResponse =
      //     await IHubConnectionRepository.instance.getHubCompInfo(appInfoForHub);

      // return hubResponse.fold(
      //   (l) => left(const SoftwareInfoFailures.unexpected()),
      //   (r) {
      //     return right(SoftwareInfoEntity.compHubInfo(r));
      //   },
      // );
    } catch (e) {
      logger.e('Software info from hub error\n$e');
    }
    return left(const SoftwareInfoFailures.unexpected());
  }

  @override
  Future<Either<SoftwareInfoFailures, SoftwareInfoEntity>>
      getSecurityBearSoftwareInfo() async {
    try {
      CompSecurityBearInfo? appInfoForSecurityBear =
          (await getAppInfoForSecurityBear()).fold((l) => null, (r) => r);

      appInfoForSecurityBear ??= CompSecurityBearInfo();

      final Either<SecurityBearFailures, CompSecurityBearInfo>
          securityBearResponse = await ISecurityBearConnectionRepository
              .instance
              .getSecurityBearCompInfo(appInfoForSecurityBear);

      return securityBearResponse.fold(
        (l) => left(const SoftwareInfoFailures.unexpected()),
        (r) {
          return right(SoftwareInfoEntity.compSecurityBearInfo(r));
        },
      );
    } catch (e) {
      logger.e('Software info from Security Bear error\n$e');
      return left(const SoftwareInfoFailures.unexpected());
    }
  }

  Future<Either<SoftwareInfoFailures, CompHubInfo>> getAppInfoForHub() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final NetworkInfo networkInfo = NetworkInfo();

      final CbjHubIno cbjHubIno = CbjHubIno(
        entityName: 'cbj App',
        pubspecYamlVersion: packageInfo.version,
        protoLastGenDate: hubServerProtocGenDate,
        dartSdkVersion: Platform.version,
      );

      final CompHubSpecs compHubSpecs = CompHubSpecs(
        compOs: Platform.operatingSystem,
        compIp: await networkInfo.getWifiIP(),
      );

      final CompHubInfo compAppInfo = CompHubInfo(
        cbjInfo: cbjHubIno,
        compSpecs: compHubSpecs,
      );

      return right(compAppInfo);
    } catch (e) {
      return left(const SoftwareInfoFailures.unexpected());
    }
  }

  Future<Either<SoftwareInfoFailures, CompSecurityBearInfo>>
      getAppInfoForSecurityBear() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final NetworkInfo networkInfo = NetworkInfo();

      final CbjSecurityBearIno cbjSecurityBearIno = CbjSecurityBearIno(
        deviceName: 'cbj App',
        pubspecYamlVersion: packageInfo.version,
        protoLastGenDate: securityBearServerProtocGenDate,
        dartSdkVersion: Platform.version,
      );

      final CompSecurityBearSpecs compSecurityBearSpecs = CompSecurityBearSpecs(
        compOs: Platform.operatingSystem,
        compIp: await networkInfo.getWifiIP(),
      );

      final CompSecurityBearInfo compAppInfo = CompSecurityBearInfo(
        cbjInfo: cbjSecurityBearIno,
        compSpecs: compSecurityBearSpecs,
      );

      return right(compAppInfo);
    } catch (e) {
      return left(const SoftwareInfoFailures.unexpected());
    }
  }
}
