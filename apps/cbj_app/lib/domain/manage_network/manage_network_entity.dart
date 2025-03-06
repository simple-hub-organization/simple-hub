import 'package:cybearjinni/domain/manage_network/manage_network_failures.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_network_entity.freezed.dart';

@freezed
abstract class ManageNetworkEntity implements _$ManageNetworkEntity {
  const factory ManageNetworkEntity({
    required ManageWiFiName? name,
    ManageWiFiPass? pass,
  }) = _ManageNetworkEntity;

  const ManageNetworkEntity._();

  factory ManageNetworkEntity.empty() => ManageNetworkEntity(
        name: ManageWiFiName(''),
      );

  Option<ManageNetworkFailures<dynamic>> get failureOption {
    return name!.value.fold((f) => some(f), (_) => none());
  }
}
