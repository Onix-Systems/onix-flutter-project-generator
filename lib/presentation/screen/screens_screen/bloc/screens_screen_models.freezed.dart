// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screens_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScreensScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(Screen screen) onScreenDelete,
    required TResult Function() onScreenModify,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(Screen screen)? onScreenDelete,
    TResult? Function()? onScreenModify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(Screen screen)? onScreenDelete,
    TResult Function()? onScreenModify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenEventInit value) init,
    required TResult Function(ScreensScreenEventOnScreenAdd value) onScreenAdd,
    required TResult Function(ScreensScreenEventOnScreenDelete value)
        onScreenDelete,
    required TResult Function(ScreensScreenEventOnScreenModify value)
        onScreenModify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreensScreenEventCopyWith<$Res> {
  factory $ScreensScreenEventCopyWith(
          ScreensScreenEvent value, $Res Function(ScreensScreenEvent) then) =
      _$ScreensScreenEventCopyWithImpl<$Res, ScreensScreenEvent>;
}

/// @nodoc
class _$ScreensScreenEventCopyWithImpl<$Res, $Val extends ScreensScreenEvent>
    implements $ScreensScreenEventCopyWith<$Res> {
  _$ScreensScreenEventCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScreensScreenEventInitCopyWith<$Res> {
  factory _$$ScreensScreenEventInitCopyWith(_$ScreensScreenEventInit value,
          $Res Function(_$ScreensScreenEventInit) then) =
      __$$ScreensScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ScreensScreenEventInitCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res, _$ScreensScreenEventInit>
    implements _$$ScreensScreenEventInitCopyWith<$Res> {
  __$$ScreensScreenEventInitCopyWithImpl(_$ScreensScreenEventInit _value,
      $Res Function(_$ScreensScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ScreensScreenEventInit(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$ScreensScreenEventInit implements ScreensScreenEventInit {
  const _$ScreensScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ScreensScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventInitCopyWith<_$ScreensScreenEventInit> get copyWith =>
      __$$ScreensScreenEventInitCopyWithImpl<_$ScreensScreenEventInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(Screen screen) onScreenDelete,
    required TResult Function() onScreenModify,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(Screen screen)? onScreenDelete,
    TResult? Function()? onScreenModify,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(Screen screen)? onScreenDelete,
    TResult Function()? onScreenModify,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenEventInit value) init,
    required TResult Function(ScreensScreenEventOnScreenAdd value) onScreenAdd,
    required TResult Function(ScreensScreenEventOnScreenDelete value)
        onScreenDelete,
    required TResult Function(ScreensScreenEventOnScreenModify value)
        onScreenModify,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenEventInit implements ScreensScreenEvent {
  const factory ScreensScreenEventInit({required final Config config}) =
      _$ScreensScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventInitCopyWith<_$ScreensScreenEventInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenAddCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenAddCopyWith(
          _$ScreensScreenEventOnScreenAdd value,
          $Res Function(_$ScreensScreenEventOnScreenAdd) then) =
      __$$ScreensScreenEventOnScreenAddCopyWithImpl<$Res>;
  @useResult
  $Res call({Screen screen});
}

/// @nodoc
class __$$ScreensScreenEventOnScreenAddCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenAdd>
    implements _$$ScreensScreenEventOnScreenAddCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenAddCopyWithImpl(
      _$ScreensScreenEventOnScreenAdd _value,
      $Res Function(_$ScreensScreenEventOnScreenAdd) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
  }) {
    return _then(_$ScreensScreenEventOnScreenAdd(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc

class _$ScreensScreenEventOnScreenAdd implements ScreensScreenEventOnScreenAdd {
  const _$ScreensScreenEventOnScreenAdd({required this.screen});

  @override
  final Screen screen;

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenAdd(screen: $screen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenAdd &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventOnScreenAddCopyWith<_$ScreensScreenEventOnScreenAdd>
      get copyWith => __$$ScreensScreenEventOnScreenAddCopyWithImpl<
          _$ScreensScreenEventOnScreenAdd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(Screen screen) onScreenDelete,
    required TResult Function() onScreenModify,
  }) {
    return onScreenAdd(screen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(Screen screen)? onScreenDelete,
    TResult? Function()? onScreenModify,
  }) {
    return onScreenAdd?.call(screen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(Screen screen)? onScreenDelete,
    TResult Function()? onScreenModify,
    required TResult orElse(),
  }) {
    if (onScreenAdd != null) {
      return onScreenAdd(screen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenEventInit value) init,
    required TResult Function(ScreensScreenEventOnScreenAdd value) onScreenAdd,
    required TResult Function(ScreensScreenEventOnScreenDelete value)
        onScreenDelete,
    required TResult Function(ScreensScreenEventOnScreenModify value)
        onScreenModify,
  }) {
    return onScreenAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
  }) {
    return onScreenAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    required TResult orElse(),
  }) {
    if (onScreenAdd != null) {
      return onScreenAdd(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenEventOnScreenAdd implements ScreensScreenEvent {
  const factory ScreensScreenEventOnScreenAdd({required final Screen screen}) =
      _$ScreensScreenEventOnScreenAdd;

  Screen get screen;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventOnScreenAddCopyWith<_$ScreensScreenEventOnScreenAdd>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenDeleteCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenDeleteCopyWith(
          _$ScreensScreenEventOnScreenDelete value,
          $Res Function(_$ScreensScreenEventOnScreenDelete) then) =
      __$$ScreensScreenEventOnScreenDeleteCopyWithImpl<$Res>;
  @useResult
  $Res call({Screen screen});
}

/// @nodoc
class __$$ScreensScreenEventOnScreenDeleteCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenDelete>
    implements _$$ScreensScreenEventOnScreenDeleteCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenDeleteCopyWithImpl(
      _$ScreensScreenEventOnScreenDelete _value,
      $Res Function(_$ScreensScreenEventOnScreenDelete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
  }) {
    return _then(_$ScreensScreenEventOnScreenDelete(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc

class _$ScreensScreenEventOnScreenDelete
    implements ScreensScreenEventOnScreenDelete {
  const _$ScreensScreenEventOnScreenDelete({required this.screen});

  @override
  final Screen screen;

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenDelete(screen: $screen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenDelete &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventOnScreenDeleteCopyWith<
          _$ScreensScreenEventOnScreenDelete>
      get copyWith => __$$ScreensScreenEventOnScreenDeleteCopyWithImpl<
          _$ScreensScreenEventOnScreenDelete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(Screen screen) onScreenDelete,
    required TResult Function() onScreenModify,
  }) {
    return onScreenDelete(screen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(Screen screen)? onScreenDelete,
    TResult? Function()? onScreenModify,
  }) {
    return onScreenDelete?.call(screen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(Screen screen)? onScreenDelete,
    TResult Function()? onScreenModify,
    required TResult orElse(),
  }) {
    if (onScreenDelete != null) {
      return onScreenDelete(screen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenEventInit value) init,
    required TResult Function(ScreensScreenEventOnScreenAdd value) onScreenAdd,
    required TResult Function(ScreensScreenEventOnScreenDelete value)
        onScreenDelete,
    required TResult Function(ScreensScreenEventOnScreenModify value)
        onScreenModify,
  }) {
    return onScreenDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
  }) {
    return onScreenDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    required TResult orElse(),
  }) {
    if (onScreenDelete != null) {
      return onScreenDelete(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenEventOnScreenDelete implements ScreensScreenEvent {
  const factory ScreensScreenEventOnScreenDelete(
      {required final Screen screen}) = _$ScreensScreenEventOnScreenDelete;

  Screen get screen;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventOnScreenDeleteCopyWith<
          _$ScreensScreenEventOnScreenDelete>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenModifyCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenModifyCopyWith(
          _$ScreensScreenEventOnScreenModify value,
          $Res Function(_$ScreensScreenEventOnScreenModify) then) =
      __$$ScreensScreenEventOnScreenModifyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScreensScreenEventOnScreenModifyCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenModify>
    implements _$$ScreensScreenEventOnScreenModifyCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenModifyCopyWithImpl(
      _$ScreensScreenEventOnScreenModify _value,
      $Res Function(_$ScreensScreenEventOnScreenModify) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScreensScreenEventOnScreenModify
    implements ScreensScreenEventOnScreenModify {
  const _$ScreensScreenEventOnScreenModify();

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenModify()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenModify);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(Screen screen) onScreenDelete,
    required TResult Function() onScreenModify,
  }) {
    return onScreenModify();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(Screen screen)? onScreenDelete,
    TResult? Function()? onScreenModify,
  }) {
    return onScreenModify?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(Screen screen)? onScreenDelete,
    TResult Function()? onScreenModify,
    required TResult orElse(),
  }) {
    if (onScreenModify != null) {
      return onScreenModify();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenEventInit value) init,
    required TResult Function(ScreensScreenEventOnScreenAdd value) onScreenAdd,
    required TResult Function(ScreensScreenEventOnScreenDelete value)
        onScreenDelete,
    required TResult Function(ScreensScreenEventOnScreenModify value)
        onScreenModify,
  }) {
    return onScreenModify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
  }) {
    return onScreenModify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    required TResult orElse(),
  }) {
    if (onScreenModify != null) {
      return onScreenModify(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenEventOnScreenModify implements ScreensScreenEvent {
  const factory ScreensScreenEventOnScreenModify() =
      _$ScreensScreenEventOnScreenModify;
}

/// @nodoc
mixin _$ScreensScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() existsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? existsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? existsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExistsError value) existsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExistsError value)? existsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExistsError value)? existsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreensScreenSRCopyWith<$Res> {
  factory $ScreensScreenSRCopyWith(
          ScreensScreenSR value, $Res Function(ScreensScreenSR) then) =
      _$ScreensScreenSRCopyWithImpl<$Res, ScreensScreenSR>;
}

/// @nodoc
class _$ScreensScreenSRCopyWithImpl<$Res, $Val extends ScreensScreenSR>
    implements $ScreensScreenSRCopyWith<$Res> {
  _$ScreensScreenSRCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ExistsErrorCopyWith<$Res> {
  factory _$$_ExistsErrorCopyWith(
          _$_ExistsError value, $Res Function(_$_ExistsError) then) =
      __$$_ExistsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ExistsErrorCopyWithImpl<$Res>
    extends _$ScreensScreenSRCopyWithImpl<$Res, _$_ExistsError>
    implements _$$_ExistsErrorCopyWith<$Res> {
  __$$_ExistsErrorCopyWithImpl(
      _$_ExistsError _value, $Res Function(_$_ExistsError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ExistsError implements _ExistsError {
  const _$_ExistsError();

  @override
  String toString() {
    return 'ScreensScreenSR.existsError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ExistsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() existsError,
  }) {
    return existsError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? existsError,
  }) {
    return existsError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? existsError,
    required TResult orElse(),
  }) {
    if (existsError != null) {
      return existsError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExistsError value) existsError,
  }) {
    return existsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExistsError value)? existsError,
  }) {
    return existsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExistsError value)? existsError,
    required TResult orElse(),
  }) {
    if (existsError != null) {
      return existsError(this);
    }
    return orElse();
  }
}

abstract class _ExistsError implements ScreensScreenSR {
  const factory _ExistsError() = _$_ExistsError;
}

/// @nodoc
mixin _$ScreensScreenState {
  Config get config => throw _privateConstructorUsedError;
  int get stateUpdate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int stateUpdate) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int stateUpdate)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int stateUpdate)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScreensScreenStateCopyWith<ScreensScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreensScreenStateCopyWith<$Res> {
  factory $ScreensScreenStateCopyWith(
          ScreensScreenState value, $Res Function(ScreensScreenState) then) =
      _$ScreensScreenStateCopyWithImpl<$Res, ScreensScreenState>;
  @useResult
  $Res call({Config config, int stateUpdate});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ScreensScreenStateCopyWithImpl<$Res, $Val extends ScreensScreenState>
    implements $ScreensScreenStateCopyWith<$Res> {
  _$ScreensScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      stateUpdate: null == stateUpdate
          ? _value.stateUpdate
          : stateUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScreensScreenStateDataCopyWith<$Res>
    implements $ScreensScreenStateCopyWith<$Res> {
  factory _$$ScreensScreenStateDataCopyWith(_$ScreensScreenStateData value,
          $Res Function(_$ScreensScreenStateData) then) =
      __$$ScreensScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, int stateUpdate});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ScreensScreenStateDataCopyWithImpl<$Res>
    extends _$ScreensScreenStateCopyWithImpl<$Res, _$ScreensScreenStateData>
    implements _$$ScreensScreenStateDataCopyWith<$Res> {
  __$$ScreensScreenStateDataCopyWithImpl(_$ScreensScreenStateData _value,
      $Res Function(_$ScreensScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(_$ScreensScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      stateUpdate: null == stateUpdate
          ? _value.stateUpdate
          : stateUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ScreensScreenStateData implements ScreensScreenStateData {
  const _$ScreensScreenStateData({required this.config, this.stateUpdate = 0});

  @override
  final Config config;
  @override
  @JsonKey()
  final int stateUpdate;

  @override
  String toString() {
    return 'ScreensScreenState.data(config: $config, stateUpdate: $stateUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.stateUpdate, stateUpdate) ||
                other.stateUpdate == stateUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, stateUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenStateDataCopyWith<_$ScreensScreenStateData> get copyWith =>
      __$$ScreensScreenStateDataCopyWithImpl<_$ScreensScreenStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int stateUpdate) data,
  }) {
    return data(config, stateUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int stateUpdate)? data,
  }) {
    return data?.call(config, stateUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int stateUpdate)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, stateUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreensScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenStateData implements ScreensScreenState {
  const factory ScreensScreenStateData(
      {required final Config config,
      final int stateUpdate}) = _$ScreensScreenStateData;

  @override
  Config get config;
  @override
  int get stateUpdate;
  @override
  @JsonKey(ignore: true)
  _$$ScreensScreenStateDataCopyWith<_$ScreensScreenStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
