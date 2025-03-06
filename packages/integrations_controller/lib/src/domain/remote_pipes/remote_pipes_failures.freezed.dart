// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_pipes_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemotePipesFailures<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemotePipesFailuresCopyWith<T, $Res> {
  factory $RemotePipesFailuresCopyWith(RemotePipesFailures<T> value,
          $Res Function(RemotePipesFailures<T>) then) =
      _$RemotePipesFailuresCopyWithImpl<T, $Res, RemotePipesFailures<T>>;
}

/// @nodoc
class _$RemotePipesFailuresCopyWithImpl<T, $Res,
        $Val extends RemotePipesFailures<T>>
    implements $RemotePipesFailuresCopyWith<T, $Res> {
  _$RemotePipesFailuresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T> value, $Res Function(_$EmptyImpl<T>) then) =
      __$$EmptyImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, $Res>
    extends _$RemotePipesFailuresCopyWithImpl<T, $Res, _$EmptyImpl<T>>
    implements _$$EmptyImplCopyWith<T, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T> _value, $Res Function(_$EmptyImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmptyImpl<T> implements _Empty<T> {
  const _$EmptyImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'RemotePipesFailures<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      __$$EmptyImplCopyWithImpl<T, _$EmptyImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements RemotePipesFailures<T> {
  const factory _Empty({required final T failedValue}) = _$EmptyImpl<T>;

  T get failedValue;

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<T, $Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl<T> value, $Res Function(_$UnexpectedImpl<T>) then) =
      __$$UnexpectedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<T, $Res>
    extends _$RemotePipesFailuresCopyWithImpl<T, $Res, _$UnexpectedImpl<T>>
    implements _$$UnexpectedImplCopyWith<T, $Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl<T> _value, $Res Function(_$UnexpectedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnexpectedImpl<T> implements _Unexpected<T> {
  const _$UnexpectedImpl();

  @override
  String toString() {
    return 'RemotePipesFailures<$T>.unexpected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected<T> implements RemotePipesFailures<T> {
  const factory _Unexpected() = _$UnexpectedImpl<T>;
}

/// @nodoc
abstract class _$$InsufficientPermissionImplCopyWith<T, $Res> {
  factory _$$InsufficientPermissionImplCopyWith(
          _$InsufficientPermissionImpl<T> value,
          $Res Function(_$InsufficientPermissionImpl<T>) then) =
      __$$InsufficientPermissionImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InsufficientPermissionImplCopyWithImpl<T, $Res>
    extends _$RemotePipesFailuresCopyWithImpl<T, $Res,
        _$InsufficientPermissionImpl<T>>
    implements _$$InsufficientPermissionImplCopyWith<T, $Res> {
  __$$InsufficientPermissionImplCopyWithImpl(
      _$InsufficientPermissionImpl<T> _value,
      $Res Function(_$InsufficientPermissionImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InsufficientPermissionImpl<T> implements _InsufficientPermission<T> {
  const _$InsufficientPermissionImpl();

  @override
  String toString() {
    return 'RemotePipesFailures<$T>.insufficientPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsufficientPermissionImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return insufficientPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return insufficientPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return insufficientPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return insufficientPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission(this);
    }
    return orElse();
  }
}

abstract class _InsufficientPermission<T> implements RemotePipesFailures<T> {
  const factory _InsufficientPermission() = _$InsufficientPermissionImpl<T>;
}

/// @nodoc
abstract class _$$UnableToUpdateImplCopyWith<T, $Res> {
  factory _$$UnableToUpdateImplCopyWith(_$UnableToUpdateImpl<T> value,
          $Res Function(_$UnableToUpdateImpl<T>) then) =
      __$$UnableToUpdateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnableToUpdateImplCopyWithImpl<T, $Res>
    extends _$RemotePipesFailuresCopyWithImpl<T, $Res, _$UnableToUpdateImpl<T>>
    implements _$$UnableToUpdateImplCopyWith<T, $Res> {
  __$$UnableToUpdateImplCopyWithImpl(_$UnableToUpdateImpl<T> _value,
      $Res Function(_$UnableToUpdateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemotePipesFailures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnableToUpdateImpl<T> implements _UnableToUpdate<T> {
  const _$UnableToUpdateImpl();

  @override
  String toString() {
    return 'RemotePipesFailures<$T>.unableToUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnableToUpdateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return unableToUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return unableToUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate(this);
    }
    return orElse();
  }
}

abstract class _UnableToUpdate<T> implements RemotePipesFailures<T> {
  const factory _UnableToUpdate() = _$UnableToUpdateImpl<T>;
}
