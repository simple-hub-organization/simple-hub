// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ValueFailure<T> {
  AuthValueFailure<T> get f => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthValueFailure<T> f) auth,
    required TResult Function(AuthValueFailure<T> f) devices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthValueFailure<T> f)? auth,
    TResult? Function(AuthValueFailure<T> f)? devices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthValueFailure<T> f)? auth,
    TResult Function(AuthValueFailure<T> f)? devices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Auth<T> value) auth,
    required TResult Function(_Devices<T> value) devices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Auth<T> value)? auth,
    TResult? Function(_Devices<T> value)? devices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Auth<T> value)? auth,
    TResult Function(_Devices<T> value)? devices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
  @useResult
  $Res call({AuthValueFailure<T> f});

  $AuthValueFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = null,
  }) {
    return _then(_value.copyWith(
      f: null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as AuthValueFailure<T>,
    ) as $Val);
  }

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthValueFailureCopyWith<T, $Res> get f {
    return $AuthValueFailureCopyWith<T, $Res>(_value.f, (value) {
      return _then(_value.copyWith(f: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl<T> value, $Res Function(_$AuthImpl<T>) then) =
      __$$AuthImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({AuthValueFailure<T> f});

  @override
  $AuthValueFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class __$$AuthImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$AuthImpl<T>>
    implements _$$AuthImplCopyWith<T, $Res> {
  __$$AuthImplCopyWithImpl(
      _$AuthImpl<T> _value, $Res Function(_$AuthImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = null,
  }) {
    return _then(_$AuthImpl<T>(
      null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as AuthValueFailure<T>,
    ));
  }
}

/// @nodoc

class _$AuthImpl<T> implements _Auth<T> {
  const _$AuthImpl(this.f);

  @override
  final AuthValueFailure<T> f;

  @override
  String toString() {
    return 'ValueFailure<$T>.auth(f: $f)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl<T> &&
            (identical(other.f, f) || other.f == f));
  }

  @override
  int get hashCode => Object.hash(runtimeType, f);

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<T, _$AuthImpl<T>> get copyWith =>
      __$$AuthImplCopyWithImpl<T, _$AuthImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthValueFailure<T> f) auth,
    required TResult Function(AuthValueFailure<T> f) devices,
  }) {
    return auth(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthValueFailure<T> f)? auth,
    TResult? Function(AuthValueFailure<T> f)? devices,
  }) {
    return auth?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthValueFailure<T> f)? auth,
    TResult Function(AuthValueFailure<T> f)? devices,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Auth<T> value) auth,
    required TResult Function(_Devices<T> value) devices,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Auth<T> value)? auth,
    TResult? Function(_Devices<T> value)? devices,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Auth<T> value)? auth,
    TResult Function(_Devices<T> value)? devices,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _Auth<T> implements ValueFailure<T> {
  const factory _Auth(final AuthValueFailure<T> f) = _$AuthImpl<T>;

  @override
  AuthValueFailure<T> get f;

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthImplCopyWith<T, _$AuthImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DevicesImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$DevicesImplCopyWith(
          _$DevicesImpl<T> value, $Res Function(_$DevicesImpl<T>) then) =
      __$$DevicesImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({AuthValueFailure<T> f});

  @override
  $AuthValueFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class __$$DevicesImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$DevicesImpl<T>>
    implements _$$DevicesImplCopyWith<T, $Res> {
  __$$DevicesImplCopyWithImpl(
      _$DevicesImpl<T> _value, $Res Function(_$DevicesImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = null,
  }) {
    return _then(_$DevicesImpl<T>(
      null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as AuthValueFailure<T>,
    ));
  }
}

/// @nodoc

class _$DevicesImpl<T> implements _Devices<T> {
  const _$DevicesImpl(this.f);

  @override
  final AuthValueFailure<T> f;

  @override
  String toString() {
    return 'ValueFailure<$T>.devices(f: $f)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicesImpl<T> &&
            (identical(other.f, f) || other.f == f));
  }

  @override
  int get hashCode => Object.hash(runtimeType, f);

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicesImplCopyWith<T, _$DevicesImpl<T>> get copyWith =>
      __$$DevicesImplCopyWithImpl<T, _$DevicesImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthValueFailure<T> f) auth,
    required TResult Function(AuthValueFailure<T> f) devices,
  }) {
    return devices(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthValueFailure<T> f)? auth,
    TResult? Function(AuthValueFailure<T> f)? devices,
  }) {
    return devices?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthValueFailure<T> f)? auth,
    TResult Function(AuthValueFailure<T> f)? devices,
    required TResult orElse(),
  }) {
    if (devices != null) {
      return devices(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Auth<T> value) auth,
    required TResult Function(_Devices<T> value) devices,
  }) {
    return devices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Auth<T> value)? auth,
    TResult? Function(_Devices<T> value)? devices,
  }) {
    return devices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Auth<T> value)? auth,
    TResult Function(_Devices<T> value)? devices,
    required TResult orElse(),
  }) {
    if (devices != null) {
      return devices(this);
    }
    return orElse();
  }
}

abstract class _Devices<T> implements ValueFailure<T> {
  const factory _Devices(final AuthValueFailure<T> f) = _$DevicesImpl<T>;

  @override
  AuthValueFailure<T> get f;

  /// Create a copy of ValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevicesImplCopyWith<T, _$DevicesImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthValueFailure<T> {
  Object? get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthValueFailureCopyWith<T, $Res> {
  factory $AuthValueFailureCopyWith(
          AuthValueFailure<T> value, $Res Function(AuthValueFailure<T>) then) =
      _$AuthValueFailureCopyWithImpl<T, $Res, AuthValueFailure<T>>;
}

/// @nodoc
class _$AuthValueFailureCopyWithImpl<T, $Res, $Val extends AuthValueFailure<T>>
    implements $AuthValueFailureCopyWith<T, $Res> {
  _$AuthValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InvalidEmailImplCopyWith<T, $Res> {
  factory _$$InvalidEmailImplCopyWith(_$InvalidEmailImpl<T> value,
          $Res Function(_$InvalidEmailImpl<T>) then) =
      __$$InvalidEmailImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$InvalidEmailImplCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res, _$InvalidEmailImpl<T>>
    implements _$$InvalidEmailImplCopyWith<T, $Res> {
  __$$InvalidEmailImplCopyWithImpl(
      _$InvalidEmailImpl<T> _value, $Res Function(_$InvalidEmailImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$InvalidEmailImpl<T>(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidEmailImpl<T> implements InvalidEmail<T> {
  const _$InvalidEmailImpl({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailImpl<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailImplCopyWith<T, _$InvalidEmailImpl<T>> get copyWith =>
      __$$InvalidEmailImplCopyWithImpl<T, _$InvalidEmailImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements AuthValueFailure<T> {
  const factory InvalidEmail({required final String failedValue}) =
      _$InvalidEmailImpl<T>;

  @override
  String get failedValue;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidEmailImplCopyWith<T, _$InvalidEmailImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidPasswordImplCopyWith<T, $Res> {
  factory _$$InvalidPasswordImplCopyWith(_$InvalidPasswordImpl<T> value,
          $Res Function(_$InvalidPasswordImpl<T>) then) =
      __$$InvalidPasswordImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$InvalidPasswordImplCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res, _$InvalidPasswordImpl<T>>
    implements _$$InvalidPasswordImplCopyWith<T, $Res> {
  __$$InvalidPasswordImplCopyWithImpl(_$InvalidPasswordImpl<T> _value,
      $Res Function(_$InvalidPasswordImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$InvalidPasswordImpl<T>(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidPasswordImpl<T> implements InvalidPassword<T> {
  const _$InvalidPasswordImpl({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.invalidPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPasswordImpl<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidPasswordImplCopyWith<T, _$InvalidPasswordImpl<T>> get copyWith =>
      __$$InvalidPasswordImplCopyWithImpl<T, _$InvalidPasswordImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) {
    return invalidPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) {
    return invalidPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPassword<T> implements AuthValueFailure<T> {
  const factory InvalidPassword({required final String failedValue}) =
      _$InvalidPasswordImpl<T>;

  @override
  String get failedValue;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidPasswordImplCopyWith<T, _$InvalidPasswordImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordImplCopyWith<T, $Res> {
  factory _$$ShortPasswordImplCopyWith(_$ShortPasswordImpl<T> value,
          $Res Function(_$ShortPasswordImpl<T>) then) =
      __$$ShortPasswordImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$ShortPasswordImplCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res, _$ShortPasswordImpl<T>>
    implements _$$ShortPasswordImplCopyWith<T, $Res> {
  __$$ShortPasswordImplCopyWithImpl(_$ShortPasswordImpl<T> _value,
      $Res Function(_$ShortPasswordImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$ShortPasswordImpl<T>(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShortPasswordImpl<T> implements ShortPassword<T> {
  const _$ShortPasswordImpl({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPasswordImpl<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortPasswordImplCopyWith<T, _$ShortPasswordImpl<T>> get copyWith =>
      __$$ShortPasswordImplCopyWithImpl<T, _$ShortPasswordImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements AuthValueFailure<T> {
  const factory ShortPassword({required final String failedValue}) =
      _$ShortPasswordImpl<T>;

  @override
  String get failedValue;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShortPasswordImplCopyWith<T, _$ShortPasswordImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContainsSpaceImplCopyWith<T, $Res> {
  factory _$$ContainsSpaceImplCopyWith(_$ContainsSpaceImpl<T> value,
          $Res Function(_$ContainsSpaceImpl<T>) then) =
      __$$ContainsSpaceImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$ContainsSpaceImplCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res, _$ContainsSpaceImpl<T>>
    implements _$$ContainsSpaceImplCopyWith<T, $Res> {
  __$$ContainsSpaceImplCopyWithImpl(_$ContainsSpaceImpl<T> _value,
      $Res Function(_$ContainsSpaceImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$ContainsSpaceImpl<T>(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContainsSpaceImpl<T> implements ContainsSpace<T> {
  const _$ContainsSpaceImpl({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.containsSpace(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContainsSpaceImpl<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContainsSpaceImplCopyWith<T, _$ContainsSpaceImpl<T>> get copyWith =>
      __$$ContainsSpaceImplCopyWithImpl<T, _$ContainsSpaceImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) {
    return containsSpace(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) {
    return containsSpace?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
    required TResult orElse(),
  }) {
    if (containsSpace != null) {
      return containsSpace(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return containsSpace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) {
    return containsSpace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (containsSpace != null) {
      return containsSpace(this);
    }
    return orElse();
  }
}

abstract class ContainsSpace<T> implements AuthValueFailure<T> {
  const factory ContainsSpace({required final String failedValue}) =
      _$ContainsSpaceImpl<T>;

  @override
  String get failedValue;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContainsSpaceImplCopyWith<T, _$ContainsSpaceImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T> value, $Res Function(_$EmptyImpl<T>) then) =
      __$$EmptyImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res, _$EmptyImpl<T>>
    implements _$$EmptyImplCopyWith<T, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T> _value, $Res Function(_$EmptyImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$EmptyImpl<T>(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyImpl<T> implements Empty<T> {
  const _$EmptyImpl({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyImpl<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      __$$EmptyImplCopyWithImpl<T, _$EmptyImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
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
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements AuthValueFailure<T> {
  const factory Empty({required final String failedValue}) = _$EmptyImpl<T>;

  @override
  String get failedValue;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListTooLongImplCopyWith<T, $Res> {
  factory _$$ListTooLongImplCopyWith(_$ListTooLongImpl<T> value,
          $Res Function(_$ListTooLongImpl<T>) then) =
      __$$ListTooLongImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T failedValue, int max});
}

/// @nodoc
class __$$ListTooLongImplCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res, _$ListTooLongImpl<T>>
    implements _$$ListTooLongImplCopyWith<T, $Res> {
  __$$ListTooLongImplCopyWithImpl(
      _$ListTooLongImpl<T> _value, $Res Function(_$ListTooLongImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
    Object? max = null,
  }) {
    return _then(_$ListTooLongImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListTooLongImpl<T> implements ListTooLong<T> {
  const _$ListTooLongImpl({required this.failedValue, required this.max});

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.listTooLong(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTooLongImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue), max);

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTooLongImplCopyWith<T, _$ListTooLongImpl<T>> get copyWith =>
      __$$ListTooLongImplCopyWithImpl<T, _$ListTooLongImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) containsSpace,
    required TResult Function(String failedValue) empty,
    required TResult Function(T failedValue, int max) listTooLong,
  }) {
    return listTooLong(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidEmail,
    TResult? Function(String failedValue)? invalidPassword,
    TResult? Function(String failedValue)? shortPassword,
    TResult? Function(String failedValue)? containsSpace,
    TResult? Function(String failedValue)? empty,
    TResult? Function(T failedValue, int max)? listTooLong,
  }) {
    return listTooLong?.call(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? containsSpace,
    TResult Function(String failedValue)? empty,
    TResult Function(T failedValue, int max)? listTooLong,
    required TResult orElse(),
  }) {
    if (listTooLong != null) {
      return listTooLong(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ContainsSpace<T> value) containsSpace,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return listTooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidPassword<T> value)? invalidPassword,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ContainsSpace<T> value)? containsSpace,
    TResult? Function(Empty<T> value)? empty,
    TResult? Function(ListTooLong<T> value)? listTooLong,
  }) {
    return listTooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ContainsSpace<T> value)? containsSpace,
    TResult Function(Empty<T> value)? empty,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (listTooLong != null) {
      return listTooLong(this);
    }
    return orElse();
  }
}

abstract class ListTooLong<T> implements AuthValueFailure<T> {
  const factory ListTooLong(
      {required final T failedValue,
      required final int max}) = _$ListTooLongImpl<T>;

  @override
  T get failedValue;
  int get max;

  /// Create a copy of AuthValueFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListTooLongImplCopyWith<T, _$ListTooLongImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
