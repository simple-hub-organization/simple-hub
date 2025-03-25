import 'dart:async';
import 'dart:collection';

import 'package:hub/infrastructure/devices/matter/matter_helpers.dart';
import 'package:hub/infrastructure/web_socket/hub_javascript_web_socket.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';

class MatterConnectorConjecture extends VendorConnectorConjectureService {
  factory MatterConnectorConjecture() => _instance;

  MatterConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.matter,
          displayName: 'Matter',
          imageUrl:
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.5oTC_gXhq0Tm5U-jFh8MQAHaFj%26pid%3DApi&f=1&ipt=3784aeff30dcaabb602b299e96c2a280e4bfdd0d309fcc3d54d006c04743cdb9&ipo=images',
          uniqeMdnsList: ['_matter._tcp', '_matterc._udp'],
          uniqueIdentifierNameInMdns: ['matter'],
          loginType: VendorLoginTypes.pairingCode,
        );

  static final MatterConnectorConjecture _instance =
      MatterConnectorConjecture._singletonContractor();

  @override
  void addDevice(VendorLoginEntity loginEntity) =>
      HubJavascriptWebSocket.instance.addDevice(loginEntity);

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async {
    logger.i('Found a matter device');
    if (entity.entityStateGRPC.state !=
        EntityStateGRPC.addNewEntityFromJavascriptHub) {
      return HashMap();
    }
    return MatterHelpers.addDiscoveredDevice(entity);
  }
}
