import 'dart:collection';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages because this is our package
import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/infrastructure/node_red/node_red_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/domain/manage_network/i_manage_network_repository.dart';
import 'package:simple_hub/infrastructure/app_commands.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';
import 'package:simple_hub/infrastructure/mqtt.dart';
import 'package:simple_hub/infrastructure/network_utilities_flutter.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/molecules/permissions_dialog_molecule.dart';

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
    VendorConnectorConjectureController.instance.asyncConstructor();
    // Set if not running as test
    if (INetworkUtilities.instance.runtimeType == NetworkUtilities) {
      INetworkUtilities.instance = NetworkUtilitiesFlutter();
      await INetworkUtilities.instance.configureNetworkTools(
        (await getApplicationDocumentsDirectory()).path,
      );
    }
    SystemCommandsBaseClassD.instance = AppCommands();
    await Hive.initFlutter();
    await IDbRepository.instance.asyncConstructor();
    NetworksManager.instance.loadFromDb();
    final bool success = await IManageNetworkRepository.instance.loadWifi();
    if (!success) {
      if (mounted) {
        permsissionsDialog(context);
      }
      return;
    }
    final String? bssid = NetworksManager.instance.currentNetwork?.bssid;
    if (bssid == null) {
      logger.e('(initializeApp) Please set up network');
      return;
    }
    await IcSynchronizer().loadAllFromDb();
    if (ConnectionsService.getCurrentConnectionType() == ConnectionType.none) {
      ConnectionsService.setCurrentConnectionType(
        networkBssid: bssid,
        connectionType: ConnectionType.hub,
      );
    }

    // ConnectionsService.instance.searchDevices();

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
      final String? bssid = NetworksManager.instance.currentNetwork?.bssid;
      if (bssid == null) {
        logger.e('(_navigate) Please set up network');
        return;
      }
      if (ConnectionsService.getCurrentConnectionType() ==
          ConnectionType.none) {
        ConnectionsService.setCurrentConnectionType(
          networkBssid: bssid,
          connectionType: ConnectionType.hub,
        );
      }
      await ConnectionsService.instance.connect();
      if (!mounted) {
        return;
      }
      context.router.replace(const HomeRoute());
      return;
    }
    if (kIsWeb || Platform.isLinux || Platform.isWindows) {
      context.router.replace(const ConnectToHubRoute());
      return;
    }
    logger.i('Route to route page');

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
