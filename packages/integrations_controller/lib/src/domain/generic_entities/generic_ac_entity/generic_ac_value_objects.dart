import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_ac_entity/generic_ac_validators.dart';
import 'package:dartz/dartz.dart';

class GenericAcSwitchState extends ValueObjectCore<String> {
  factory GenericAcSwitchState(EntityActions action) {
    return GenericAcSwitchState._(
      right(action.name),
      action,
    );
  }
  factory GenericAcSwitchState.fromString(String? actionString) {
    if (actionString == null) {
      return GenericAcSwitchState._(
        left(const CoreFailure.unexpected()),
        null,
      );
    }

    final EntityActions? action =
        EntityUtils.stringToDeviceAction(actionString);
    if (action == null) {
      return GenericAcSwitchState._(
        left(const CoreFailure.unexpected()),
        null,
      );
    }

    return GenericAcSwitchState._(
      right(action.name),
      action,
    );
  }

  const GenericAcSwitchState._(this.value, this._action);

  final EntityActions? _action;

  EntityActions? get action => _action;

  @override
  final Either<CoreFailure<String>, String> value;

  static List<EntityActions> acValidActions() {
    return acAllValidActions();
  }
}

class GenericAcMode extends ValueObjectCore<String> {
  factory GenericAcMode(String? input) {
    assert(input != null);

    return GenericAcMode._(
      right(input!),
    );
  }

  const GenericAcMode._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class GenericAcFanLevel extends ValueObjectCore<String> {
  factory GenericAcFanLevel(String? input) {
    assert(input != null);

    return GenericAcFanLevel._(
      right(input!),
    );
  }

  const GenericAcFanLevel._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class GenericAcLight extends ValueObjectCore<String> {
  factory GenericAcLight(String? input) {
    assert(input != null);

    return GenericAcLight._(
      right(input!),
    );
  }

  const GenericAcLight._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
