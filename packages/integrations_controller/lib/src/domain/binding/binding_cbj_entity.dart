import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:integrations_controller/src/domain/binding/value_objects_routine_cbj.dart';
import 'package:integrations_controller/src/domain/core/value_objects.dart';
import 'package:integrations_controller/src/infrastructure/bindings/binding_cbj_dtos.dart';

part 'binding_cbj_entity.freezed.dart';

@freezed
class BindingCbjEntity with _$BindingCbjEntity {
  const factory BindingCbjEntity({
    /// The unique id of the binding, will alsow be used as the flow/tab id.
    required UniqueId uniqueId,

    /// Name of the automation, will be shown to the user.
    required BindingCbjName name,
    required BindingCbjBackgroundColor backgroundColor,

    /// All the automation as string.
    required BindingCbjAutomationString automationString,

    /// Node-Red flow id of the scene
    required BindingCbjNodeRedFlowId nodeRedFlowId,

    /// The actual id of the first node, most of the time will be the same as
    /// uniqueId variable.
    required BindingCbjFirstNodeId firstNodeId,

    /// The Unicode code point at which this icon is stored in the icon font.
    required BindingCbjIconCodePoint iconCodePoint,
    required BindingCbjBackgroundImage image,
    required BindingCbjLastDateOfExecute lastDateOfExecute,
    required BindingCbjStateMassage stateMassage,
    required BindingCbjSenderDeviceOs senderDeviceOs,
    required BindingCbjSenderDeviceModel senderDeviceModel,
    required BindingCbjSenderId senderId,
    required BindingCbjCompUuid compUuid,
    required BindingCbjDeviceStateGRPC entityStateGRPC,
  }) = _BindingCbjEntity;

  const BindingCbjEntity._();

  BindingCbjDtos toInfrastructure() {
    return BindingCbjDtos(
      uniqueId: uniqueId.getOrCrash(),
      name: name.getOrCrash(),
      backgroundColor: backgroundColor.getOrCrash(),
      automationString: automationString.getOrCrash(),
      nodeRedFlowId: nodeRedFlowId.getOrCrash(),
      firstNodeId: firstNodeId.getOrCrash(),
      iconCodePoint: iconCodePoint.getOrCrash(),
      image: image.getOrCrash(),
      lastDateOfExecute: lastDateOfExecute.getOrCrash(),
      entityStateGRPC: entityStateGRPC.getOrCrash(),
      senderDeviceModel: senderDeviceModel.getOrCrash(),
      senderDeviceOs: senderDeviceOs.getOrCrash(),
      senderId: senderId.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      stateMassage: stateMassage.getOrCrash(),
    );
  }
}
