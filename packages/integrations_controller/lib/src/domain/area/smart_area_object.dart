import 'dart:core';

import 'package:integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_boiler_entity/generic_boiler_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_printer_entity/generic_printer_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_computer_entity/generic_smart_computer_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_plug_entity/generic_smart_plug_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_entity.dart';
import 'package:color/color.dart';

class SmartAreaObject {
  SmartAreaObject(
    this._areaName,
    this.grediantColor, {
    this.lightsInTheArea,
    this.rgbwLightsInTheArea,
    this.switchesInTheArea,
    this.blindsInTheArea,
    this.boilersInTheArea,
    this.smartPlugsInTheArea,
    this.smartComputersInTheArea,
    this.smartTvsInTheArea,
    this.printersInTheArea,
  });

  final String _areaName;
  final List<GenericLightDE>? lightsInTheArea;
  final List<GenericRgbwLightDE>? rgbwLightsInTheArea;
  final List<GenericSwitchDE>? switchesInTheArea;
  final List<GenericSmartPlugDE>? smartPlugsInTheArea;
  final List<GenericSmartComputerDE>? smartComputersInTheArea;
  final List<GenericSmartTvDE>? smartTvsInTheArea;
  final List<Color> grediantColor;
  final List<GenericBlindsDE>? blindsInTheArea;
  final List<GenericBoilerDE>? boilersInTheArea;
  final List<GenericPrinterDE>? printersInTheArea;

  String getAreaName() {
    return _areaName;
  }

  List<GenericLightDE>? getLights() {
    return lightsInTheArea;
  }

  List<GenericRgbwLightDE>? getRgbwLightsColor() {
    return rgbwLightsInTheArea;
  }

  List<GenericSwitchDE>? getSwitches() {
    return switchesInTheArea;
  }

  List<GenericSmartPlugDE>? getSmartPlugs() {
    return smartPlugsInTheArea;
  }

  List<GenericSmartComputerDE>? getSmartComputers() {
    return smartComputersInTheArea;
  }

  List<GenericSmartTvDE>? getSmartTvs() {
    return smartTvsInTheArea;
  }

  List<GenericBlindsDE>? getBlinds() {
    return blindsInTheArea;
  }

  List<GenericBoilerDE>? getBoilers() {
    return boilersInTheArea;
  }

  List<GenericPrinterDE>? getPrinters() {
    return printersInTheArea;
  }
}
