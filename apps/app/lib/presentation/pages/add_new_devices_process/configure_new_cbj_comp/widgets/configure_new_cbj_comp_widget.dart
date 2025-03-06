import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:kt_dart/collection.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_failures.dart';
import 'package:simple_hub/domain/cbj_comp/cbj_comp_value_objects.dart';
import 'package:simple_hub/domain/cbj_comp/i_cbj_comp_repository.dart';
import 'package:simple_hub/domain/manage_network/i_manage_network_repository.dart';
import 'package:simple_hub/domain/manage_network/manage_network_entity.dart';
import 'package:simple_hub/domain/security_bear/i_security_bear_connection_repository.dart';
import 'package:simple_hub/domain/security_bear/security_bear_failures.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:wifi_iot/wifi_iot.dart';

class ConfigureNewCbjCompWidgets extends StatefulWidget {
  const ConfigureNewCbjCompWidgets({
    required this.cbjCompEntity,
  });

  final CbjCompEntity cbjCompEntity;

  static String deviceNameFieldKey = 'deviceNameField';
  static String devicesDefaultAreaNameField = '';

  @override
  State<ConfigureNewCbjCompWidgets> createState() =>
      _ConfigureNewCbjCompWidgetsState();
}

class _ConfigureNewCbjCompWidgetsState
    extends State<ConfigureNewCbjCompWidgets> {
  ConfigureNewCbjCompState state = ConfigureNewCbjCompState.actionInProgress;

  /// Progress counter for setting new devices
  double progressPercentage = 0.0;

  @override
  void initState() {
    super.initState();

    _sendHotSpotInformation(widget.cbjCompEntity);
  }

  Future _sendHotSpotInformation(CbjCompEntity cBJCompEntity) async {
    progressPercentage += 0.3;
    setState(() {
      state = ConfigureNewCbjCompState.actionInProgress;
    });

    final CbjCompEntity compUpdatedData = cBJCompEntity;
    final dartz.Either<SecurityBearFailures, dartz.Unit> setSecurityBearWiFi =
        await ISecurityBearConnectionRepository.instance
            .setSecurityBearWiFiInformation(compUpdatedData);

    setSecurityBearWiFi.fold(
      (l) {
        setState(() {
          state = ConfigureNewCbjCompState.errorInProcess;
        });
        return;
      },
      (r) {
        progressPercentage += 0.5;
        WiFiForIoTPlugin.disconnect();

        setState(() {
          state = ConfigureNewCbjCompState.actionInProgress;
        });
      },
    );
  }

  void routeToHub() {
    context.router.replace(
      ComputerConnectionCheckRoute(
        cbjCompEntity: widget.cbjCompEntity,
      ),
    );

    setState(() {
      state = ConfigureNewCbjCompState.completeSuccess;
    });
  }

  /// Organize all the data from the text fields to updated CBJCompEntity
  CbjCompEntity newCBJCompEntity(
    CbjCompEntity cbjCompEntity,
    Map<String, TextEditingController> textEditingController,
  ) {
    final String deviceNameFieldKey =
        ConfigureNewCbjCompWidgets.deviceNameFieldKey;
    final List<GenericLightDE> deviceEntityList = [];

    textEditingController['allInSameArea']!.text;

    final ManageNetworkEntity manageWiFiEntity =
        IManageNetworkRepository.manageWiFiEntity!;
    manageWiFiEntity.name!.getOrCrash();

    cbjCompEntity.cBJCompDevices!.getOrCrash().asList().forEach((deviceE) {
      try {
        final String deviceName = textEditingController[
                '$deviceNameFieldKey/${deviceE.uniqueId.getOrCrash()}']!
            .text;
        deviceEntityList.add(
          deviceE..cbjEntityName = CbjEntityName(value: deviceName),
        );
      } catch (e) {
        logger.w("Can't add unsupported device");
      }
    });
    final CbjCompEntity compUpdatedData = cbjCompEntity.copyWith(
      cBJCompDevices: CbjCompDevices(deviceEntityList.toImmutableList()),
    );

    return compUpdatedData;
  }

  Future<bool> initialNewDevice(CbjCompEntity compUpdatedData) async {
    bool error = false;

    final dartz.Either<CbjCompFailure, dartz.Unit> updateAllDevices =
        await ICbjCompRepository.instance.firstSetup(compUpdatedData);

    updateAllDevices.fold(
      (l) {
        error = true;
      },
      (r) {},
    );
    return error;
  }

  Widget devicesList(
    CbjCompEntity cbjCompEntityForDeviceList,
    Map<String, TextEditingController> textEditingController,
    BuildContext context,
  ) {
    final List<GenericLightDE> devicesList =
        cbjCompEntityForDeviceList.cBJCompDevices!.getOrCrash().asList();

    final List<Widget> widgetList = [];

    for (final GenericLightDE device in devicesList) {
      if (device.entityTypes.getOrCrash() != EntityTypes.undefined.toString()) {
        final TextEditingController textEditingControllerTemp =
            TextEditingController(
          text: device.cbjEntityName.value.getOrElse(() => ''),
        );
        textEditingController[
                '${ConfigureNewCbjCompWidgets.deviceNameFieldKey}/${device.uniqueId.value.getOrElse(() => 'deviceId')}'] =
            textEditingControllerTemp;
        widgetList.add(
          Container(
            color: Colors.yellow.withAlpha((0.8 * 255).toInt()),
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                if (device.entityTypes.getOrCrash() ==
                    EntityTypes.light.toString())
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        TextAtom('Type: ${device.entityTypes.getOrCrash()}'),
                        Expanded(
                          child: Center(
                            child: LightCardMolecule(device),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (device.entityTypes.getOrCrash() ==
                    EntityTypes.boiler.toString())
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        TextAtom('Type: ${device.entityTypes.getOrCrash()}'),
                        Expanded(
                          child: Center(
                            child: LightCardMolecule(device),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (device.entityTypes.getOrCrash() ==
                    EntityTypes.blinds.toString())
                  Column(
                    children: [
                      TextAtom('Type: ${device.entityTypes.getOrCrash()}'),
                      Center(
                        child: BlindsCardMolecule(device),
                      ),
                    ],
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 300,
                  child: TextFormField(
                    controller: textEditingControllerTemp,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withAlpha((0.2 * 255).toInt()),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyLarge!.color!,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidLightbulb,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      labelText: '${device.entityTypes.getOrCrash()} Name',
                      labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                    autocorrect: false,
                    onChanged: (value) {
                      // areaName = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        widgetList.add(
          Container(
            color: Colors.grey.withAlpha((0.3 * 255).toInt()),
            padding: const EdgeInsets.symmetric(vertical: 30),
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: TextAtom(
                      'Type ${device.entityTypes.getOrCrash()} is not supported yet',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    return Column(
      children: widgetList,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, TextEditingController> textEditingController = {};
    textEditingController['allInSameArea'] = TextEditingController();

    switch (state) {
      case ConfigureNewCbjCompState.actionInProgress:
        return Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: TextAtom(
                'Connecting computer to WiFi',
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 250,
                      child: LiquidLinearProgressIndicator(
                        value: progressPercentage,
                        valueColor: const AlwaysStoppedAnimation(Colors.pink),
                        backgroundColor:
                            Theme.of(context).textTheme.bodyLarge!.color,
                        borderColor: Colors.red.withAlpha((0.9 * 255).toInt()),
                        borderWidth: 4.0,
                        center: const TextAtom(
                          'Loading...',
                          style: TextStyle(color: Colors.black),
                        ),
                        borderRadius: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextAtom(
                      'Please wait as we are setting your new computer',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ],
                ),
              ),
              // child: Center(
              //   child: CircularProgressIndicatorAtom(
              //     backgroundColor: Colors.cyan,
              //     strokeWidth: 5,
              //   ),
              // ),
            ),
          ],
        );

      case ConfigureNewCbjCompState.errorInProcess:
        return TextAtom(
          'Error in the process.',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        );
      case ConfigureNewCbjCompState.completeSuccess:
        return TextAtom(
          'Computer have been configured.',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        );
    }
  }
}

enum ConfigureNewCbjCompState {
  actionInProgress,
  errorInProcess,
  completeSuccess,
  ;
}
