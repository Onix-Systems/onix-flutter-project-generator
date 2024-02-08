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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScreensScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
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
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
abstract class _$$ScreensScreenEventInitImplCopyWith<$Res> {
  factory _$$ScreensScreenEventInitImplCopyWith(
          _$ScreensScreenEventInitImpl value,
          $Res Function(_$ScreensScreenEventInitImpl) then) =
      __$$ScreensScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ScreensScreenEventInitImplCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res, _$ScreensScreenEventInitImpl>
    implements _$$ScreensScreenEventInitImplCopyWith<$Res> {
  __$$ScreensScreenEventInitImplCopyWithImpl(
      _$ScreensScreenEventInitImpl _value,
      $Res Function(_$ScreensScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ScreensScreenEventInitImpl(
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

class _$ScreensScreenEventInitImpl implements ScreensScreenEventInit {
  const _$ScreensScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ScreensScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventInitImplCopyWith<_$ScreensScreenEventInitImpl>
      get copyWith => __$$ScreensScreenEventInitImplCopyWithImpl<
          _$ScreensScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
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
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
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
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
      _$ScreensScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventInitImplCopyWith<_$ScreensScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenAddImplCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenAddImplCopyWith(
          _$ScreensScreenEventOnScreenAddImpl value,
          $Res Function(_$ScreensScreenEventOnScreenAddImpl) then) =
      __$$ScreensScreenEventOnScreenAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Screen screen});
}

/// @nodoc
class __$$ScreensScreenEventOnScreenAddImplCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenAddImpl>
    implements _$$ScreensScreenEventOnScreenAddImplCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenAddImplCopyWithImpl(
      _$ScreensScreenEventOnScreenAddImpl _value,
      $Res Function(_$ScreensScreenEventOnScreenAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
  }) {
    return _then(_$ScreensScreenEventOnScreenAddImpl(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc

class _$ScreensScreenEventOnScreenAddImpl
    implements ScreensScreenEventOnScreenAdd {
  const _$ScreensScreenEventOnScreenAddImpl({required this.screen});

  @override
  final Screen screen;

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenAdd(screen: $screen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenAddImpl &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventOnScreenAddImplCopyWith<
          _$ScreensScreenEventOnScreenAddImpl>
      get copyWith => __$$ScreensScreenEventOnScreenAddImplCopyWithImpl<
          _$ScreensScreenEventOnScreenAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) {
    return onScreenAdd(screen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) {
    return onScreenAdd?.call(screen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
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
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
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
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
      _$ScreensScreenEventOnScreenAddImpl;

  Screen get screen;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventOnScreenAddImplCopyWith<
          _$ScreensScreenEventOnScreenAddImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenDeleteImplCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenDeleteImplCopyWith(
          _$ScreensScreenEventOnScreenDeleteImpl value,
          $Res Function(_$ScreensScreenEventOnScreenDeleteImpl) then) =
      __$$ScreensScreenEventOnScreenDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String screenName});
}

/// @nodoc
class __$$ScreensScreenEventOnScreenDeleteImplCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenDeleteImpl>
    implements _$$ScreensScreenEventOnScreenDeleteImplCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenDeleteImplCopyWithImpl(
      _$ScreensScreenEventOnScreenDeleteImpl _value,
      $Res Function(_$ScreensScreenEventOnScreenDeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenName = null,
  }) {
    return _then(_$ScreensScreenEventOnScreenDeleteImpl(
      screenName: null == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScreensScreenEventOnScreenDeleteImpl
    implements ScreensScreenEventOnScreenDelete {
  const _$ScreensScreenEventOnScreenDeleteImpl({required this.screenName});

  @override
  final String screenName;

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenDelete(screenName: $screenName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenDeleteImpl &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventOnScreenDeleteImplCopyWith<
          _$ScreensScreenEventOnScreenDeleteImpl>
      get copyWith => __$$ScreensScreenEventOnScreenDeleteImplCopyWithImpl<
          _$ScreensScreenEventOnScreenDeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) {
    return onScreenDelete(screenName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) {
    return onScreenDelete?.call(screenName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
    required TResult orElse(),
  }) {
    if (onScreenDelete != null) {
      return onScreenDelete(screenName);
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
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
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
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
          {required final String screenName}) =
      _$ScreensScreenEventOnScreenDeleteImpl;

  String get screenName;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventOnScreenDeleteImplCopyWith<
          _$ScreensScreenEventOnScreenDeleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenModifyImplCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenModifyImplCopyWith(
          _$ScreensScreenEventOnScreenModifyImpl value,
          $Res Function(_$ScreensScreenEventOnScreenModifyImpl) then) =
      __$$ScreensScreenEventOnScreenModifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Screen screen, String oldName});
}

/// @nodoc
class __$$ScreensScreenEventOnScreenModifyImplCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenModifyImpl>
    implements _$$ScreensScreenEventOnScreenModifyImplCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenModifyImplCopyWithImpl(
      _$ScreensScreenEventOnScreenModifyImpl _value,
      $Res Function(_$ScreensScreenEventOnScreenModifyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
    Object? oldName = null,
  }) {
    return _then(_$ScreensScreenEventOnScreenModifyImpl(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
      oldName: null == oldName
          ? _value.oldName
          : oldName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScreensScreenEventOnScreenModifyImpl
    implements ScreensScreenEventOnScreenModify {
  const _$ScreensScreenEventOnScreenModifyImpl(
      {required this.screen, required this.oldName});

  @override
  final Screen screen;
  @override
  final String oldName;

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenModify(screen: $screen, oldName: $oldName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenModifyImpl &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.oldName, oldName) || other.oldName == oldName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen, oldName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventOnScreenModifyImplCopyWith<
          _$ScreensScreenEventOnScreenModifyImpl>
      get copyWith => __$$ScreensScreenEventOnScreenModifyImplCopyWithImpl<
          _$ScreensScreenEventOnScreenModifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) {
    return onScreenModify(screen, oldName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) {
    return onScreenModify?.call(screen, oldName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
    required TResult orElse(),
  }) {
    if (onScreenModify != null) {
      return onScreenModify(screen, oldName);
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
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
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
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
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
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
    required TResult orElse(),
  }) {
    if (onScreenModify != null) {
      return onScreenModify(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenEventOnScreenModify implements ScreensScreenEvent {
  const factory ScreensScreenEventOnScreenModify(
      {required final Screen screen,
      required final String oldName}) = _$ScreensScreenEventOnScreenModifyImpl;

  Screen get screen;
  String get oldName;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventOnScreenModifyImplCopyWith<
          _$ScreensScreenEventOnScreenModifyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreensScreenEventOnScreenChangeInitialImplCopyWith<$Res> {
  factory _$$ScreensScreenEventOnScreenChangeInitialImplCopyWith(
          _$ScreensScreenEventOnScreenChangeInitialImpl value,
          $Res Function(_$ScreensScreenEventOnScreenChangeInitialImpl) then) =
      __$$ScreensScreenEventOnScreenChangeInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Screen screen});
}

/// @nodoc
class __$$ScreensScreenEventOnScreenChangeInitialImplCopyWithImpl<$Res>
    extends _$ScreensScreenEventCopyWithImpl<$Res,
        _$ScreensScreenEventOnScreenChangeInitialImpl>
    implements _$$ScreensScreenEventOnScreenChangeInitialImplCopyWith<$Res> {
  __$$ScreensScreenEventOnScreenChangeInitialImplCopyWithImpl(
      _$ScreensScreenEventOnScreenChangeInitialImpl _value,
      $Res Function(_$ScreensScreenEventOnScreenChangeInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
  }) {
    return _then(_$ScreensScreenEventOnScreenChangeInitialImpl(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc

class _$ScreensScreenEventOnScreenChangeInitialImpl
    implements ScreensScreenEventOnScreenChangeInitial {
  const _$ScreensScreenEventOnScreenChangeInitialImpl({required this.screen});

  @override
  final Screen screen;

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenChangeInitial(screen: $screen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenEventOnScreenChangeInitialImpl &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenEventOnScreenChangeInitialImplCopyWith<
          _$ScreensScreenEventOnScreenChangeInitialImpl>
      get copyWith =>
          __$$ScreensScreenEventOnScreenChangeInitialImplCopyWithImpl<
              _$ScreensScreenEventOnScreenChangeInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) {
    return onScreenChangeInitial(screen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) {
    return onScreenChangeInitial?.call(screen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
    required TResult orElse(),
  }) {
    if (onScreenChangeInitial != null) {
      return onScreenChangeInitial(screen);
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
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
  }) {
    return onScreenChangeInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
  }) {
    return onScreenChangeInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
    required TResult orElse(),
  }) {
    if (onScreenChangeInitial != null) {
      return onScreenChangeInitial(this);
    }
    return orElse();
  }
}

abstract class ScreensScreenEventOnScreenChangeInitial
    implements ScreensScreenEvent {
  const factory ScreensScreenEventOnScreenChangeInitial(
          {required final Screen screen}) =
      _$ScreensScreenEventOnScreenChangeInitialImpl;

  Screen get screen;
  @JsonKey(ignore: true)
  _$$ScreensScreenEventOnScreenChangeInitialImplCopyWith<
          _$ScreensScreenEventOnScreenChangeInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$ExistsErrorImplCopyWith<$Res> {
  factory _$$ExistsErrorImplCopyWith(
          _$ExistsErrorImpl value, $Res Function(_$ExistsErrorImpl) then) =
      __$$ExistsErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExistsErrorImplCopyWithImpl<$Res>
    extends _$ScreensScreenSRCopyWithImpl<$Res, _$ExistsErrorImpl>
    implements _$$ExistsErrorImplCopyWith<$Res> {
  __$$ExistsErrorImplCopyWithImpl(
      _$ExistsErrorImpl _value, $Res Function(_$ExistsErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExistsErrorImpl implements _ExistsError {
  const _$ExistsErrorImpl();

  @override
  String toString() {
    return 'ScreensScreenSR.existsError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExistsErrorImpl);
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
  const factory _ExistsError() = _$ExistsErrorImpl;
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
abstract class _$$ScreensScreenStateDataImplCopyWith<$Res>
    implements $ScreensScreenStateCopyWith<$Res> {
  factory _$$ScreensScreenStateDataImplCopyWith(
          _$ScreensScreenStateDataImpl value,
          $Res Function(_$ScreensScreenStateDataImpl) then) =
      __$$ScreensScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, int stateUpdate});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ScreensScreenStateDataImplCopyWithImpl<$Res>
    extends _$ScreensScreenStateCopyWithImpl<$Res, _$ScreensScreenStateDataImpl>
    implements _$$ScreensScreenStateDataImplCopyWith<$Res> {
  __$$ScreensScreenStateDataImplCopyWithImpl(
      _$ScreensScreenStateDataImpl _value,
      $Res Function(_$ScreensScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(_$ScreensScreenStateDataImpl(
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

class _$ScreensScreenStateDataImpl implements ScreensScreenStateData {
  const _$ScreensScreenStateDataImpl(
      {required this.config, this.stateUpdate = 0});

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.stateUpdate, stateUpdate) ||
                other.stateUpdate == stateUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, stateUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensScreenStateDataImplCopyWith<_$ScreensScreenStateDataImpl>
      get copyWith => __$$ScreensScreenStateDataImplCopyWithImpl<
          _$ScreensScreenStateDataImpl>(this, _$identity);

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
      final int stateUpdate}) = _$ScreensScreenStateDataImpl;

  @override
  Config get config;
  @override
  int get stateUpdate;
  @override
  @JsonKey(ignore: true)
  _$$ScreensScreenStateDataImplCopyWith<_$ScreensScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
