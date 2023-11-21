// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platforms_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlatformsScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(PlatformsList platformsList) onPlatformsChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(PlatformsList platformsList)? onPlatformsChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(PlatformsList platformsList)? onPlatformsChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlatformsScreenEventInit value) init,
    required TResult Function(PlatformsScreenEventOnPlatformsChange value)
        onPlatformsChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlatformsScreenEventInit value)? init,
    TResult? Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlatformsScreenEventInit value)? init,
    TResult Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformsScreenEventCopyWith<$Res> {
  factory $PlatformsScreenEventCopyWith(PlatformsScreenEvent value,
          $Res Function(PlatformsScreenEvent) then) =
      _$PlatformsScreenEventCopyWithImpl<$Res, PlatformsScreenEvent>;
}

/// @nodoc
class _$PlatformsScreenEventCopyWithImpl<$Res,
        $Val extends PlatformsScreenEvent>
    implements $PlatformsScreenEventCopyWith<$Res> {
  _$PlatformsScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlatformsScreenEventInitImplCopyWith<$Res> {
  factory _$$PlatformsScreenEventInitImplCopyWith(
          _$PlatformsScreenEventInitImpl value,
          $Res Function(_$PlatformsScreenEventInitImpl) then) =
      __$$PlatformsScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$PlatformsScreenEventInitImplCopyWithImpl<$Res>
    extends _$PlatformsScreenEventCopyWithImpl<$Res,
        _$PlatformsScreenEventInitImpl>
    implements _$$PlatformsScreenEventInitImplCopyWith<$Res> {
  __$$PlatformsScreenEventInitImplCopyWithImpl(
      _$PlatformsScreenEventInitImpl _value,
      $Res Function(_$PlatformsScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$PlatformsScreenEventInitImpl(
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

class _$PlatformsScreenEventInitImpl implements PlatformsScreenEventInit {
  const _$PlatformsScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'PlatformsScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformsScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformsScreenEventInitImplCopyWith<_$PlatformsScreenEventInitImpl>
      get copyWith => __$$PlatformsScreenEventInitImplCopyWithImpl<
          _$PlatformsScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(PlatformsList platformsList) onPlatformsChange,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(PlatformsList platformsList)? onPlatformsChange,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(PlatformsList platformsList)? onPlatformsChange,
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
    required TResult Function(PlatformsScreenEventInit value) init,
    required TResult Function(PlatformsScreenEventOnPlatformsChange value)
        onPlatformsChange,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlatformsScreenEventInit value)? init,
    TResult? Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlatformsScreenEventInit value)? init,
    TResult Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PlatformsScreenEventInit implements PlatformsScreenEvent {
  const factory PlatformsScreenEventInit({required final Config config}) =
      _$PlatformsScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$PlatformsScreenEventInitImplCopyWith<_$PlatformsScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlatformsScreenEventOnPlatformsChangeImplCopyWith<$Res> {
  factory _$$PlatformsScreenEventOnPlatformsChangeImplCopyWith(
          _$PlatformsScreenEventOnPlatformsChangeImpl value,
          $Res Function(_$PlatformsScreenEventOnPlatformsChangeImpl) then) =
      __$$PlatformsScreenEventOnPlatformsChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlatformsList platformsList});

  $PlatformsListCopyWith<$Res> get platformsList;
}

/// @nodoc
class __$$PlatformsScreenEventOnPlatformsChangeImplCopyWithImpl<$Res>
    extends _$PlatformsScreenEventCopyWithImpl<$Res,
        _$PlatformsScreenEventOnPlatformsChangeImpl>
    implements _$$PlatformsScreenEventOnPlatformsChangeImplCopyWith<$Res> {
  __$$PlatformsScreenEventOnPlatformsChangeImplCopyWithImpl(
      _$PlatformsScreenEventOnPlatformsChangeImpl _value,
      $Res Function(_$PlatformsScreenEventOnPlatformsChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformsList = null,
  }) {
    return _then(_$PlatformsScreenEventOnPlatformsChangeImpl(
      platformsList: null == platformsList
          ? _value.platformsList
          : platformsList // ignore: cast_nullable_to_non_nullable
              as PlatformsList,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PlatformsListCopyWith<$Res> get platformsList {
    return $PlatformsListCopyWith<$Res>(_value.platformsList, (value) {
      return _then(_value.copyWith(platformsList: value));
    });
  }
}

/// @nodoc

class _$PlatformsScreenEventOnPlatformsChangeImpl
    implements PlatformsScreenEventOnPlatformsChange {
  const _$PlatformsScreenEventOnPlatformsChangeImpl(
      {required this.platformsList});

  @override
  final PlatformsList platformsList;

  @override
  String toString() {
    return 'PlatformsScreenEvent.onPlatformsChange(platformsList: $platformsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformsScreenEventOnPlatformsChangeImpl &&
            (identical(other.platformsList, platformsList) ||
                other.platformsList == platformsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platformsList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformsScreenEventOnPlatformsChangeImplCopyWith<
          _$PlatformsScreenEventOnPlatformsChangeImpl>
      get copyWith => __$$PlatformsScreenEventOnPlatformsChangeImplCopyWithImpl<
          _$PlatformsScreenEventOnPlatformsChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(PlatformsList platformsList) onPlatformsChange,
  }) {
    return onPlatformsChange(platformsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(PlatformsList platformsList)? onPlatformsChange,
  }) {
    return onPlatformsChange?.call(platformsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(PlatformsList platformsList)? onPlatformsChange,
    required TResult orElse(),
  }) {
    if (onPlatformsChange != null) {
      return onPlatformsChange(platformsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlatformsScreenEventInit value) init,
    required TResult Function(PlatformsScreenEventOnPlatformsChange value)
        onPlatformsChange,
  }) {
    return onPlatformsChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlatformsScreenEventInit value)? init,
    TResult? Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
  }) {
    return onPlatformsChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlatformsScreenEventInit value)? init,
    TResult Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
    required TResult orElse(),
  }) {
    if (onPlatformsChange != null) {
      return onPlatformsChange(this);
    }
    return orElse();
  }
}

abstract class PlatformsScreenEventOnPlatformsChange
    implements PlatformsScreenEvent {
  const factory PlatformsScreenEventOnPlatformsChange(
          {required final PlatformsList platformsList}) =
      _$PlatformsScreenEventOnPlatformsChangeImpl;

  PlatformsList get platformsList;
  @JsonKey(ignore: true)
  _$$PlatformsScreenEventOnPlatformsChangeImplCopyWith<
          _$PlatformsScreenEventOnPlatformsChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlatformsScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformsScreenSRCopyWith<$Res> {
  factory $PlatformsScreenSRCopyWith(
          PlatformsScreenSR value, $Res Function(PlatformsScreenSR) then) =
      _$PlatformsScreenSRCopyWithImpl<$Res, PlatformsScreenSR>;
}

/// @nodoc
class _$PlatformsScreenSRCopyWithImpl<$Res, $Val extends PlatformsScreenSR>
    implements $PlatformsScreenSRCopyWith<$Res> {
  _$PlatformsScreenSRCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadFinishedImplCopyWith<$Res> {
  factory _$$LoadFinishedImplCopyWith(
          _$LoadFinishedImpl value, $Res Function(_$LoadFinishedImpl) then) =
      __$$LoadFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFinishedImplCopyWithImpl<$Res>
    extends _$PlatformsScreenSRCopyWithImpl<$Res, _$LoadFinishedImpl>
    implements _$$LoadFinishedImplCopyWith<$Res> {
  __$$LoadFinishedImplCopyWithImpl(
      _$LoadFinishedImpl _value, $Res Function(_$LoadFinishedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFinishedImpl implements _LoadFinished {
  const _$LoadFinishedImpl();

  @override
  String toString() {
    return 'PlatformsScreenSR.loadFinished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
  }) {
    return loadFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
  }) {
    return loadFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(this);
    }
    return orElse();
  }
}

abstract class _LoadFinished implements PlatformsScreenSR {
  const factory _LoadFinished() = _$LoadFinishedImpl;
}

/// @nodoc
mixin _$PlatformsScreenState {
  Config get config => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlatformsScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlatformsScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlatformsScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlatformsScreenStateCopyWith<PlatformsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformsScreenStateCopyWith<$Res> {
  factory $PlatformsScreenStateCopyWith(PlatformsScreenState value,
          $Res Function(PlatformsScreenState) then) =
      _$PlatformsScreenStateCopyWithImpl<$Res, PlatformsScreenState>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$PlatformsScreenStateCopyWithImpl<$Res,
        $Val extends PlatformsScreenState>
    implements $PlatformsScreenStateCopyWith<$Res> {
  _$PlatformsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
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
abstract class _$$PlatformsScreenStateDataImplCopyWith<$Res>
    implements $PlatformsScreenStateCopyWith<$Res> {
  factory _$$PlatformsScreenStateDataImplCopyWith(
          _$PlatformsScreenStateDataImpl value,
          $Res Function(_$PlatformsScreenStateDataImpl) then) =
      __$$PlatformsScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$PlatformsScreenStateDataImplCopyWithImpl<$Res>
    extends _$PlatformsScreenStateCopyWithImpl<$Res,
        _$PlatformsScreenStateDataImpl>
    implements _$$PlatformsScreenStateDataImplCopyWith<$Res> {
  __$$PlatformsScreenStateDataImplCopyWithImpl(
      _$PlatformsScreenStateDataImpl _value,
      $Res Function(_$PlatformsScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$PlatformsScreenStateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$PlatformsScreenStateDataImpl implements PlatformsScreenStateData {
  const _$PlatformsScreenStateDataImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'PlatformsScreenState.data(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformsScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformsScreenStateDataImplCopyWith<_$PlatformsScreenStateDataImpl>
      get copyWith => __$$PlatformsScreenStateDataImplCopyWithImpl<
          _$PlatformsScreenStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) data,
  }) {
    return data(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? data,
  }) {
    return data?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlatformsScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlatformsScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlatformsScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PlatformsScreenStateData implements PlatformsScreenState {
  const factory PlatformsScreenStateData({required final Config config}) =
      _$PlatformsScreenStateDataImpl;

  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$PlatformsScreenStateDataImplCopyWith<_$PlatformsScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
