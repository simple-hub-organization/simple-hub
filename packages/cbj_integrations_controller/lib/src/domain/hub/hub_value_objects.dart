import 'package:cbj_integrations_controller/src/domain/hub/hub_errors.dart';
import 'package:cbj_integrations_controller/src/domain/hub/hub_failures.dart';
import 'package:cbj_integrations_controller/src/domain/hub/hub_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HubValueObjectAbstract<T> {
  const HubValueObjectAbstract();

  Either<HubFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [HubFailures]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw HubUnexpectedValueError(f), id);
  }

  Either<HubFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is HubValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class HubNetworkIp extends HubValueObjectAbstract<String> {
  factory HubNetworkIp(String input) {
    return HubNetworkIp._(
      validateStringNotEmpty(input),
    );
  }

  const HubNetworkIp._(this.value);

  @override
  final Either<HubFailures<String>, String> value;
}

class HubMdnsName extends HubValueObjectAbstract<String> {
  factory HubMdnsName(String input) {
    return HubMdnsName._(
      validateStringNotEmpty(input),
    );
  }

  const HubMdnsName._(this.value);

  @override
  final Either<HubFailures<String>, String> value;
}

class HubNetworkBssid extends HubValueObjectAbstract<String> {
  factory HubNetworkBssid(String input) {
    return HubNetworkBssid._(
      validateStringNotEmpty(input),
    );
  }

  const HubNetworkBssid._(this.value);

  @override
  final Either<HubFailures<String>, String> value;
}

class HubNetworkName extends HubValueObjectAbstract<String> {
  factory HubNetworkName(String input) {
    return HubNetworkName._(
      validateStringNotEmpty(input),
    );
  }

  const HubNetworkName._(this.value);

  @override
  final Either<HubFailures<String>, String> value;
}
