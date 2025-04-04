import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our package
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';

class CbjHubInNetworkWidget extends StatefulWidget {
  const CbjHubInNetworkWidget({super.key});

  @override
  State<CbjHubInNetworkWidget> createState() => _CbjHubInNetworkWidgetState();
}

class _CbjHubInNetworkWidgetState extends State<CbjHubInNetworkWidget> {
  bool loading = true;
  String? ipOnTheNetwork;
  HubFailures? hubFailure;

  @override
  void initState() {
    super.initState();
    _searchDevices();
  }

  Future _searchDevices() async {
    setState(() {
      loading = true;
    });
    final String? bssid = NetworksManager.instance.currentNetwork?.bssid;
    if (bssid == null) {
      logger.e('Please set up network');
      return;
    }
    if (ConnectionsService.getCurrentConnectionType() == ConnectionType.none) {
      ConnectionsService.setCurrentConnectionType(
        networkBssid: bssid,
        connectionType: ConnectionType.hub,
      );
    }

    ConnectionsService.instance.connect();
    bool foundEntity = false;
    ConnectionsService.instance.watchEntities().listen((event) {
      if (!mounted || foundEntity) {
        return;
      }
      foundEntity = true;
      context.router.replace(const HomeRoute());
      return;
    });

    final HashMap<String, DeviceEntityBase> entities =
        await ConnectionsService.instance.getEntities;

    if (entities.isNotEmpty) {
      if (!mounted || foundEntity) {
        return;
      }
      foundEntity = true;

      if (mounted) {
        context.router.replace(const HomeRoute());
      }
      return;
    }

    await Future.delayed(const Duration(seconds: 10));

    if (!mounted || foundEntity) {
      return;
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const SizedBox(
        height: 70,
        width: 70,
        child: CircularProgressIndicatorAtom(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextAtom("Unexpected error"),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white.withAlpha((0.8 * 255).toInt()),
          ),
          onPressed: () {
            _searchDevices();
          },
          child: const TextAtom('Retry'),
        ),
      ],
    );
  }
}
