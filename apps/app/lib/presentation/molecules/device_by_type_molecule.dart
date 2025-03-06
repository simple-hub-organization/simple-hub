import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

class DeviceByTypeMolecule extends StatelessWidget {
  const DeviceByTypeMolecule(this.entity);

  final DeviceEntityBase entity;

  @override
  Widget build(BuildContext context) {
    final EntityTypes? type =
        EntityUtils.stringToDt(entity.entityTypes.getOrCrash());

    switch (type) {
      case EntityTypes.boiler:
        return BoilerMolecule(entity as GenericBoilerDE);
      case EntityTypes.blinds:
        return BlindMolecule(entity as GenericBlindsDE);
      case EntityTypes.printer:
        return PrinterMolecule(entity as GenericPrinterDE);
      case EntityTypes.smartComputer:
        return SmartComputerMolecule(entity as GenericSmartComputerDE);
      case EntityTypes.smartPlug:
        return SmartPlugsMolecule(entity as GenericSmartPlugDE);
      case EntityTypes.smartTV:
        return SmartTvMolecule(entity as GenericSmartTvDE);
      case EntityTypes.switch_:
        return SwitchMolecule(entity as GenericSwitchDE);
      case EntityTypes.light:
        return LightMolecule(entity as GenericLightDE);
      case EntityTypes.rgbwLights:
        return RgbwLightMolecule(entity as GenericRgbwLightDE);
      case EntityTypes.dimmableLight:
        return DimmableLightMolecule(entity as GenericDimmableLightDE);
      case EntityTypes.securityCamera:
        return SecurityCameraMolecule(entity as GenericSecurityCameraDE);
      case EntityTypes.ac:
        return AcMolecule(entity as GenericAcDE);
      case EntityTypes.undefined:
      case EntityTypes.emptyEntity:
      case EntityTypes.pingEntity:
      case null:
        return const SizedBox();
    }
  }
}
