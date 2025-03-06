import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_validators.dart';
import 'package:dartz/dartz.dart';

class GenericLightSwitchState extends ValueObjectCore<String> {
  factory GenericLightSwitchState(String? input) {
    assert(input != null);

    final EntityActions action =
        EntityUtils.stringToDeviceAction(input!) ?? EntityActions.undefined;
    return GenericLightSwitchState._(
      validateGenericLightStateNotEmpty(input),
      action,
    );
  }

  const GenericLightSwitchState._(this.value, this._action);

  final EntityActions _action;

  EntityActions get action => _action;

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> lightValidActions() {
    return lightAllValidActions();
  }
}
