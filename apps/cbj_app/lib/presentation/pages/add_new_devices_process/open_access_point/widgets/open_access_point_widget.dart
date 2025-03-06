import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cybearjinni/domain/home_user/home_user_failures.dart';
import 'package:cybearjinni/domain/manage_network/i_manage_network_repository.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_entity.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_value_objects.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/core/snack_bar_service.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';

class OpenAccessPointWidget extends StatefulWidget {
  @override
  State<OpenAccessPointWidget> createState() => _OpenAccessPointWidgetState();
}

class _OpenAccessPointWidgetState extends State<OpenAccessPointWidget> {
  OpenAccessPointState state = OpenAccessPointState.initial;

  ManageWiFiName? wifiName;
  ManageWiFiPass? wifiPassword;

  @override
  void initState() {
    super.initState();
    _initialized();
  }

  Future _initialized() async {
    OpenAccessPointState stateTemp;
    if (Platform.isAndroid) {
      final ManageNetworkEntity manageNetworkEntity = ManageNetworkEntity(
        name: ManageWiFiName('CyBear Jinni'),
        pass: ManageWiFiPass('CyBear Jinni'),
      );

      final dartz.Either<HomeUserFailures, dartz.Unit> openedAccessPoint =
          await IManageNetworkRepository.instance
              .openAccessPoint(manageNetworkEntity);
      stateTemp = openedAccessPoint.fold(
        (f) => OpenAccessPointState.iOSDevice,
        (r) => OpenAccessPointState.loaded,
      );
    } else {
      stateTemp = OpenAccessPointState.iOSDevice;
    }
    setState(() {
      state = stateTemp;
    });
  }

  Future _doesAccessPointOpen() async {
    OpenAccessPointState stateTemp;

    if (Platform.isAndroid) {
      final dartz.Either<HomeUserFailures, dartz.Unit> openedAccessPoint =
          await IManageNetworkRepository.instance.doesAccessPointOpen();

      stateTemp = openedAccessPoint.fold((HomeUserFailures f) {
        if (f == const HomeUserFailures.accessPointIsNotOpen()) {
          return OpenAccessPointState.accessPointIsNotOpen;
        }
        return OpenAccessPointState.cantDetermineAccessPointOpenOrNot;
      }, (r) {
        context.router.replace(const ScanForNewCBJCompsRoute());

        return OpenAccessPointState.accessPointIsOpen;
      });
    } else {
      stateTemp = OpenAccessPointState.cantDetermineAccessPointOpenOrNot;
    }
    setState(() {
      state = stateTemp;
    });
  }

  Widget getStateWidget() {
    switch (state) {
      case OpenAccessPointState.initial:
        return TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Colors.greenAccent,
            ),
          ),
          onPressed: _initialized,
          child: const TextAtom('Create Access Pint'),
        );
      case OpenAccessPointState.loading:
        return const CircularProgressIndicatorAtom();
      case OpenAccessPointState.loaded:
        return const TextAtom('Loaded');
      case OpenAccessPointState.error:
        return const TextAtom('Failure');
      case OpenAccessPointState.iOSDevice:
        return Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: const TextAtom(
                'Please Open Access point with the following '
                'credentials in the OS Settings.',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.black12,
                    ),
                  ),
                  onPressed: () {
                    if (!mounted) {
                      return;
                    }
                    FlutterClipboard.copy('CyBear Jinni').then(
                      (value) => SnackBarService().show(
                        context,
                        'Copy',
                      ),
                    );
                  },
                  child: const Column(
                    children: <Widget>[
                      TextAtom(
                        'Hotspot name:',
                        style: TextStyle(color: Colors.white60),
                      ),
                      TextAtom(
                        'CyBear Jinni',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.black12,
                    ),
                  ),
                  onPressed: () {
                    FlutterClipboard.copy('CyBear Jinni').then(
                      (value) => SnackBarService().show(
                        context,
                        'Copy',
                      ),
                    );
                  },
                  child: const Column(
                    children: <Widget>[
                      TextAtom(
                        'Hotspot password:',
                        style: TextStyle(color: Colors.white60),
                      ),
                      TextAtom(
                        'CyBear Jinni',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );

      case OpenAccessPointState.cantDetermineAccessPointOpenOrNot:
        return const TextAtom('CantDetermineAccessPointOpenOrNot');

      case OpenAccessPointState.accessPointIsNotOpen:
        return const TextAtom('AccessPointIsNotOpen');

      case OpenAccessPointState.accessPointIsOpen:
        return const TextAtom('AccessPointIsOpen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getStateWidget(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: const TextAtom(
              "Currently we can't verify that you have opened Access pont.\n"
              'Press next only after you have preformed the actions above!.',
              style: TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.greenAccent,
              ),
            ),
            onPressed: _doesAccessPointOpen,
            child: const TextAtom('Next'),
          ),
        ],
      ),
    );
  }
}

enum OpenAccessPointState {
  initial,
  loading,
  loaded,
  error,
  iOSDevice,
  cantDetermineAccessPointOpenOrNot,
  accessPointIsNotOpen,
  accessPointIsOpen,
  ;
}
