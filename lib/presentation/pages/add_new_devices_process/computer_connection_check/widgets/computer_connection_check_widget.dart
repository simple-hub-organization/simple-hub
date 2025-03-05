import 'package:another_flushbar/flushbar_helper.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_failures.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_value_objects.dart';
import 'package:cybearjinni/domain/cbj_comp/i_cbj_comp_repository.dart';
import 'package:cybearjinni/domain/manage_network/i_manage_network_repository.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_entity.dart';
import 'package:cybearjinni/domain/security_bear/i_security_bear_connection_repository.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/pages/add_new_devices_process/configure_new_cbj_comp/widgets/configure_new_cbj_comp_widget.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

class ComputerConnectionCheckWidget extends StatefulWidget {
  const ComputerConnectionCheckWidget({
    required this.cbjCompEntity,
  });

  final CbjCompEntity cbjCompEntity;

  static String deviceNameFieldKey = 'deviceNameField';
  static String devicesDefaultAreaNameField = '';

  @override
  State<ComputerConnectionCheckWidget> createState() =>
      _ComputerConnectionCheckWidgetState();
}

class _ComputerConnectionCheckWidgetState
    extends State<ComputerConnectionCheckWidget> {
  /// Progress counter for setting new devices
  double progressPercentage = 0.0;

  ComputerConnectionCheckState state = ComputerConnectionCheckState.initial;

  @override
  void initState() {
    super.initState();
    _checkConnectedToWiFiNetwork();
  }

  void _routeToHub() {
    FlushbarHelper.createLoading(
      message: 'Hub got connected Successfully to you Home WiFi',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);
  }

  Future _checkConnectedToWiFiNetwork() async {
    if ((await WiFiScan.instance.canStartScan()) == CanStartScan.yes) {
      await WiFiScan.instance.startScan();
      if ((await WiFiScan.instance.canGetScannedResults()) ==
          CanGetScannedResults.yes) {
        await WiFiScan.instance.getScannedResults();
      }
    }

    bool isConnectedToWifi = false;
    logger.i('Waiting for user to get connected to WiFi');

    while (true) {
      isConnectedToWifi = await WiFiForIoTPlugin.isConnected();
      if (isConnectedToWifi) {
        break;
      }
      await Future.delayed(const Duration(seconds: 10));
    }

    progressPercentage += 50;
    setState(() {
      state = ComputerConnectionCheckState.actionInProgress;
    });
    _searchIfHubOnTheSameWifiNetwork();
  }

  Future _searchIfHubOnTheSameWifiNetwork() async {
    int connectionTimeout = 0;

    while (true) {
      connectionTimeout++;
      (await ISecurityBearConnectionRepository.instance
              .searchForSecurityBearInCurrentNetwork())
          .fold((l) {}, (r) {
        _routeToHub();

        return;
      });
      if (connectionTimeout == 10) {
        break;
      }
      await Future.delayed(const Duration(seconds: 30));
    }
    setState(() {
      state = ComputerConnectionCheckState.errorInProcess;
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

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ComputerConnectionCheckState.initial:
        return const Expanded(
          child: Center(
            child: SizedBox(
              height: 80,
              width: 250,
              child: TextAtom(
                'Please reconnect back to you home WiFi',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );

      case ComputerConnectionCheckState.actionInProgress:
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
                      'Searching for CyBear Jinni Hub in your WiFi network',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      case ComputerConnectionCheckState.errorInProcess:
        return Expanded(
          child: Center(
            child: Column(
              children: [
                const TextAtom(
                  'Error finding CyBear Jinni Hub in your current'
                  ' network.\n'
                  'Please restart connecting Hub to WiFi process.',
                ),
                TextButton(
                  onPressed: _routeToHub,
                  child: const TextAtom('Go Back'),
                ),
              ],
            ),
          ),
        );
    }
  }
}

enum ComputerConnectionCheckState {
  initial,
  actionInProgress,
  errorInProcess,
  ;
}
