import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/theme_data.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

@RoutePage()
class EntitiesInNetworkPage extends StatefulWidget {
  @override
  State<EntitiesInNetworkPage> createState() => _EntitiesInNetworkPageState();
}

class _EntitiesInNetworkPageState extends State<EntitiesInNetworkPage> {
  List<DeviceEntityBase>? allEntities;

  @override
  void initState() {
    super.initState();
    initializeAllEntities();
  }

  Future initializeAllEntities() async {
    final Map<String, DeviceEntityBase> entities =
        await ConnectionsService.instance.getEntities;
    setState(() {
      allEntities = entities.values.toList();
    });
  }

  Widget getTextIfNotNull(String name, String? var1) {
    if (var1 == null ||
        var1.isEmpty ||
        var1 == '0' ||
        var1 == '0.0.0.0' ||
        var1 == '[]' ||
        var1 == 'vendorsAndServicesNotSupported') {
      return const SizedBox();
    }
    return Row(
      children: [
        TextAtom('$name: $var1'),
        const SeparatorAtom(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (allEntities == null) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: const TextAtom('Add and Manage'),
        backgroundColor: Colors.purple.withAlpha((0.7 * 255).toInt()),
      ),
      body: Container(
        margin: AppThemeData.generalHorizontalEdgeInsets,
        child: ListViewMolecule(
          ListViewVeriant.separated,
          itemCount: allEntities!.length,
          itemBuilder: (context, index) {
            final DeviceEntityBase device = allEntities!.elementAt(index);

            final String? deviceLastKnownIp =
                device.deviceLastKnownIp.getOrCrash();
            final String? deviceOriginalName =
                device.deviceOriginalName.getOrCrash();
            final String entityOriginalName =
                device.entityOriginalName.getOrCrash();
            final String? deviceHostName = device.deviceHostName.getOrCrash();
            final String? deviceMdns = device.deviceMdns.getOrCrash();
            final String? devicePort = device.devicePort.getOrCrash();
            final String cbjDeviceVendor = device.cbjDeviceVendor.getOrCrash();
            final String? devicesMacAddress =
                device.devicesMacAddress.getOrCrash();
            final String? srvResourceRecord =
                device.srvResourceRecord.getOrCrash();
            final String? ptrResourceRecord =
                device.ptrResourceRecord.getOrCrash();

            final String? deviceVendor = device.deviceVendor.getOrCrash();

            final String? deviceNetworkLastUpdate =
                device.deviceNetworkLastUpdate.getOrCrash();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  getTextIfNotNull('Ip', deviceLastKnownIp),
                  getTextIfNotNull('Device', deviceOriginalName),
                  getTextIfNotNull('Entity', entityOriginalName),
                  getTextIfNotNull('Host', deviceHostName),
                  getTextIfNotNull('mDNS', deviceMdns),
                  getTextIfNotNull('Port', devicePort),
                  getTextIfNotNull('Vendor', cbjDeviceVendor),
                  getTextIfNotNull('Mac', devicesMacAddress),
                  getTextIfNotNull('Srv', srvResourceRecord),
                  getTextIfNotNull('Ptr', ptrResourceRecord),
                  getTextIfNotNull('Network Vendor', deviceVendor),
                  getTextIfNotNull(
                    'Last Updated',
                    deviceNetworkLastUpdate,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
