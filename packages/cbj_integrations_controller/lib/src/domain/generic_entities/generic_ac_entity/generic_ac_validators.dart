import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';

/// Return all the valid actions for blinds
List<EntityActions> acAllValidActions() {
  return [
    EntityActions.off,
    EntityActions.on,
  ];
}
