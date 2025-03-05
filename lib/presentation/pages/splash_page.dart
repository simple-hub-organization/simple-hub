import 'dart:collection';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/domain/manage_network/i_manage_network_repository.dart';
import 'package:cybearjinni/infrastructure/app_commands.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:cybearjinni/infrastructure/mqtt.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/permissions_dialog_molecule.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future initializeApp() async {
    SystemCommandsBaseClassD.instance = AppCommands();
    await Hive.initFlutter();
    await IDbRepository.instance.asyncConstructor();
    NetworksManager().loadFromDb();
    final bool success = await IManageNetworkRepository.instance.loadWifi();
    if (!success) {
      if (mounted) {
        permsissionsDialog(context);
      }
      return;
    }
    final String? bssid = NetworksManager().currentNetwork?.bssid;
    if (bssid == null) {
      logger.e('Please set up network');
      return;
    }
    await IcSynchronizer().loadAllFromDb();
    ConnectionsService.setCurrentConnectionType(
      networkBssid: bssid,
      connectionType: ConnectionType.hub,
    );

    ConnectionsService.instance.searchDevices();

    // TODO: Only here so that app will not crash
    MqttServerRepository();
    NodeRedRepository();

    _navigate();
  }

  Future _navigate() async {
    final HashMap<String, DeviceEntityBase> entities =
        await IcSynchronizer().getEntities();
    if (!mounted) {
      return;
    }
    if (entities.isNotEmpty) {
      context.router.replace(const HomeRoute());
      return;
    }
    if (kIsWeb || Platform.isLinux || Platform.isWindows) {
      context.router.replace(const ConnectToHubRoute());
      return;
    }
    context.router.replace(const IntroductionRouteRoute());
    return;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ImageAtom(
          'assets/cbj_logo.png',
          hero: 'full_logo',
        ),
      ),
    );
  }
}
