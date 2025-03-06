import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:simple_hub/domain/home_user/home_user_failures.dart';
import 'package:simple_hub/domain/manage_network/i_manage_network_repository.dart';
import 'package:simple_hub/domain/manage_network/manage_network_entity.dart';
import 'package:simple_hub/domain/manage_network/manage_network_value_objects.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';

class ConnectToHomeWiFiWidget extends StatefulWidget {
  @override
  State<ConnectToHomeWiFiWidget> createState() =>
      _ConnectToHomeWiFiWidgetState();
}

class _ConnectToHomeWiFiWidgetState extends State<ConnectToHomeWiFiWidget> {
  ConnectToHomeWiFiState state = ConnectToHomeWiFiState.loading;
  ManageWiFiName? wifiName;
  ManageWiFiPass? wifiPassword;

  @override
  void initState() {
    super.initState();
    _initialized();
  }

  Future _initialized() async {
    final dartz.Either<HomeUserFailures, String?> doesWiFiEnabled =
        await IManageNetworkRepository.instance.doesWiFiEnabled();

    doesWiFiEnabled.fold((f) {
      setState(() {
        state = ConnectToHomeWiFiState.wifiIsDisabled;
      });
    }, (r) {
      wifiName = r != null ? ManageWiFiName(r) : null;
      setState(() {
        state = ConnectToHomeWiFiState.wifiIsEnabled;
      });
    });
  }

  Future _connectToWiFi() async {
    final ManageNetworkEntity manageWiFiEntity = ManageNetworkEntity(
      name: wifiName,
      pass: wifiPassword,
    );

    final dartz.Either<HomeUserFailures, dartz.Unit> doesWiFiEnabled =
        await IManageNetworkRepository.instance.connectToWiFi(manageWiFiEntity);

    final ConnectToHomeWiFiState tempState = doesWiFiEnabled.fold(
      (f) => ConnectToHomeWiFiState.error,
      (r) => ConnectToHomeWiFiState.loaded,
    );

    setState(() {
      state = tempState;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (state == ConnectToHomeWiFiState.loaded) {
      context.router.replace(const OpenAccessPointRoute());
      return const TextAtom('Loaded');
    }

    if (state == ConnectToHomeWiFiState.error) {
      return const TextAtom('Failure');
    }

    if (state == ConnectToHomeWiFiState.wifiIsEnabled) {
      return Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: const TextAtom(
              'Smart Devices need your home WiFi name and '
              'password in order to connect.',
              style: TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.greenAccent.withAlpha((0.3 * 255).toInt()),
                prefixIcon: Icon(
                  Icons.wifi,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                labelText: 'WiFi Name',
                labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              autocorrect: false,
              onChanged: (value) {
                wifiName = ManageWiFiName(value);
              },
              initialValue: wifiName == null ? '' : wifiName!.getOrCrash(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.greenAccent.withAlpha((0.3 * 255).toInt()),
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              autocorrect: false,
              onChanged: (value) {
                wifiPassword = ManageWiFiPass(value);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.pinkAccent,
              ),
            ),
            onPressed: _connectToWiFi,
            child: TextAtom(
              'Connect to WiFi',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ],
      );
    }

    if (state == ConnectToHomeWiFiState.wifiIsDisabled) {
      return const TextAtom('WiFi is disabled');
    }

    return const CircularProgressIndicatorAtom();
  }
}

enum ConnectToHomeWiFiState {
  loading,
  loaded,
  error,
  wifiIsEnabled,
  wifiIsDisabled,
  ;
}
