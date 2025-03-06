// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_entity_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AreaEntityDtos _$AreaEntityDtosFromJson(Map<String, dynamic> json) {
  return _AreaEntityDtos.fromJson(json);
}

/// @nodoc
mixin _$AreaEntityDtos {
  String get uniqueId => throw _privateConstructorUsedError;
  String get cbjEntityName => throw _privateConstructorUsedError;
  String get background => throw _privateConstructorUsedError;
  Set<String> get areaTypes => throw _privateConstructorUsedError;
  Set<String> get areaDevicesId => throw _privateConstructorUsedError;
  Set<String> get areaScenesId => throw _privateConstructorUsedError;
  Set<String> get areaRoutinesId => throw _privateConstructorUsedError;
  Set<String> get areaBindingsId => throw _privateConstructorUsedError;

  /// Who is using this area
  Set<String> get areaMostUsedBy => throw _privateConstructorUsedError;

  /// Area permissions by users id
  Set<String> get areaPermissions => throw _privateConstructorUsedError;

  /// Serializes this AreaEntityDtos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AreaEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaEntityDtosCopyWith<AreaEntityDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaEntityDtosCopyWith<$Res> {
  factory $AreaEntityDtosCopyWith(
          AreaEntityDtos value, $Res Function(AreaEntityDtos) then) =
      _$AreaEntityDtosCopyWithImpl<$Res, AreaEntityDtos>;
  @useResult
  $Res call(
      {String uniqueId,
      String cbjEntityName,
      String background,
      Set<String> areaTypes,
      Set<String> areaDevicesId,
      Set<String> areaScenesId,
      Set<String> areaRoutinesId,
      Set<String> areaBindingsId,
      Set<String> areaMostUsedBy,
      Set<String> areaPermissions});
}

/// @nodoc
class _$AreaEntityDtosCopyWithImpl<$Res, $Val extends AreaEntityDtos>
    implements $AreaEntityDtosCopyWith<$Res> {
  _$AreaEntityDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreaEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? cbjEntityName = null,
    Object? background = null,
    Object? areaTypes = null,
    Object? areaDevicesId = null,
    Object? areaScenesId = null,
    Object? areaRoutinesId = null,
    Object? areaBindingsId = null,
    Object? areaMostUsedBy = null,
    Object? areaPermissions = null,
  }) {
    return _then(_value.copyWith(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      cbjEntityName: null == cbjEntityName
          ? _value.cbjEntityName
          : cbjEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
      areaTypes: null == areaTypes
          ? _value.areaTypes
          : areaTypes // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaDevicesId: null == areaDevicesId
          ? _value.areaDevicesId
          : areaDevicesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaScenesId: null == areaScenesId
          ? _value.areaScenesId
          : areaScenesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaRoutinesId: null == areaRoutinesId
          ? _value.areaRoutinesId
          : areaRoutinesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaBindingsId: null == areaBindingsId
          ? _value.areaBindingsId
          : areaBindingsId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaMostUsedBy: null == areaMostUsedBy
          ? _value.areaMostUsedBy
          : areaMostUsedBy // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaPermissions: null == areaPermissions
          ? _value.areaPermissions
          : areaPermissions // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AreaEntityDtosImplCopyWith<$Res>
    implements $AreaEntityDtosCopyWith<$Res> {
  factory _$$AreaEntityDtosImplCopyWith(_$AreaEntityDtosImpl value,
          $Res Function(_$AreaEntityDtosImpl) then) =
      __$$AreaEntityDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uniqueId,
      String cbjEntityName,
      String background,
      Set<String> areaTypes,
      Set<String> areaDevicesId,
      Set<String> areaScenesId,
      Set<String> areaRoutinesId,
      Set<String> areaBindingsId,
      Set<String> areaMostUsedBy,
      Set<String> areaPermissions});
}

/// @nodoc
class __$$AreaEntityDtosImplCopyWithImpl<$Res>
    extends _$AreaEntityDtosCopyWithImpl<$Res, _$AreaEntityDtosImpl>
    implements _$$AreaEntityDtosImplCopyWith<$Res> {
  __$$AreaEntityDtosImplCopyWithImpl(
      _$AreaEntityDtosImpl _value, $Res Function(_$AreaEntityDtosImpl) _then)
      : super(_value, _then);

  /// Create a copy of AreaEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? cbjEntityName = null,
    Object? background = null,
    Object? areaTypes = null,
    Object? areaDevicesId = null,
    Object? areaScenesId = null,
    Object? areaRoutinesId = null,
    Object? areaBindingsId = null,
    Object? areaMostUsedBy = null,
    Object? areaPermissions = null,
  }) {
    return _then(_$AreaEntityDtosImpl(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      cbjEntityName: null == cbjEntityName
          ? _value.cbjEntityName
          : cbjEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
      areaTypes: null == areaTypes
          ? _value._areaTypes
          : areaTypes // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaDevicesId: null == areaDevicesId
          ? _value._areaDevicesId
          : areaDevicesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaScenesId: null == areaScenesId
          ? _value._areaScenesId
          : areaScenesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaRoutinesId: null == areaRoutinesId
          ? _value._areaRoutinesId
          : areaRoutinesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaBindingsId: null == areaBindingsId
          ? _value._areaBindingsId
          : areaBindingsId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaMostUsedBy: null == areaMostUsedBy
          ? _value._areaMostUsedBy
          : areaMostUsedBy // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      areaPermissions: null == areaPermissions
          ? _value._areaPermissions
          : areaPermissions // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaEntityDtosImpl extends _AreaEntityDtos {
  _$AreaEntityDtosImpl(
      {required this.uniqueId,
      required this.cbjEntityName,
      required this.background,
      required final Set<String> areaTypes,
      required final Set<String> areaDevicesId,
      required final Set<String> areaScenesId,
      required final Set<String> areaRoutinesId,
      required final Set<String> areaBindingsId,
      required final Set<String> areaMostUsedBy,
      required final Set<String> areaPermissions})
      : _areaTypes = areaTypes,
        _areaDevicesId = areaDevicesId,
        _areaScenesId = areaScenesId,
        _areaRoutinesId = areaRoutinesId,
        _areaBindingsId = areaBindingsId,
        _areaMostUsedBy = areaMostUsedBy,
        _areaPermissions = areaPermissions,
        super._();

  factory _$AreaEntityDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaEntityDtosImplFromJson(json);

  @override
  final String uniqueId;
  @override
  final String cbjEntityName;
  @override
  final String background;
  final Set<String> _areaTypes;
  @override
  Set<String> get areaTypes {
    if (_areaTypes is EqualUnmodifiableSetView) return _areaTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaTypes);
  }

  final Set<String> _areaDevicesId;
  @override
  Set<String> get areaDevicesId {
    if (_areaDevicesId is EqualUnmodifiableSetView) return _areaDevicesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaDevicesId);
  }

  final Set<String> _areaScenesId;
  @override
  Set<String> get areaScenesId {
    if (_areaScenesId is EqualUnmodifiableSetView) return _areaScenesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaScenesId);
  }

  final Set<String> _areaRoutinesId;
  @override
  Set<String> get areaRoutinesId {
    if (_areaRoutinesId is EqualUnmodifiableSetView) return _areaRoutinesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaRoutinesId);
  }

  final Set<String> _areaBindingsId;
  @override
  Set<String> get areaBindingsId {
    if (_areaBindingsId is EqualUnmodifiableSetView) return _areaBindingsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaBindingsId);
  }

  /// Who is using this area
  final Set<String> _areaMostUsedBy;

  /// Who is using this area
  @override
  Set<String> get areaMostUsedBy {
    if (_areaMostUsedBy is EqualUnmodifiableSetView) return _areaMostUsedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaMostUsedBy);
  }

  /// Area permissions by users id
  final Set<String> _areaPermissions;

  /// Area permissions by users id
  @override
  Set<String> get areaPermissions {
    if (_areaPermissions is EqualUnmodifiableSetView) return _areaPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_areaPermissions);
  }

  @override
  String toString() {
    return 'AreaEntityDtos(uniqueId: $uniqueId, cbjEntityName: $cbjEntityName, background: $background, areaTypes: $areaTypes, areaDevicesId: $areaDevicesId, areaScenesId: $areaScenesId, areaRoutinesId: $areaRoutinesId, areaBindingsId: $areaBindingsId, areaMostUsedBy: $areaMostUsedBy, areaPermissions: $areaPermissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaEntityDtosImpl &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.cbjEntityName, cbjEntityName) ||
                other.cbjEntityName == cbjEntityName) &&
            (identical(other.background, background) ||
                other.background == background) &&
            const DeepCollectionEquality()
                .equals(other._areaTypes, _areaTypes) &&
            const DeepCollectionEquality()
                .equals(other._areaDevicesId, _areaDevicesId) &&
            const DeepCollectionEquality()
                .equals(other._areaScenesId, _areaScenesId) &&
            const DeepCollectionEquality()
                .equals(other._areaRoutinesId, _areaRoutinesId) &&
            const DeepCollectionEquality()
                .equals(other._areaBindingsId, _areaBindingsId) &&
            const DeepCollectionEquality()
                .equals(other._areaMostUsedBy, _areaMostUsedBy) &&
            const DeepCollectionEquality()
                .equals(other._areaPermissions, _areaPermissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uniqueId,
      cbjEntityName,
      background,
      const DeepCollectionEquality().hash(_areaTypes),
      const DeepCollectionEquality().hash(_areaDevicesId),
      const DeepCollectionEquality().hash(_areaScenesId),
      const DeepCollectionEquality().hash(_areaRoutinesId),
      const DeepCollectionEquality().hash(_areaBindingsId),
      const DeepCollectionEquality().hash(_areaMostUsedBy),
      const DeepCollectionEquality().hash(_areaPermissions));

  /// Create a copy of AreaEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaEntityDtosImplCopyWith<_$AreaEntityDtosImpl> get copyWith =>
      __$$AreaEntityDtosImplCopyWithImpl<_$AreaEntityDtosImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaEntityDtosImplToJson(
      this,
    );
  }
}

abstract class _AreaEntityDtos extends AreaEntityDtos {
  factory _AreaEntityDtos(
      {required final String uniqueId,
      required final String cbjEntityName,
      required final String background,
      required final Set<String> areaTypes,
      required final Set<String> areaDevicesId,
      required final Set<String> areaScenesId,
      required final Set<String> areaRoutinesId,
      required final Set<String> areaBindingsId,
      required final Set<String> areaMostUsedBy,
      required final Set<String> areaPermissions}) = _$AreaEntityDtosImpl;
  _AreaEntityDtos._() : super._();

  factory _AreaEntityDtos.fromJson(Map<String, dynamic> json) =
      _$AreaEntityDtosImpl.fromJson;

  @override
  String get uniqueId;
  @override
  String get cbjEntityName;
  @override
  String get background;
  @override
  Set<String> get areaTypes;
  @override
  Set<String> get areaDevicesId;
  @override
  Set<String> get areaScenesId;
  @override
  Set<String> get areaRoutinesId;
  @override
  Set<String> get areaBindingsId;

  /// Who is using this area
  @override
  Set<String> get areaMostUsedBy;

  /// Area permissions by users id
  @override
  Set<String> get areaPermissions;

  /// Create a copy of AreaEntityDtos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaEntityDtosImplCopyWith<_$AreaEntityDtosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
