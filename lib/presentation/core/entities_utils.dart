// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EntitiesUtils {
  static IconData iconOfDeviceType(EntityTypes deviceType) {
    switch (deviceType) {
      case EntityTypes.blinds:
        return FontAwesomeIcons.alignJustify;
      case EntityTypes.boiler:
        return FontAwesomeIcons.temperatureThreeQuarters;
      case EntityTypes.light:
      case EntityTypes.dimmableLight:
      case EntityTypes.rgbwLights:
        return FontAwesomeIcons.lightbulb;
      case EntityTypes.printer:
        return Icons.print;
      case EntityTypes.securityCamera:
        return Icons.camera;
      case EntityTypes.smartComputer:
        return Icons.computer;
      case EntityTypes.smartPlug:
        return MdiIcons.powerSocketAu;
      case EntityTypes.smartTV:
        return Icons.tv;
      case EntityTypes.switch_:
        return MdiIcons.lightSwitch;
      case EntityTypes.ac:
        return MdiIcons.airConditioner;
      case EntityTypes.emptyEntity:
      case EntityTypes.pingEntity:
      case EntityTypes.undefined:
        return Icons.question_mark;
    }
  }
}
