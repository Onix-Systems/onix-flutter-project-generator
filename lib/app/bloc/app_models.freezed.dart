// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  ThemeMode get mode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode mode) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode mode)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeThemeEvent value) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeThemeEvent value)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeThemeEvent value)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppEventCopyWith<AppEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
  @useResult
  $Res call({ThemeMode mode});
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeThemeEventImplCopyWith<$Res>
    implements $AppEventCopyWith<$Res> {
  factory _$$ChangeThemeEventImplCopyWith(_$ChangeThemeEventImpl value,
          $Res Function(_$ChangeThemeEventImpl) then) =
      __$$ChangeThemeEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode mode});
}

/// @nodoc
class __$$ChangeThemeEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ChangeThemeEventImpl>
    implements _$$ChangeThemeEventImplCopyWith<$Res> {
  __$$ChangeThemeEventImplCopyWithImpl(_$ChangeThemeEventImpl _value,
      $Res Function(_$ChangeThemeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$ChangeThemeEventImpl(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$ChangeThemeEventImpl implements ChangeThemeEvent {
  const _$ChangeThemeEventImpl(this.mode);

  @override
  final ThemeMode mode;

  @override
  String toString() {
    return 'AppEvent.changeTheme(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeEventImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeEventImplCopyWith<_$ChangeThemeEventImpl> get copyWith =>
      __$$ChangeThemeEventImplCopyWithImpl<_$ChangeThemeEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode mode) changeTheme,
  }) {
    return changeTheme(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode mode)? changeTheme,
  }) {
    return changeTheme?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeThemeEvent value) changeTheme,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeThemeEvent value)? changeTheme,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeThemeEvent value)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class ChangeThemeEvent implements AppEvent {
  const factory ChangeThemeEvent(final ThemeMode mode) = _$ChangeThemeEventImpl;

  @override
  ThemeMode get mode;
  @override
  @JsonKey(ignore: true)
  _$$ChangeThemeEventImplCopyWith<_$ChangeThemeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppScreenState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppScreenStateCopyWith<AppScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppScreenStateCopyWith<$Res> {
  factory $AppScreenStateCopyWith(
          AppScreenState value, $Res Function(AppScreenState) then) =
      _$AppScreenStateCopyWithImpl<$Res, AppScreenState>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$AppScreenStateCopyWithImpl<$Res, $Val extends AppScreenState>
    implements $AppScreenStateCopyWith<$Res> {
  _$AppScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppScreenStateImplCopyWith<$Res>
    implements $AppScreenStateCopyWith<$Res> {
  factory _$$AppScreenStateImplCopyWith(_$AppScreenStateImpl value,
          $Res Function(_$AppScreenStateImpl) then) =
      __$$AppScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$AppScreenStateImplCopyWithImpl<$Res>
    extends _$AppScreenStateCopyWithImpl<$Res, _$AppScreenStateImpl>
    implements _$$AppScreenStateImplCopyWith<$Res> {
  __$$AppScreenStateImplCopyWithImpl(
      _$AppScreenStateImpl _value, $Res Function(_$AppScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$AppScreenStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$AppScreenStateImpl implements _AppScreenState {
  const _$AppScreenStateImpl({required this.themeMode});

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'AppScreenState(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppScreenStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppScreenStateImplCopyWith<_$AppScreenStateImpl> get copyWith =>
      __$$AppScreenStateImplCopyWithImpl<_$AppScreenStateImpl>(
          this, _$identity);
}

abstract class _AppScreenState implements AppScreenState {
  const factory _AppScreenState({required final ThemeMode themeMode}) =
      _$AppScreenStateImpl;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$AppScreenStateImplCopyWith<_$AppScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
