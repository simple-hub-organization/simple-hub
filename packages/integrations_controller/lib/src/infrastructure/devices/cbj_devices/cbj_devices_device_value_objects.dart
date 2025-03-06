import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/infrastructure/devices/cbj_devices/cbj_devices_device_validators.dart';
import 'package:dartz/dartz.dart';

/// CbjDevices communication port
class CbjDevicesPort extends ValueObjectCore<String> {
  factory CbjDevicesPort(String? input) {
    assert(input != null);
    return CbjDevicesPort._(
      validateCbjDevicesPortNotEmpty(input!),
    );
  }

  const CbjDevicesPort._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// CbjDevices communication port
class DevicesMacAddress extends ValueObjectCore<String> {
  factory DevicesMacAddress(String? input) {
    assert(input != null);
    return DevicesMacAddress._(
      validatedevicesMacAddressNotEmpty(input!),
    );
  }

  const DevicesMacAddress._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
