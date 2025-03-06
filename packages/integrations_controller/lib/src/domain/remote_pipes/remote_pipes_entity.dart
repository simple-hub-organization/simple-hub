import 'package:integrations_controller/src/domain/remote_pipes/remote_pipes_failures.dart';
import 'package:integrations_controller/src/domain/remote_pipes/remote_pipes_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_pipes_entity.freezed.dart';

@freezed
abstract class RemotePipesEntity implements _$RemotePipesEntity {
  const factory RemotePipesEntity({
    required RemotePipesDomain? domainName,
  }) = _RemotePipesEntity;

  const RemotePipesEntity._();

  factory RemotePipesEntity.empty() => RemotePipesEntity(
        domainName: RemotePipesDomain(''),
      );

  Option<RemotePipesFailures<dynamic>> get failureOption {
    return domainName!.value.fold((f) => some(f), (_) => none());
  }

  RemotePipesDtos toInfrastructure() {
    return RemotePipesDtos(
      domainName: domainName!.getOrCrash(),
    );
  }
}
