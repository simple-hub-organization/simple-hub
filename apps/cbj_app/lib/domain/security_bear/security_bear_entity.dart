import 'package:cybearjinni/domain/security_bear/security_bear_failures.dart';
import 'package:cybearjinni/domain/security_bear/security_bear_value_objects.dart';
import 'package:cybearjinni/infrastructure/security_bear_client/security_bear_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_bear_entity.freezed.dart';

@freezed
abstract class SecurityBearEntity implements _$SecurityBearEntity {
  const factory SecurityBearEntity({
    required SecurityBearNetworkBssid securityBearNetworkBssid,
    required SecurityBearNetworkName networkName,
    required SecurityBearNetworkIp lastKnownIp,
    SecurityBearMdnsName? mdnsName,
  }) = _SecurityBearEntity;

  const SecurityBearEntity._();

  factory SecurityBearEntity.empty() => SecurityBearEntity(
        securityBearNetworkBssid: SecurityBearNetworkBssid(''),
        networkName: SecurityBearNetworkName(''),
        lastKnownIp: SecurityBearNetworkIp(''),
      );

  SecurityBearDtos toInfrastructure() {
    return SecurityBearDtos(
      securityBearNetworkBssid: securityBearNetworkBssid.getOrCrash(),
      networkName: networkName.getOrCrash(),
      lastKnownIp: lastKnownIp.getOrCrash(),
    );
  }

  Option<SecurityBearFailures<dynamic>> get failureOption {
    return lastKnownIp.value.fold((f) => some(f), (_) => none());
  }
}
