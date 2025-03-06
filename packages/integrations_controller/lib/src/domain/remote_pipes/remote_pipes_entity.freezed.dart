// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_pipes_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemotePipesEntity {
  RemotePipesDomain? get domainName => throw _privateConstructorUsedError;

  /// Create a copy of RemotePipesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemotePipesEntityCopyWith<RemotePipesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemotePipesEntityCopyWith<$Res> {
  factory $RemotePipesEntityCopyWith(
          RemotePipesEntity value, $Res Function(RemotePipesEntity) then) =
      _$RemotePipesEntityCopyWithImpl<$Res, RemotePipesEntity>;
  @useResult
  $Res call({RemotePipesDomain? domainName});
}

/// @nodoc
class _$RemotePipesEntityCopyWithImpl<$Res, $Val extends RemotePipesEntity>
    implements $RemotePipesEntityCopyWith<$Res> {
  _$RemotePipesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemotePipesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainName = freezed,
  }) {
    return _then(_value.copyWith(
      domainName: freezed == domainName
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as RemotePipesDomain?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemotePipesEntityImplCopyWith<$Res>
    implements $RemotePipesEntityCopyWith<$Res> {
  factory _$$RemotePipesEntityImplCopyWith(_$RemotePipesEntityImpl value,
          $Res Function(_$RemotePipesEntityImpl) then) =
      __$$RemotePipesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RemotePipesDomain? domainName});
}

/// @nodoc
class __$$RemotePipesEntityImplCopyWithImpl<$Res>
    extends _$RemotePipesEntityCopyWithImpl<$Res, _$RemotePipesEntityImpl>
    implements _$$RemotePipesEntityImplCopyWith<$Res> {
  __$$RemotePipesEntityImplCopyWithImpl(_$RemotePipesEntityImpl _value,
      $Res Function(_$RemotePipesEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemotePipesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainName = freezed,
  }) {
    return _then(_$RemotePipesEntityImpl(
      domainName: freezed == domainName
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as RemotePipesDomain?,
    ));
  }
}

/// @nodoc

class _$RemotePipesEntityImpl extends _RemotePipesEntity {
  const _$RemotePipesEntityImpl({required this.domainName}) : super._();

  @override
  final RemotePipesDomain? domainName;

  @override
  String toString() {
    return 'RemotePipesEntity(domainName: $domainName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemotePipesEntityImpl &&
            (identical(other.domainName, domainName) ||
                other.domainName == domainName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, domainName);

  /// Create a copy of RemotePipesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemotePipesEntityImplCopyWith<_$RemotePipesEntityImpl> get copyWith =>
      __$$RemotePipesEntityImplCopyWithImpl<_$RemotePipesEntityImpl>(
          this, _$identity);
}

abstract class _RemotePipesEntity extends RemotePipesEntity {
  const factory _RemotePipesEntity(
      {required final RemotePipesDomain? domainName}) = _$RemotePipesEntityImpl;
  const _RemotePipesEntity._() : super._();

  @override
  RemotePipesDomain? get domainName;

  /// Create a copy of RemotePipesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemotePipesEntityImplCopyWith<_$RemotePipesEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
