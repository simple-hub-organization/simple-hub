// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hub_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HubEntity {
  HubNetworkBssid get hubNetworkBssid => throw _privateConstructorUsedError;
  HubNetworkName get networkName => throw _privateConstructorUsedError;
  HubNetworkIp get lastKnownIp => throw _privateConstructorUsedError;
  HubMdnsName? get mdnsName => throw _privateConstructorUsedError;

  /// Create a copy of HubEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HubEntityCopyWith<HubEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HubEntityCopyWith<$Res> {
  factory $HubEntityCopyWith(HubEntity value, $Res Function(HubEntity) then) =
      _$HubEntityCopyWithImpl<$Res, HubEntity>;
  @useResult
  $Res call(
      {HubNetworkBssid hubNetworkBssid,
      HubNetworkName networkName,
      HubNetworkIp lastKnownIp,
      HubMdnsName? mdnsName});
}

/// @nodoc
class _$HubEntityCopyWithImpl<$Res, $Val extends HubEntity>
    implements $HubEntityCopyWith<$Res> {
  _$HubEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HubEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hubNetworkBssid = null,
    Object? networkName = null,
    Object? lastKnownIp = null,
    Object? mdnsName = freezed,
  }) {
    return _then(_value.copyWith(
      hubNetworkBssid: null == hubNetworkBssid
          ? _value.hubNetworkBssid
          : hubNetworkBssid // ignore: cast_nullable_to_non_nullable
              as HubNetworkBssid,
      networkName: null == networkName
          ? _value.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as HubNetworkName,
      lastKnownIp: null == lastKnownIp
          ? _value.lastKnownIp
          : lastKnownIp // ignore: cast_nullable_to_non_nullable
              as HubNetworkIp,
      mdnsName: freezed == mdnsName
          ? _value.mdnsName
          : mdnsName // ignore: cast_nullable_to_non_nullable
              as HubMdnsName?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HubEntityImplCopyWith<$Res>
    implements $HubEntityCopyWith<$Res> {
  factory _$$HubEntityImplCopyWith(
          _$HubEntityImpl value, $Res Function(_$HubEntityImpl) then) =
      __$$HubEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HubNetworkBssid hubNetworkBssid,
      HubNetworkName networkName,
      HubNetworkIp lastKnownIp,
      HubMdnsName? mdnsName});
}

/// @nodoc
class __$$HubEntityImplCopyWithImpl<$Res>
    extends _$HubEntityCopyWithImpl<$Res, _$HubEntityImpl>
    implements _$$HubEntityImplCopyWith<$Res> {
  __$$HubEntityImplCopyWithImpl(
      _$HubEntityImpl _value, $Res Function(_$HubEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HubEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hubNetworkBssid = null,
    Object? networkName = null,
    Object? lastKnownIp = null,
    Object? mdnsName = freezed,
  }) {
    return _then(_$HubEntityImpl(
      hubNetworkBssid: null == hubNetworkBssid
          ? _value.hubNetworkBssid
          : hubNetworkBssid // ignore: cast_nullable_to_non_nullable
              as HubNetworkBssid,
      networkName: null == networkName
          ? _value.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as HubNetworkName,
      lastKnownIp: null == lastKnownIp
          ? _value.lastKnownIp
          : lastKnownIp // ignore: cast_nullable_to_non_nullable
              as HubNetworkIp,
      mdnsName: freezed == mdnsName
          ? _value.mdnsName
          : mdnsName // ignore: cast_nullable_to_non_nullable
              as HubMdnsName?,
    ));
  }
}

/// @nodoc

class _$HubEntityImpl extends _HubEntity {
  const _$HubEntityImpl(
      {required this.hubNetworkBssid,
      required this.networkName,
      required this.lastKnownIp,
      this.mdnsName})
      : super._();

  @override
  final HubNetworkBssid hubNetworkBssid;
  @override
  final HubNetworkName networkName;
  @override
  final HubNetworkIp lastKnownIp;
  @override
  final HubMdnsName? mdnsName;

  @override
  String toString() {
    return 'HubEntity(hubNetworkBssid: $hubNetworkBssid, networkName: $networkName, lastKnownIp: $lastKnownIp, mdnsName: $mdnsName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HubEntityImpl &&
            (identical(other.hubNetworkBssid, hubNetworkBssid) ||
                other.hubNetworkBssid == hubNetworkBssid) &&
            (identical(other.networkName, networkName) ||
                other.networkName == networkName) &&
            (identical(other.lastKnownIp, lastKnownIp) ||
                other.lastKnownIp == lastKnownIp) &&
            (identical(other.mdnsName, mdnsName) ||
                other.mdnsName == mdnsName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hubNetworkBssid, networkName, lastKnownIp, mdnsName);

  /// Create a copy of HubEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HubEntityImplCopyWith<_$HubEntityImpl> get copyWith =>
      __$$HubEntityImplCopyWithImpl<_$HubEntityImpl>(this, _$identity);
}

abstract class _HubEntity extends HubEntity {
  const factory _HubEntity(
      {required final HubNetworkBssid hubNetworkBssid,
      required final HubNetworkName networkName,
      required final HubNetworkIp lastKnownIp,
      final HubMdnsName? mdnsName}) = _$HubEntityImpl;
  const _HubEntity._() : super._();

  @override
  HubNetworkBssid get hubNetworkBssid;
  @override
  HubNetworkName get networkName;
  @override
  HubNetworkIp get lastKnownIp;
  @override
  HubMdnsName? get mdnsName;

  /// Create a copy of HubEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HubEntityImplCopyWith<_$HubEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
