// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_home_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewHomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(double scrollPosition, int currentPage)
        scrollPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(double scrollPosition, int currentPage)? scrollPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(double scrollPosition, int currentPage)? scrollPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ScrollPage value) scrollPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ScrollPage value)? scrollPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ScrollPage value)? scrollPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewHomePageEventCopyWith<$Res> {
  factory $NewHomePageEventCopyWith(
          NewHomePageEvent value, $Res Function(NewHomePageEvent) then) =
      _$NewHomePageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewHomePageEventCopyWithImpl<$Res>
    implements $NewHomePageEventCopyWith<$Res> {
  _$NewHomePageEventCopyWithImpl(this._value, this._then);

  final NewHomePageEvent _value;
  // ignore: unused_field
  final $Res Function(NewHomePageEvent) _then;
}

/// @nodoc
abstract class _$$InitializedCopyWith<$Res> {
  factory _$$InitializedCopyWith(
          _$Initialized value, $Res Function(_$Initialized) then) =
      __$$InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedCopyWithImpl<$Res>
    extends _$NewHomePageEventCopyWithImpl<$Res>
    implements _$$InitializedCopyWith<$Res> {
  __$$InitializedCopyWithImpl(
      _$Initialized _value, $Res Function(_$Initialized) _then)
      : super(_value, (v) => _then(v as _$Initialized));

  @override
  _$Initialized get _value => super._value as _$Initialized;
}

/// @nodoc

class _$Initialized implements Initialized {
  const _$Initialized();

  @override
  String toString() {
    return 'NewHomePageEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(double scrollPosition, int currentPage)
        scrollPage,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(double scrollPosition, int currentPage)? scrollPage,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(double scrollPosition, int currentPage)? scrollPage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ScrollPage value) scrollPage,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ScrollPage value)? scrollPage,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ScrollPage value)? scrollPage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized implements NewHomePageEvent {
  const factory Initialized() = _$Initialized;
}

/// @nodoc
abstract class _$$ScrollPageCopyWith<$Res> {
  factory _$$ScrollPageCopyWith(
          _$ScrollPage value, $Res Function(_$ScrollPage) then) =
      __$$ScrollPageCopyWithImpl<$Res>;
  $Res call({double scrollPosition, int currentPage});
}

/// @nodoc
class __$$ScrollPageCopyWithImpl<$Res>
    extends _$NewHomePageEventCopyWithImpl<$Res>
    implements _$$ScrollPageCopyWith<$Res> {
  __$$ScrollPageCopyWithImpl(
      _$ScrollPage _value, $Res Function(_$ScrollPage) _then)
      : super(_value, (v) => _then(v as _$ScrollPage));

  @override
  _$ScrollPage get _value => super._value as _$ScrollPage;

  @override
  $Res call({
    Object? scrollPosition = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_$ScrollPage(
      scrollPosition == freezed
          ? _value.scrollPosition
          : scrollPosition // ignore: cast_nullable_to_non_nullable
              as double,
      currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ScrollPage implements ScrollPage {
  const _$ScrollPage(this.scrollPosition, this.currentPage);

  @override
  final double scrollPosition;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'NewHomePageEvent.scrollPage(scrollPosition: $scrollPosition, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollPage &&
            const DeepCollectionEquality()
                .equals(other.scrollPosition, scrollPosition) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scrollPosition),
      const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$$ScrollPageCopyWith<_$ScrollPage> get copyWith =>
      __$$ScrollPageCopyWithImpl<_$ScrollPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(double scrollPosition, int currentPage)
        scrollPage,
  }) {
    return scrollPage(scrollPosition, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(double scrollPosition, int currentPage)? scrollPage,
  }) {
    return scrollPage?.call(scrollPosition, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(double scrollPosition, int currentPage)? scrollPage,
    required TResult orElse(),
  }) {
    if (scrollPage != null) {
      return scrollPage(scrollPosition, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ScrollPage value) scrollPage,
  }) {
    return scrollPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ScrollPage value)? scrollPage,
  }) {
    return scrollPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ScrollPage value)? scrollPage,
    required TResult orElse(),
  }) {
    if (scrollPage != null) {
      return scrollPage(this);
    }
    return orElse();
  }
}

abstract class ScrollPage implements NewHomePageEvent {
  const factory ScrollPage(final double scrollPosition, final int currentPage) =
      _$ScrollPage;

  double get scrollPosition;
  int get currentPage;
  @JsonKey(ignore: true)
  _$$ScrollPageCopyWith<_$ScrollPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewHomePageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(double scrollPosition, int currentPage) loading,
    required TResult Function(double scrollPosition, int currentPage) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewHomePageState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewHomePageStateCopyWith<$Res> {
  factory $NewHomePageStateCopyWith(
          NewHomePageState value, $Res Function(NewHomePageState) then) =
      _$NewHomePageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewHomePageStateCopyWithImpl<$Res>
    implements $NewHomePageStateCopyWith<$Res> {
  _$NewHomePageStateCopyWithImpl(this._value, this._then);

  final NewHomePageState _value;
  // ignore: unused_field
  final $Res Function(NewHomePageState) _then;
}

/// @nodoc
abstract class _$$_NewHomePageStateCopyWith<$Res> {
  factory _$$_NewHomePageStateCopyWith(
          _$_NewHomePageState value, $Res Function(_$_NewHomePageState) then) =
      __$$_NewHomePageStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NewHomePageStateCopyWithImpl<$Res>
    extends _$NewHomePageStateCopyWithImpl<$Res>
    implements _$$_NewHomePageStateCopyWith<$Res> {
  __$$_NewHomePageStateCopyWithImpl(
      _$_NewHomePageState _value, $Res Function(_$_NewHomePageState) _then)
      : super(_value, (v) => _then(v as _$_NewHomePageState));

  @override
  _$_NewHomePageState get _value => super._value as _$_NewHomePageState;
}

/// @nodoc

class _$_NewHomePageState implements _NewHomePageState {
  const _$_NewHomePageState();

  @override
  String toString() {
    return 'NewHomePageState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NewHomePageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(double scrollPosition, int currentPage) loading,
    required TResult Function(double scrollPosition, int currentPage) loaded,
    required TResult Function() error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewHomePageState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _NewHomePageState implements NewHomePageState {
  const factory _NewHomePageState() = _$_NewHomePageState;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
  $Res call({double scrollPosition, int currentPage});
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$NewHomePageStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;

  @override
  $Res call({
    Object? scrollPosition = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_$Loading(
      scrollPosition == freezed
          ? _value.scrollPosition
          : scrollPosition // ignore: cast_nullable_to_non_nullable
              as double,
      currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading(this.scrollPosition, this.currentPage);

  @override
  final double scrollPosition;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'NewHomePageState.loading(scrollPosition: $scrollPosition, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading &&
            const DeepCollectionEquality()
                .equals(other.scrollPosition, scrollPosition) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scrollPosition),
      const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      __$$LoadingCopyWithImpl<_$Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(double scrollPosition, int currentPage) loading,
    required TResult Function(double scrollPosition, int currentPage) loaded,
    required TResult Function() error,
  }) {
    return loading(scrollPosition, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
  }) {
    return loading?.call(scrollPosition, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(scrollPosition, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewHomePageState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements NewHomePageState {
  const factory Loading(final double scrollPosition, final int currentPage) =
      _$Loading;

  double get scrollPosition;
  int get currentPage;
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCopyWith<$Res> {
  factory _$$LoadedCopyWith(_$Loaded value, $Res Function(_$Loaded) then) =
      __$$LoadedCopyWithImpl<$Res>;
  $Res call({double scrollPosition, int currentPage});
}

/// @nodoc
class __$$LoadedCopyWithImpl<$Res> extends _$NewHomePageStateCopyWithImpl<$Res>
    implements _$$LoadedCopyWith<$Res> {
  __$$LoadedCopyWithImpl(_$Loaded _value, $Res Function(_$Loaded) _then)
      : super(_value, (v) => _then(v as _$Loaded));

  @override
  _$Loaded get _value => super._value as _$Loaded;

  @override
  $Res call({
    Object? scrollPosition = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_$Loaded(
      scrollPosition == freezed
          ? _value.scrollPosition
          : scrollPosition // ignore: cast_nullable_to_non_nullable
              as double,
      currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(this.scrollPosition, this.currentPage);

  @override
  final double scrollPosition;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'NewHomePageState.loaded(scrollPosition: $scrollPosition, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded &&
            const DeepCollectionEquality()
                .equals(other.scrollPosition, scrollPosition) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scrollPosition),
      const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      __$$LoadedCopyWithImpl<_$Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(double scrollPosition, int currentPage) loading,
    required TResult Function(double scrollPosition, int currentPage) loaded,
    required TResult Function() error,
  }) {
    return loaded(scrollPosition, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call(scrollPosition, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(scrollPosition, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewHomePageState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements NewHomePageState {
  const factory Loaded(final double scrollPosition, final int currentPage) =
      _$Loaded;

  double get scrollPosition;
  int get currentPage;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$NewHomePageStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;
}

/// @nodoc

class _$Error implements Error {
  const _$Error();

  @override
  String toString() {
    return 'NewHomePageState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(double scrollPosition, int currentPage) loading,
    required TResult Function(double scrollPosition, int currentPage) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(double scrollPosition, int currentPage)? loading,
    TResult Function(double scrollPosition, int currentPage)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewHomePageState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewHomePageState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements NewHomePageState {
  const factory Error() = _$Error;
}
