import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/devices/xiaomi_io/xiaomi_io_gpx3021gl/xiaomi_io_gpx3021gl_entity.dart';
import 'package:yeedart/yeedart.dart';

class XiaomiIoHelpers {
  static DeviceEntityBase? addDiscoveredDevice({
    required DiscoveryResponse xiaomiIoDevice,
    required CoreUniqueId? uniqueDeviceId,
  }) {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }

    final String deviceName =
        xiaomiIoDevice.name != null && xiaomiIoDevice.name != ''
            ? xiaomiIoDevice.name!
            : 'XiaomiIo test 2';
    final XiaomiIoGpx4021GlEntity xiaomiIoDE = XiaomiIoGpx4021GlEntity(
      uniqueId: uniqueDeviceIdTemp,
      entityUniqueId: EntityUniqueId(xiaomiIoDevice.id.toString()),
      cbjEntityName: CbjEntityName(value: deviceName),
      entityOriginalName: EntityOriginalName(deviceName),
      deviceOriginalName: DeviceOriginalName(value: deviceName),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      senderDeviceOs: DeviceSenderDeviceOs('xiaomi_io'),
      deviceVendor: DeviceVendor(),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
      senderDeviceModel: DeviceSenderDeviceModel('1SE'),
      senderId: DeviceSenderId(),
      compUuid: DeviceCompUuid('34asdfrsd23gggg'),
      deviceMdns: DeviceMdns(value: 'yeelink-light-colora_miap9C52'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      srvTarget: DeviceSrvTarget(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      mdnsServiceType: DeviceMdnsServiceType(),
      deviceLastKnownIp:
          DeviceLastKnownIp(value: xiaomiIoDevice.address.address),
      stateMassage: DeviceStateMassage(value: 'Hello World'),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId(xiaomiIoDevice.id.toString()),
      devicePort: DevicePort(value: xiaomiIoDevice.port.toString()),
      entityCbjUniqueId: CoreUniqueId(),
      lightSwitchState:
          GenericRgbwLightSwitchState(xiaomiIoDevice.powered.toString()),
      lightColorTemperature: GenericRgbwLightColorTemperature(
        xiaomiIoDevice.colorTemperature.toString(),
      ),
      lightBrightness:
          GenericRgbwLightBrightness(xiaomiIoDevice.brightness.toString()),
      lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
      lightColorHue: GenericRgbwLightColorHue('0.0'),
      lightColorSaturation: GenericRgbwLightColorSaturation('1.0'),
      lightColorValue: GenericRgbwLightColorValue('1.0'),
      deviceHostName: DeviceHostName(value: '0'),
      devicesMacAddress: DevicesMacAddress(value: '0'),
      entityKey: EntityKey('0'),
      requestTimeStamp: RequestTimeStamp('0'),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
      colorMode: GenericLightModeState(ColorMode.undefined),
    );

    return xiaomiIoDE;

    // TODO: Add if device type does not supported return null
    // logger.i(
    //   'Please add new Xiaomi device type ${xiaomiIoDevice.model}',
    // );
    // return null;
  }
}
