// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenerationScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() generateProject,
    required TResult Function() open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? generateProject,
    TResult? Function()? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? generateProject,
    TResult Function()? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerationScreenEventInit value) init,
    required TResult Function(GenerationScreenEventGenerateProject value)
        generateProject,
    required TResult Function(GenerationScreenEventOpenProject value) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerationScreenEventInit value)? init,
    TResult? Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult? Function(GenerationScreenEventOpenProject value)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerationScreenEventInit value)? init,
    TResult Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult Function(GenerationScreenEventOpenProject value)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationScreenEventCopyWith<$Res> {
  factory $GenerationScreenEventCopyWith(GenerationScreenEvent value,
          $Res Function(GenerationScreenEvent) then) =
      _$GenerationScreenEventCopyWithImpl<$Res, GenerationScreenEvent>;
}

/// @nodoc
class _$GenerationScreenEventCopyWithImpl<$Res,
        $Val extends GenerationScreenEvent>
    implements $GenerationScreenEventCopyWith<$Res> {
  _$GenerationScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GenerationScreenEventInitCopyWith<$Res> {
  factory _$$GenerationScreenEventInitCopyWith(
          _$GenerationScreenEventInit value,
          $Res Function(_$GenerationScreenEventInit) then) =
      __$$GenerationScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$GenerationScreenEventInitCopyWithImpl<$Res>
    extends _$GenerationScreenEventCopyWithImpl<$Res,
        _$GenerationScreenEventInit>
    implements _$$GenerationScreenEventInitCopyWith<$Res> {
  __$$GenerationScreenEventInitCopyWithImpl(_$GenerationScreenEventInit _value,
      $Res Function(_$GenerationScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$GenerationScreenEventInit(
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

class _$GenerationScreenEventInit implements GenerationScreenEventInit {
  const _$GenerationScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'GenerationScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationScreenEventInitCopyWith<_$GenerationScreenEventInit>
      get copyWith => __$$GenerationScreenEventInitCopyWithImpl<
          _$GenerationScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() generateProject,
    required TResult Function() open,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? generateProject,
    TResult? Function()? open,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? generateProject,
    TResult Function()? open,
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
    required TResult Function(GenerationScreenEventInit value) init,
    required TResult Function(GenerationScreenEventGenerateProject value)
        generateProject,
    required TResult Function(GenerationScreenEventOpenProject value) open,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerationScreenEventInit value)? init,
    TResult? Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult? Function(GenerationScreenEventOpenProject value)? open,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerationScreenEventInit value)? init,
    TResult Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult Function(GenerationScreenEventOpenProject value)? open,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class GenerationScreenEventInit implements GenerationScreenEvent {
  const factory GenerationScreenEventInit({required final Config config}) =
      _$GenerationScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$GenerationScreenEventInitCopyWith<_$GenerationScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerationScreenEventGenerateProjectCopyWith<$Res> {
  factory _$$GenerationScreenEventGenerateProjectCopyWith(
          _$GenerationScreenEventGenerateProject value,
          $Res Function(_$GenerationScreenEventGenerateProject) then) =
      __$$GenerationScreenEventGenerateProjectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerationScreenEventGenerateProjectCopyWithImpl<$Res>
    extends _$GenerationScreenEventCopyWithImpl<$Res,
        _$GenerationScreenEventGenerateProject>
    implements _$$GenerationScreenEventGenerateProjectCopyWith<$Res> {
  __$$GenerationScreenEventGenerateProjectCopyWithImpl(
      _$GenerationScreenEventGenerateProject _value,
      $Res Function(_$GenerationScreenEventGenerateProject) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenerationScreenEventGenerateProject
    implements GenerationScreenEventGenerateProject {
  const _$GenerationScreenEventGenerateProject();

  @override
  String toString() {
    return 'GenerationScreenEvent.generateProject()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationScreenEventGenerateProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() generateProject,
    required TResult Function() open,
  }) {
    return generateProject();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? generateProject,
    TResult? Function()? open,
  }) {
    return generateProject?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? generateProject,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    if (generateProject != null) {
      return generateProject();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerationScreenEventInit value) init,
    required TResult Function(GenerationScreenEventGenerateProject value)
        generateProject,
    required TResult Function(GenerationScreenEventOpenProject value) open,
  }) {
    return generateProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerationScreenEventInit value)? init,
    TResult? Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult? Function(GenerationScreenEventOpenProject value)? open,
  }) {
    return generateProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerationScreenEventInit value)? init,
    TResult Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult Function(GenerationScreenEventOpenProject value)? open,
    required TResult orElse(),
  }) {
    if (generateProject != null) {
      return generateProject(this);
    }
    return orElse();
  }
}

abstract class GenerationScreenEventGenerateProject
    implements GenerationScreenEvent {
  const factory GenerationScreenEventGenerateProject() =
      _$GenerationScreenEventGenerateProject;
}

/// @nodoc
abstract class _$$GenerationScreenEventOpenProjectCopyWith<$Res> {
  factory _$$GenerationScreenEventOpenProjectCopyWith(
          _$GenerationScreenEventOpenProject value,
          $Res Function(_$GenerationScreenEventOpenProject) then) =
      __$$GenerationScreenEventOpenProjectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerationScreenEventOpenProjectCopyWithImpl<$Res>
    extends _$GenerationScreenEventCopyWithImpl<$Res,
        _$GenerationScreenEventOpenProject>
    implements _$$GenerationScreenEventOpenProjectCopyWith<$Res> {
  __$$GenerationScreenEventOpenProjectCopyWithImpl(
      _$GenerationScreenEventOpenProject _value,
      $Res Function(_$GenerationScreenEventOpenProject) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenerationScreenEventOpenProject
    implements GenerationScreenEventOpenProject {
  const _$GenerationScreenEventOpenProject();

  @override
  String toString() {
    return 'GenerationScreenEvent.open()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationScreenEventOpenProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() generateProject,
    required TResult Function() open,
  }) {
    return open();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? generateProject,
    TResult? Function()? open,
  }) {
    return open?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? generateProject,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerationScreenEventInit value) init,
    required TResult Function(GenerationScreenEventGenerateProject value)
        generateProject,
    required TResult Function(GenerationScreenEventOpenProject value) open,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerationScreenEventInit value)? init,
    TResult? Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult? Function(GenerationScreenEventOpenProject value)? open,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerationScreenEventInit value)? init,
    TResult Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult Function(GenerationScreenEventOpenProject value)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class GenerationScreenEventOpenProject
    implements GenerationScreenEvent {
  const factory GenerationScreenEventOpenProject() =
      _$GenerationScreenEventOpenProject;
}

/// @nodoc
mixin _$GenerationScreenSR {
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
abstract class $GenerationScreenSRCopyWith<$Res> {
  factory $GenerationScreenSRCopyWith(
          GenerationScreenSR value, $Res Function(GenerationScreenSR) then) =
      _$GenerationScreenSRCopyWithImpl<$Res, GenerationScreenSR>;
}

/// @nodoc
class _$GenerationScreenSRCopyWithImpl<$Res, $Val extends GenerationScreenSR>
    implements $GenerationScreenSRCopyWith<$Res> {
  _$GenerationScreenSRCopyWithImpl(this._value, this._then);

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
    extends _$GenerationScreenSRCopyWithImpl<$Res, _$_LoadFinished>
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
    return 'GenerationScreenSR.loadFinished()';
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

abstract class _LoadFinished implements GenerationScreenSR {
  const factory _LoadFinished() = _$_LoadFinished;
}

/// @nodoc
mixin _$GenerationScreenState {
  Config get config => throw _privateConstructorUsedError;
  GeneratingState get generatingState => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, GeneratingState generatingState)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, GeneratingState generatingState)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, GeneratingState generatingState)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerationScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerationScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerationScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenerationScreenStateCopyWith<GenerationScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationScreenStateCopyWith<$Res> {
  factory $GenerationScreenStateCopyWith(GenerationScreenState value,
          $Res Function(GenerationScreenState) then) =
      _$GenerationScreenStateCopyWithImpl<$Res, GenerationScreenState>;
  @useResult
  $Res call({Config config, GeneratingState generatingState});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$GenerationScreenStateCopyWithImpl<$Res,
        $Val extends GenerationScreenState>
    implements $GenerationScreenStateCopyWith<$Res> {
  _$GenerationScreenStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? generatingState = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      generatingState: null == generatingState
          ? _value.generatingState
          : generatingState // ignore: cast_nullable_to_non_nullable
              as GeneratingState,
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
abstract class _$$GenerationScreenStateDataCopyWith<$Res>
    implements $GenerationScreenStateCopyWith<$Res> {
  factory _$$GenerationScreenStateDataCopyWith(
          _$GenerationScreenStateData value,
          $Res Function(_$GenerationScreenStateData) then) =
      __$$GenerationScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, GeneratingState generatingState});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$GenerationScreenStateDataCopyWithImpl<$Res>
    extends _$GenerationScreenStateCopyWithImpl<$Res,
        _$GenerationScreenStateData>
    implements _$$GenerationScreenStateDataCopyWith<$Res> {
  __$$GenerationScreenStateDataCopyWithImpl(_$GenerationScreenStateData _value,
      $Res Function(_$GenerationScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? generatingState = null,
  }) {
    return _then(_$GenerationScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      generatingState: null == generatingState
          ? _value.generatingState
          : generatingState // ignore: cast_nullable_to_non_nullable
              as GeneratingState,
    ));
  }
}

/// @nodoc

class _$GenerationScreenStateData implements GenerationScreenStateData {
  const _$GenerationScreenStateData(
      {required this.config, this.generatingState = GeneratingState.init});

  @override
  final Config config;
  @override
  @JsonKey()
  final GeneratingState generatingState;

  @override
  String toString() {
    return 'GenerationScreenState.data(config: $config, generatingState: $generatingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.generatingState, generatingState) ||
                other.generatingState == generatingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, generatingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationScreenStateDataCopyWith<_$GenerationScreenStateData>
      get copyWith => __$$GenerationScreenStateDataCopyWithImpl<
          _$GenerationScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, GeneratingState generatingState)
        data,
  }) {
    return data(config, generatingState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, GeneratingState generatingState)? data,
  }) {
    return data?.call(config, generatingState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, GeneratingState generatingState)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, generatingState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerationScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerationScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerationScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class GenerationScreenStateData implements GenerationScreenState {
  const factory GenerationScreenStateData(
      {required final Config config,
      final GeneratingState generatingState}) = _$GenerationScreenStateData;

  @override
  Config get config;
  @override
  GeneratingState get generatingState;
  @override
  @JsonKey(ignore: true)
  _$$GenerationScreenStateDataCopyWith<_$GenerationScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
