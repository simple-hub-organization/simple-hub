import 'package:cbj_integrations_controller/src/domain/remote_pipes/remote_pipes_errors.dart';
import 'package:cbj_integrations_controller/src/domain/remote_pipes/remote_pipes_failures.dart';
import 'package:cbj_integrations_controller/src/domain/remote_pipes/remote_pipes_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class RemotePipesValueObjectAbstract<T> {
  const RemotePipesValueObjectAbstract();

  Either<RemotePipesFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ManageWiFiFailures]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw RemotePipesUnexpectedValueError(f), id);
  }

  Either<RemotePipesFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is RemotePipesValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class RemotePipesDomain extends RemotePipesValueObjectAbstract<String> {
  factory RemotePipesDomain(String input) {
    return RemotePipesDomain._(
      validateRemotePipesEmpty(input),
    );
  }

  const RemotePipesDomain._(this.value);

  @override
  final Either<RemotePipesFailures<String>, String> value;
}
