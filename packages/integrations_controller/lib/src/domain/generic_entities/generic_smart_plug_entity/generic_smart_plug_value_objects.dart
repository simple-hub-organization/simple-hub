import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_plug_entity/generic_smart_plug_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSmartPlugState extends ValueObjectCore<String> {
  factory GenericSmartPlugState(String? input) {
    assert(input != null);

    final EntityActions action =
        EntityUtils.stringToDeviceAction(input!) ?? EntityActions.undefined;

    return GenericSmartPlugState._(
      validateGenericSmartPlugStateNotEmpty(input),
      action,
    );
  }

  const GenericSmartPlugState._(this.value, this._action);

  final EntityActions _action;

  EntityActions get action => _action;

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of light state
  static List<String> lightValidActions() {
    return lightAllValidActions();
  }
}
