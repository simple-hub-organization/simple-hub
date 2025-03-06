// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hub_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HubDtos _$HubDtosFromJson(Map<String, dynamic> json) {
  return _HubDtos.fromJson(json);
}

/// @nodoc
mixin _$HubDtos {
// @JsonKey(includeFromJson: true)
  String get hubNetworkBssid => throw _privateConstructorUsedError;
  String get networkName => throw _privateConstructorUsedError;
  String get lastKnownIp => throw _privateConstructorUsedError;

  /// Serializes this HubDtos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HubDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HubDtosCopyWith<HubDtos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HubDtosCopyWith<$Res> {
  factory $HubDtosCopyWith(HubDtos value, $Res Function(HubDtos) then) =
      _$HubDtosCopyWithImpl<$Res, HubDtos>;
  @useResult
  $Res call({String hubNetworkBssid, String networkName, String lastKnownIp});
}

/// @nodoc
class _$HubDtosCopyWithImpl<$Res, $Val extends HubDtos>
    implements $HubDtosCopyWith<$Res> {
  _$HubDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HubDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hubNetworkBssid = null,
    Object? networkName = null,
    Object? lastKnownIp = null,
  }) {
    return _then(_value.copyWith(
      hubNetworkBssid: null == hubNetworkBssid
          ? _value.hubNetworkBssid
          : hubNetworkBssid // ignore: cast_nullable_to_non_nullable
              as String,
      networkName: null == networkName
          ? _value.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as String,
      lastKnownIp: null == lastKnownIp
          ? _value.lastKnownIp
          : lastKnownIp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HubDtosImplCopyWith<$Res> implements $HubDtosCopyWith<$Res> {
  factory _$$HubDtosImplCopyWith(
          _$HubDtosImpl value, $Res Function(_$HubDtosImpl) then) =
      __$$HubDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hubNetworkBssid, String networkName, String lastKnownIp});
}

/// @nodoc
class __$$HubDtosImplCopyWithImpl<$Res>
    extends _$HubDtosCopyWithImpl<$Res, _$HubDtosImpl>
    implements _$$HubDtosImplCopyWith<$Res> {
  __$$HubDtosImplCopyWithImpl(
      _$HubDtosImpl _value, $Res Function(_$HubDtosImpl) _then)
      : super(_value, _then);

  /// Create a copy of HubDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hubNetworkBssid = null,
    Object? networkName = null,
    Object? lastKnownIp = null,
  }) {
    return _then(_$HubDtosImpl(
      hubNetworkBssid: null == hubNetworkBssid
          ? _value.hubNetworkBssid
          : hubNetworkBssid // ignore: cast_nullable_to_non_nullable
              as String,
      networkName: null == networkName
          ? _value.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as String,
      lastKnownIp: null == lastKnownIp
          ? _value.lastKnownIp
          : lastKnownIp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HubDtosImpl extends _HubDtos {
  _$HubDtosImpl(
      {required this.hubNetworkBssid,
      required this.networkName,
      required this.lastKnownIp})
      : super._();

  factory _$HubDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$HubDtosImplFromJson(json);

// @JsonKey(includeFromJson: true)
  @override
  final String hubNetworkBssid;
  @override
  final String networkName;
  @override
  final String lastKnownIp;

  @override
  String toString() {
    return 'HubDtos(hubNetworkBssid: $hubNetworkBssid, networkName: $networkName, lastKnownIp: $lastKnownIp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HubDtosImpl &&
            (identical(other.hubNetworkBssid, hubNetworkBssid) ||
                other.hubNetworkBssid == hubNetworkBssid) &&
            (identical(other.networkName, networkName) ||
                other.networkName == networkName) &&
            (identical(other.lastKnownIp, lastKnownIp) ||
                other.lastKnownIp == lastKnownIp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hubNetworkBssid, networkName, lastKnownIp);

  /// Create a copy of HubDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HubDtosImplCopyWith<_$HubDtosImpl> get copyWith =>
      __$$HubDtosImplCopyWithImpl<_$HubDtosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HubDtosImplToJson(
      this,
    );
  }
}

abstract class _HubDtos extends HubDtos {
  factory _HubDtos(
      {required final String hubNetworkBssid,
      required final String networkName,
      required final String lastKnownIp}) = _$HubDtosImpl;
  _HubDtos._() : super._();

  factory _HubDtos.fromJson(Map<String, dynamic> json) = _$HubDtosImpl.fromJson;

// @JsonKey(includeFromJson: true)
  @override
  String get hubNetworkBssid;
  @override
  String get networkName;
  @override
  String get lastKnownIp;

  /// Create a copy of HubDtos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HubDtosImplCopyWith<_$HubDtosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
