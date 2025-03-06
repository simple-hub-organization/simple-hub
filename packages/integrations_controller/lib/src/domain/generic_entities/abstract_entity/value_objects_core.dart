import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_errors.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectCore<T> {
  const ValueObjectCore();

  Either<CoreFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold(
      (f) {
        return throw CoreUnexpectedValueError(f);
      },
      id,
    );
  }

  Either<CoreFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectCore<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class CoreUniqueId extends ValueObjectCore<String> {
  factory CoreUniqueId() {
    return CoreUniqueId._(right(const Uuid().v1()));
  }

  factory CoreUniqueId.fromUniqueString(String uniqueId) {
    return CoreUniqueId._(right(uniqueId));
  }

  const CoreUniqueId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// Object that will store the unique id of the device that each vendor send
class EntityUniqueId extends ValueObjectCore<String> {
  factory EntityUniqueId(String? input) {
    assert(input != null);
    return EntityUniqueId._(right(input!));
  }

  const EntityUniqueId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class CbjEntityName extends ValueObjectCore<String?> {
  factory CbjEntityName({String? value}) {
    return CbjEntityName._(
      value == null ? right(value) : validateMaxNameLength(value, maxLength),
    );
  }

  const CbjEntityName._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;

  static const maxLength = 1000;
}

class EntityOriginalName extends ValueObjectCore<String> {
  factory EntityOriginalName(String input) {
    return EntityOriginalName._(validateMaxNameLength(input, maxLength));
  }

  const EntityOriginalName._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static const maxLength = 1000;
}

class DeviceOriginalName extends ValueObjectCore<String?> {
  factory DeviceOriginalName({String? value}) {
    return DeviceOriginalName._(
      value == null ? right(value) : validateMaxNameLength(value, maxLength),
    );
  }

  const DeviceOriginalName._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;

  static const maxLength = 1000;
}

class DeviceSrvResourceRecord extends ValueObjectCore<String?> {
  factory DeviceSrvResourceRecord({String? input}) {
    return DeviceSrvResourceRecord._(right(input));
  }

  const DeviceSrvResourceRecord._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DeviceSrvTarget extends ValueObjectCore<String?> {
  factory DeviceSrvTarget({String? input}) {
    return DeviceSrvTarget._(right(input));
  }

  const DeviceSrvTarget._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DevicePtrResourceRecord extends ValueObjectCore<String?> {
  factory DevicePtrResourceRecord({String? input}) {
    return DevicePtrResourceRecord._(right(input));
  }

  const DevicePtrResourceRecord._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DeviceMdnsServiceType extends ValueObjectCore<String?> {
  factory DeviceMdnsServiceType({String? input}) {
    return DeviceMdnsServiceType._(right(input));
  }

  const DeviceMdnsServiceType._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class EntityState extends ValueObjectCore<String> {
  factory EntityState(EntityStateGRPC input) {
    return EntityState._(
      right(input.name),
      input,
    );
  }

  factory EntityState.state(EntityStateGRPC input) {
    return EntityState._(
      right(input.toString()),
      input,
    );
  }

  const EntityState._(this.value, this._state);

  final EntityStateGRPC _state;

  EntityStateGRPC get state => _state;

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceSenderDeviceOs extends ValueObjectCore<String> {
  factory DeviceSenderDeviceOs(String? input) {
    assert(input != null);
    return DeviceSenderDeviceOs._(right(input!));
  }

  const DeviceSenderDeviceOs._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceStateMassage extends ValueObjectCore<String> {
  factory DeviceStateMassage({String? value}) {
    value ??= '';
    return DeviceStateMassage._(right(value));
  }

  const DeviceStateMassage._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceSenderDeviceModel extends ValueObjectCore<String> {
  factory DeviceSenderDeviceModel(String? input) {
    assert(input != null);
    return DeviceSenderDeviceModel._(right(input!));
  }

  const DeviceSenderDeviceModel._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceSenderId extends ValueObjectCore<String> {
  factory DeviceSenderId() {
    return DeviceSenderId._(right(const Uuid().v1()));
  }

  factory DeviceSenderId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return DeviceSenderId._(right(uniqueId!));
  }

  const DeviceSenderId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceAction extends ValueObjectCore<String> {
  factory DeviceAction(String? input) {
    assert(input != null);

    if (input == 'false') {
      input = EntityActions.off.toString();
    } else if (input == 'true') {
      input = EntityActions.on.toString();
    }
    return DeviceAction._(
      validateDeviceActionExist(input!),
    );
  }

  const DeviceAction._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class EntityType extends ValueObjectCore<String> {
  const EntityType._(this.value, this.type);

  factory EntityType.type(EntityTypes type) {
    return EntityType._(
      right(type.toString()),
      type,
    );
  }

  final EntityTypes type;

  @override
  final Either<CoreFailure<String>, String> value;
}

class CbjDeviceVendor extends ValueObjectCore<String> {
  factory CbjDeviceVendor(VendorsAndServices value) {
    return CbjDeviceVendor._(
      right(value.name),
      value,
    );
  }

  const CbjDeviceVendor._(this.value, this._vendorsAndServices);

  final VendorsAndServices _vendorsAndServices;

  VendorsAndServices get vendorsAndServices => _vendorsAndServices;

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceVendor extends ValueObjectCore<String?> {
  factory DeviceVendor({String? value}) {
    return DeviceVendor._(right(value));
  }

  const DeviceVendor._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DeviceNetworkLastUpdate extends ValueObjectCore<String?> {
  factory DeviceNetworkLastUpdate({String? value}) {
    return DeviceNetworkLastUpdate._(right(value));
  }

  const DeviceNetworkLastUpdate._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DeviceCompUuid extends ValueObjectCore<String> {
  factory DeviceCompUuid(String? input) {
    assert(input != null);
    return DeviceCompUuid._(right(input!));
  }

  const DeviceCompUuid._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceLastKnownIp extends ValueObjectCore<String?> {
  factory DeviceLastKnownIp({String? value}) {
    return DeviceLastKnownIp._(right(value));
  }

  const DeviceLastKnownIp._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DevicePowerConsumption extends ValueObjectCore<String> {
  factory DevicePowerConsumption(String? input) {
    assert(input != null);
    input = '0';
    return DevicePowerConsumption._(
      validatePowerConsumptionNotEmpty(input),
    );
  }

  const DevicePowerConsumption._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceMdns extends ValueObjectCore<String?> {
  factory DeviceMdns({String? value}) {
    return DeviceMdns._(right(value));
  }

  const DeviceMdns._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DevicePort extends ValueObjectCore<String?> {
  factory DevicePort({String? value}) {
    return DevicePort._(
      validatePortNotEmpty(value),
    );
  }

  const DevicePort._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class EntityKey extends ValueObjectCore<String> {
  factory EntityKey(String? input) {
    assert(input != null);
    return EntityKey._(
      validateKeyNotEmpty(input!),
    );
  }

  const EntityKey._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceUniqueId extends ValueObjectCore<String> {
  factory DeviceUniqueId(String? input) {
    assert(input != null);
    return DeviceUniqueId._(
      right(input!),
    );
  }

  const DeviceUniqueId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceHostName extends ValueObjectCore<String?> {
  factory DeviceHostName({String? value}) {
    return DeviceHostName._(
      right(value),
    );
  }

  const DeviceHostName._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class RequestTimeStamp extends ValueObjectCore<String> {
  factory RequestTimeStamp(String? input) {
    assert(input != null);
    return RequestTimeStamp._(right(input!));
  }

  const RequestTimeStamp._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class LastResponseFromDeviceTimeStamp extends ValueObjectCore<String> {
  factory LastResponseFromDeviceTimeStamp(String? input) {
    assert(input != null);
    return LastResponseFromDeviceTimeStamp._(right(input!));
  }

  const LastResponseFromDeviceTimeStamp._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DevicesMacAddress extends ValueObjectCore<String?> {
  factory DevicesMacAddress({String? value}) {
    return DevicesMacAddress._(right(value));
  }

  const DevicesMacAddress._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}
