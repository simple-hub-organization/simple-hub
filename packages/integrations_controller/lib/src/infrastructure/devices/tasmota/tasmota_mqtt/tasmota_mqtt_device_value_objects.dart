import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_device_validators.dart';

/// TasmotaMqtt device unique address that came withe the device
class TasmotaMqttDeviceTopicName extends ValueObjectCore<String> {
  factory TasmotaMqttDeviceTopicName(String? input) {
    assert(input != null);
    return TasmotaMqttDeviceTopicName._(
      validateTasmotaMqttDeviceTopicNameNotEmpty(input!),
    );
  }

  const TasmotaMqttDeviceTopicName._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
