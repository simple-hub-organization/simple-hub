import 'package:dartz/dartz.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:simple_hub/domain/home_user/home_user_failures.dart';
import 'package:simple_hub/domain/manage_network/i_manage_network_repository.dart';
import 'package:simple_hub/domain/manage_network/manage_network_entity.dart';

class TestIManageNetworkRepository extends IManageNetworkRepository {
  TestIManageNetworkRepository() {
    IManageNetworkRepository.instance = this;
  }

  @override
  Future<Either<HomeUserFailures, Unit>> connectToWiFi(
          ManageNetworkEntity networkEntity) async =>
      right(unit);

  @override
  Future<Either<HomeUserFailures, Unit>> doesAccessPointOpen() async =>
      right(unit);

  @override
  Future<Either<HomeUserFailures, String?>> doesWiFiEnabled() async =>
      right('Home');

  @override
  Future<bool> loadWifi() async => true;

  @override
  Future<Either<HomeUserFailures, Unit>> openAccessPoint(
          ManageNetworkEntity networkEntity) async =>
      right(unit);

  @override
  Stream<Either<HomeUserFailures, KtList<ManageNetworkEntity>>>
      scanWiFiNetworks() {
    // TODO: implement scanWiFiNetworks
    throw UnimplementedError();
  }
}
