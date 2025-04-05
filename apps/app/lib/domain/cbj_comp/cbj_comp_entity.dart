import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:kt_dart/kt.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_failures.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_value_objects.dart';

part 'cbj_comp_entity.freezed.dart';

@freezed
abstract class CbjCompEntity implements _$CbjCompEntity {
  const factory CbjCompEntity({
    required CbjCompUniqueId id,
    required CbjCompAreaId areaId,
    required CbjCompLastKnownIp lastKnownIp,
    CbjCompDevices? cBJCompDevices,
    CbjCompDefaultName? name,
    CbjCompMacAddr? macAddr,
    CbjCompOs? compOs,
    CbjCompModel? compModel,
    CbjCompType? compType,

    /// The comp uuid that it came with out of the factory
    CbjCompUuid? compUuid,
  }) = _CbjCompEntity;

  const CbjCompEntity._();

  factory CbjCompEntity.empty() => CbjCompEntity(
        id: CbjCompUniqueId(),
        areaId: CbjCompAreaId(),
        lastKnownIp: CbjCompLastKnownIp(''),
        cBJCompDevices: CbjCompDevices(<GenericLightDE>[].toImmutableList()),
        name: CbjCompDefaultName(''),
        macAddr: CbjCompMacAddr(''),
        compOs: CbjCompOs(''),
        compModel: CbjCompModel(''),
        compType: CbjCompType(''),
        compUuid: CbjCompUuid(''),
      );

  Option<CbjCompFailure<dynamic>> get failureOption {
    return areaId.value.fold((f) => some(f), (_) => none());
  }
}
