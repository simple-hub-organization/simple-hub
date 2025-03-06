import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/infrastructure/colors.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/attract_mosquitoes_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/date_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/dining_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/movie_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/repel_mosquitoes_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/rest_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/romance_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/sleep_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/study_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/video_games_area_actions.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/work_area_actions.dart';

/// Pre define actions for each device in each area type
class AreaTypeWithEntitiesTypePreset {
  static List<RequestActionObject> getPreDefineActionForEntitiesInArea({
    required String entityId,
    required EntityTypes entityType,
    required AreaPurposesTypes areaPurposeType,
  }) {
    switch (areaPurposeType) {
      case AreaPurposesTypes.sleep:
        return SleepAreaActions().sleepAreaEntityActions(
          entityId,
          entityType,
        );
      case AreaPurposesTypes.movie:
        return MovieAreaActions().movieEntityActions(entityId, entityType);
      case AreaPurposesTypes.dining:
        return DiningAreaActions()
            .diningAreaEntityActions(entityId, entityType);
      case AreaPurposesTypes.dateNight:
        return DateAreaActions().dateEntityActions(entityId, entityType);
      case AreaPurposesTypes.romance:
        return RomanceAreaActions().romanceEntityActions(entityId, entityType);
      case AreaPurposesTypes.study:
        return StudyAreaActions().studyAreaEntityActions(entityId, entityType);
      case AreaPurposesTypes.watchTv:
        return MovieAreaActions().movieEntityActions(entityId, entityType);
      case AreaPurposesTypes.videoGames:
        return VideoGamesAreaActions()
            .videoGamesEntityActions(entityId, entityType);
      case AreaPurposesTypes.work:
        return WorkAreaActions().workAreaEntityActions(entityId, entityType);
      case AreaPurposesTypes.rest:
        return RestAreaActions().restEntityActions(entityId, entityType);
      case AreaPurposesTypes.attractMosquitoes:
        return AttractMosquitoesAreaActions()
            .attractMosquitoesEntityActions(entityId, entityType);
      case AreaPurposesTypes.repelMosquitoes:
        return RepelMosquitoesAreaActions()
            .repelMosquitoesEntityActions(entityId, entityType);
      case AreaPurposesTypes.undefined:
        break;
    }
    return [];
  }

  static String getColorForAreaType(AreaPurposesTypes areaPurposeType) {
    Colors color = Colors.orange;

    switch (areaPurposeType) {
      case AreaPurposesTypes.sleep:
        color = Colors.cyan;
      case AreaPurposesTypes.movie:
        color = Colors.pink;
      case AreaPurposesTypes.dining:
        color = Colors.amber;
      case AreaPurposesTypes.dateNight:
        color = Colors.purpleAccent;
      case AreaPurposesTypes.romance:
        color = Colors.pinkAccent;
      case AreaPurposesTypes.study:
        color = Colors.deepPurpleAccent;
      case AreaPurposesTypes.watchTv:
        color = Colors.deepPurple;
      case AreaPurposesTypes.videoGames:
        color = Colors.tealAccent;
      case AreaPurposesTypes.work:
        color = Colors.blue;
      case AreaPurposesTypes.rest:
        color = Colors.lightBlue;
      case AreaPurposesTypes.attractMosquitoes:
        color = Colors.blue;
      case AreaPurposesTypes.repelMosquitoes:
        color = Colors.red;
      case AreaPurposesTypes.undefined:
    }
    return color.value;
  }
}
