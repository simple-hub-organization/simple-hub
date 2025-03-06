// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_login_entity_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VendorLoginEntityDtos _$VendorLoginEntityDtosFromJson(
    Map<String, dynamic> json) {
  return _VendorLoginEntityDtos.fromJson(json);
}

/// @nodoc
mixin _$VendorLoginEntityDtos {
// @JsonKey(ignore: true)
  String get vendor => throw _privateConstructorUsedError;
  Map<String, dynamic> get credentials => throw _privateConstructorUsedError;

  /// Serializes this VendorLoginEntityDtos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorLoginEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorLoginEntityDtosCopyWith<VendorLoginEntityDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorLoginEntityDtosCopyWith<$Res> {
  factory $VendorLoginEntityDtosCopyWith(VendorLoginEntityDtos value,
          $Res Function(VendorLoginEntityDtos) then) =
      _$VendorLoginEntityDtosCopyWithImpl<$Res, VendorLoginEntityDtos>;
  @useResult
  $Res call({String vendor, Map<String, dynamic> credentials});
}

/// @nodoc
class _$VendorLoginEntityDtosCopyWithImpl<$Res,
        $Val extends VendorLoginEntityDtos>
    implements $VendorLoginEntityDtosCopyWith<$Res> {
  _$VendorLoginEntityDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorLoginEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
    Object? credentials = null,
  }) {
    return _then(_value.copyWith(
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      credentials: null == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorLoginEntityDtosImplCopyWith<$Res>
    implements $VendorLoginEntityDtosCopyWith<$Res> {
  factory _$$VendorLoginEntityDtosImplCopyWith(
          _$VendorLoginEntityDtosImpl value,
          $Res Function(_$VendorLoginEntityDtosImpl) then) =
      __$$VendorLoginEntityDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String vendor, Map<String, dynamic> credentials});
}

/// @nodoc
class __$$VendorLoginEntityDtosImplCopyWithImpl<$Res>
    extends _$VendorLoginEntityDtosCopyWithImpl<$Res,
        _$VendorLoginEntityDtosImpl>
    implements _$$VendorLoginEntityDtosImplCopyWith<$Res> {
  __$$VendorLoginEntityDtosImplCopyWithImpl(_$VendorLoginEntityDtosImpl _value,
      $Res Function(_$VendorLoginEntityDtosImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorLoginEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
    Object? credentials = null,
  }) {
    return _then(_$VendorLoginEntityDtosImpl(
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      credentials: null == credentials
          ? _value._credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorLoginEntityDtosImpl extends _VendorLoginEntityDtos {
  _$VendorLoginEntityDtosImpl(
      {required this.vendor, required final Map<String, dynamic> credentials})
      : _credentials = credentials,
        super._();

  factory _$VendorLoginEntityDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorLoginEntityDtosImplFromJson(json);

// @JsonKey(ignore: true)
  @override
  final String vendor;
  final Map<String, dynamic> _credentials;
  @override
  Map<String, dynamic> get credentials {
    if (_credentials is EqualUnmodifiableMapView) return _credentials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_credentials);
  }

  @override
  String toString() {
    return 'VendorLoginEntityDtos(vendor: $vendor, credentials: $credentials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorLoginEntityDtosImpl &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            const DeepCollectionEquality()
                .equals(other._credentials, _credentials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, vendor, const DeepCollectionEquality().hash(_credentials));

  /// Create a copy of VendorLoginEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorLoginEntityDtosImplCopyWith<_$VendorLoginEntityDtosImpl>
      get copyWith => __$$VendorLoginEntityDtosImplCopyWithImpl<
          _$VendorLoginEntityDtosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorLoginEntityDtosImplToJson(
      this,
    );
  }
}

abstract class _VendorLoginEntityDtos extends VendorLoginEntityDtos {
  factory _VendorLoginEntityDtos(
          {required final String vendor,
          required final Map<String, dynamic> credentials}) =
      _$VendorLoginEntityDtosImpl;
  _VendorLoginEntityDtos._() : super._();

  factory _VendorLoginEntityDtos.fromJson(Map<String, dynamic> json) =
      _$VendorLoginEntityDtosImpl.fromJson;

// @JsonKey(ignore: true)
  @override
  String get vendor;
  @override
  Map<String, dynamic> get credentials;

  /// Create a copy of VendorLoginEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorLoginEntityDtosImplCopyWith<_$VendorLoginEntityDtosImpl>
      get copyWith => throw _privateConstructorUsedError;
}
