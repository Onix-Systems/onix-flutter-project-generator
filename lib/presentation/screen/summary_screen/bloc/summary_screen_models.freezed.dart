// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SummaryScreenEvent {
  Config get config => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SummaryScreenEventInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummaryScreenEventInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummaryScreenEventInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SummaryScreenEventCopyWith<SummaryScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryScreenEventCopyWith<$Res> {
  factory $SummaryScreenEventCopyWith(
          SummaryScreenEvent value, $Res Function(SummaryScreenEvent) then) =
      _$SummaryScreenEventCopyWithImpl<$Res, SummaryScreenEvent>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$SummaryScreenEventCopyWithImpl<$Res, $Val extends SummaryScreenEvent>
    implements $SummaryScreenEventCopyWith<$Res> {
  _$SummaryScreenEventCopyWithImpl(this._value, this._then);

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
abstract class _$$SummaryScreenEventInitCopyWith<$Res>
    implements $SummaryScreenEventCopyWith<$Res> {
  factory _$$SummaryScreenEventInitCopyWith(_$SummaryScreenEventInit value,
          $Res Function(_$SummaryScreenEventInit) then) =
      __$$SummaryScreenEventInitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$SummaryScreenEventInitCopyWithImpl<$Res>
    extends _$SummaryScreenEventCopyWithImpl<$Res, _$SummaryScreenEventInit>
    implements _$$SummaryScreenEventInitCopyWith<$Res> {
  __$$SummaryScreenEventInitCopyWithImpl(_$SummaryScreenEventInit _value,
      $Res Function(_$SummaryScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$SummaryScreenEventInit(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$SummaryScreenEventInit implements SummaryScreenEventInit {
  const _$SummaryScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'SummaryScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryScreenEventInitCopyWith<_$SummaryScreenEventInit> get copyWith =>
      __$$SummaryScreenEventInitCopyWithImpl<_$SummaryScreenEventInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
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
    required TResult Function(SummaryScreenEventInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummaryScreenEventInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummaryScreenEventInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SummaryScreenEventInit implements SummaryScreenEvent {
  const factory SummaryScreenEventInit({required final Config config}) =
      _$SummaryScreenEventInit;

  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$SummaryScreenEventInitCopyWith<_$SummaryScreenEventInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SummaryScreenSR {
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
abstract class $SummaryScreenSRCopyWith<$Res> {
  factory $SummaryScreenSRCopyWith(
          SummaryScreenSR value, $Res Function(SummaryScreenSR) then) =
      _$SummaryScreenSRCopyWithImpl<$Res, SummaryScreenSR>;
}

/// @nodoc
class _$SummaryScreenSRCopyWithImpl<$Res, $Val extends SummaryScreenSR>
    implements $SummaryScreenSRCopyWith<$Res> {
  _$SummaryScreenSRCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadFinishedCopyWith<$Res> {
  factory _$$_LoadFinishedCopyWith(
          _$_LoadFinished value, $Res Function(_$_LoadFinished) then) =
      __$$_LoadFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadFinishedCopyWithImpl<$Res>
    extends _$SummaryScreenSRCopyWithImpl<$Res, _$_LoadFinished>
    implements _$$_LoadFinishedCopyWith<$Res> {
  __$$_LoadFinishedCopyWithImpl(
      _$_LoadFinished _value, $Res Function(_$_LoadFinished) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadFinished implements _LoadFinished {
  const _$_LoadFinished();

  @override
  String toString() {
    return 'SummaryScreenSR.loadFinished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadFinished);
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

abstract class _LoadFinished implements SummaryScreenSR {
  const factory _LoadFinished() = _$_LoadFinished;
}

/// @nodoc
mixin _$SummaryScreenState {
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
    required TResult Function(SummaryScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummaryScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummaryScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SummaryScreenStateCopyWith<SummaryScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryScreenStateCopyWith<$Res> {
  factory $SummaryScreenStateCopyWith(
          SummaryScreenState value, $Res Function(SummaryScreenState) then) =
      _$SummaryScreenStateCopyWithImpl<$Res, SummaryScreenState>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$SummaryScreenStateCopyWithImpl<$Res, $Val extends SummaryScreenState>
    implements $SummaryScreenStateCopyWith<$Res> {
  _$SummaryScreenStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SummaryScreenStateDataCopyWith<$Res>
    implements $SummaryScreenStateCopyWith<$Res> {
  factory _$$SummaryScreenStateDataCopyWith(_$SummaryScreenStateData value,
          $Res Function(_$SummaryScreenStateData) then) =
      __$$SummaryScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$SummaryScreenStateDataCopyWithImpl<$Res>
    extends _$SummaryScreenStateCopyWithImpl<$Res, _$SummaryScreenStateData>
    implements _$$SummaryScreenStateDataCopyWith<$Res> {
  __$$SummaryScreenStateDataCopyWithImpl(_$SummaryScreenStateData _value,
      $Res Function(_$SummaryScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$SummaryScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$SummaryScreenStateData implements SummaryScreenStateData {
  const _$SummaryScreenStateData({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'SummaryScreenState.data(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryScreenStateData &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryScreenStateDataCopyWith<_$SummaryScreenStateData> get copyWith =>
      __$$SummaryScreenStateDataCopyWithImpl<_$SummaryScreenStateData>(
          this, _$identity);

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
    required TResult Function(SummaryScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SummaryScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SummaryScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SummaryScreenStateData implements SummaryScreenState {
  const factory SummaryScreenStateData({required final Config config}) =
      _$SummaryScreenStateData;

  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$SummaryScreenStateDataCopyWith<_$SummaryScreenStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
