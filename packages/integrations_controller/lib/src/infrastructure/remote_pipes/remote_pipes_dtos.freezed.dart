// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_pipes_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemotePipesDtos _$RemotePipesDtosFromJson(Map<String, dynamic> json) {
  return _RemotePipesDtos.fromJson(json);
}

/// @nodoc
mixin _$RemotePipesDtos {
// @JsonKey(ignore: true)
  String get domainName => throw _privateConstructorUsedError;

  /// Serializes this RemotePipesDtos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemotePipesDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemotePipesDtosCopyWith<RemotePipesDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemotePipesDtosCopyWith<$Res> {
  factory $RemotePipesDtosCopyWith(
          RemotePipesDtos value, $Res Function(RemotePipesDtos) then) =
      _$RemotePipesDtosCopyWithImpl<$Res, RemotePipesDtos>;
  @useResult
  $Res call({String domainName});
}

/// @nodoc
class _$RemotePipesDtosCopyWithImpl<$Res, $Val extends RemotePipesDtos>
    implements $RemotePipesDtosCopyWith<$Res> {
  _$RemotePipesDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemotePipesDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainName = null,
  }) {
    return _then(_value.copyWith(
      domainName: null == domainName
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemotePipesDtosImplCopyWith<$Res>
    implements $RemotePipesDtosCopyWith<$Res> {
  factory _$$RemotePipesDtosImplCopyWith(_$RemotePipesDtosImpl value,
          $Res Function(_$RemotePipesDtosImpl) then) =
      __$$RemotePipesDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String domainName});
}

/// @nodoc
class __$$RemotePipesDtosImplCopyWithImpl<$Res>
    extends _$RemotePipesDtosCopyWithImpl<$Res, _$RemotePipesDtosImpl>
    implements _$$RemotePipesDtosImplCopyWith<$Res> {
  __$$RemotePipesDtosImplCopyWithImpl(
      _$RemotePipesDtosImpl _value, $Res Function(_$RemotePipesDtosImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemotePipesDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainName = null,
  }) {
    return _then(_$RemotePipesDtosImpl(
      domainName: null == domainName
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemotePipesDtosImpl extends _RemotePipesDtos {
  _$RemotePipesDtosImpl({required this.domainName}) : super._();

  factory _$RemotePipesDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemotePipesDtosImplFromJson(json);

// @JsonKey(ignore: true)
  @override
  final String domainName;

  @override
  String toString() {
    return 'RemotePipesDtos(domainName: $domainName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemotePipesDtosImpl &&
            (identical(other.domainName, domainName) ||
                other.domainName == domainName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domainName);

  /// Create a copy of RemotePipesDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemotePipesDtosImplCopyWith<_$RemotePipesDtosImpl> get copyWith =>
      __$$RemotePipesDtosImplCopyWithImpl<_$RemotePipesDtosImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemotePipesDtosImplToJson(
      this,
    );
  }
}

abstract class _RemotePipesDtos extends RemotePipesDtos {
  factory _RemotePipesDtos({required final String domainName}) =
      _$RemotePipesDtosImpl;
  _RemotePipesDtos._() : super._();

  factory _RemotePipesDtos.fromJson(Map<String, dynamic> json) =
      _$RemotePipesDtosImpl.fromJson;

// @JsonKey(ignore: true)
  @override
  String get domainName;

  /// Create a copy of RemotePipesDtos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemotePipesDtosImplCopyWith<_$RemotePipesDtosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
