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
abstract class _$$GenerationScreenEventInitImplCopyWith<$Res> {
  factory _$$GenerationScreenEventInitImplCopyWith(
          _$GenerationScreenEventInitImpl value,
          $Res Function(_$GenerationScreenEventInitImpl) then) =
      __$$GenerationScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$GenerationScreenEventInitImplCopyWithImpl<$Res>
    extends _$GenerationScreenEventCopyWithImpl<$Res,
        _$GenerationScreenEventInitImpl>
    implements _$$GenerationScreenEventInitImplCopyWith<$Res> {
  __$$GenerationScreenEventInitImplCopyWithImpl(
      _$GenerationScreenEventInitImpl _value,
      $Res Function(_$GenerationScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$GenerationScreenEventInitImpl(
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

class _$GenerationScreenEventInitImpl implements GenerationScreenEventInit {
  const _$GenerationScreenEventInitImpl({required this.config});

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
            other is _$GenerationScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationScreenEventInitImplCopyWith<_$GenerationScreenEventInitImpl>
      get copyWith => __$$GenerationScreenEventInitImplCopyWithImpl<
          _$GenerationScreenEventInitImpl>(this, _$identity);

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
      _$GenerationScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$GenerationScreenEventInitImplCopyWith<_$GenerationScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerationScreenEventGenerateProjectImplCopyWith<$Res> {
  factory _$$GenerationScreenEventGenerateProjectImplCopyWith(
          _$GenerationScreenEventGenerateProjectImpl value,
          $Res Function(_$GenerationScreenEventGenerateProjectImpl) then) =
      __$$GenerationScreenEventGenerateProjectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerationScreenEventGenerateProjectImplCopyWithImpl<$Res>
    extends _$GenerationScreenEventCopyWithImpl<$Res,
        _$GenerationScreenEventGenerateProjectImpl>
    implements _$$GenerationScreenEventGenerateProjectImplCopyWith<$Res> {
  __$$GenerationScreenEventGenerateProjectImplCopyWithImpl(
      _$GenerationScreenEventGenerateProjectImpl _value,
      $Res Function(_$GenerationScreenEventGenerateProjectImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenerationScreenEventGenerateProjectImpl
    implements GenerationScreenEventGenerateProject {
  const _$GenerationScreenEventGenerateProjectImpl();

  @override
  String toString() {
    return 'GenerationScreenEvent.generateProject()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationScreenEventGenerateProjectImpl);
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
      _$GenerationScreenEventGenerateProjectImpl;
}

/// @nodoc
abstract class _$$GenerationScreenEventOpenProjectImplCopyWith<$Res> {
  factory _$$GenerationScreenEventOpenProjectImplCopyWith(
          _$GenerationScreenEventOpenProjectImpl value,
          $Res Function(_$GenerationScreenEventOpenProjectImpl) then) =
      __$$GenerationScreenEventOpenProjectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerationScreenEventOpenProjectImplCopyWithImpl<$Res>
    extends _$GenerationScreenEventCopyWithImpl<$Res,
        _$GenerationScreenEventOpenProjectImpl>
    implements _$$GenerationScreenEventOpenProjectImplCopyWith<$Res> {
  __$$GenerationScreenEventOpenProjectImplCopyWithImpl(
      _$GenerationScreenEventOpenProjectImpl _value,
      $Res Function(_$GenerationScreenEventOpenProjectImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenerationScreenEventOpenProjectImpl
    implements GenerationScreenEventOpenProject {
  const _$GenerationScreenEventOpenProjectImpl();

  @override
  String toString() {
    return 'GenerationScreenEvent.open()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationScreenEventOpenProjectImpl);
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
      _$GenerationScreenEventOpenProjectImpl;
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
abstract class _$$LoadFinishedImplCopyWith<$Res> {
  factory _$$LoadFinishedImplCopyWith(
          _$LoadFinishedImpl value, $Res Function(_$LoadFinishedImpl) then) =
      __$$LoadFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFinishedImplCopyWithImpl<$Res>
    extends _$GenerationScreenSRCopyWithImpl<$Res, _$LoadFinishedImpl>
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
    return 'GenerationScreenSR.loadFinished()';
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

abstract class _LoadFinished implements GenerationScreenSR {
  const factory _LoadFinished() = _$LoadFinishedImpl;
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
abstract class _$$GenerationScreenStateDataImplCopyWith<$Res>
    implements $GenerationScreenStateCopyWith<$Res> {
  factory _$$GenerationScreenStateDataImplCopyWith(
          _$GenerationScreenStateDataImpl value,
          $Res Function(_$GenerationScreenStateDataImpl) then) =
      __$$GenerationScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, GeneratingState generatingState});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$GenerationScreenStateDataImplCopyWithImpl<$Res>
    extends _$GenerationScreenStateCopyWithImpl<$Res,
        _$GenerationScreenStateDataImpl>
    implements _$$GenerationScreenStateDataImplCopyWith<$Res> {
  __$$GenerationScreenStateDataImplCopyWithImpl(
      _$GenerationScreenStateDataImpl _value,
      $Res Function(_$GenerationScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? generatingState = null,
  }) {
    return _then(_$GenerationScreenStateDataImpl(
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

class _$GenerationScreenStateDataImpl implements GenerationScreenStateData {
  const _$GenerationScreenStateDataImpl(
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
            other is _$GenerationScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.generatingState, generatingState) ||
                other.generatingState == generatingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, generatingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationScreenStateDataImplCopyWith<_$GenerationScreenStateDataImpl>
      get copyWith => __$$GenerationScreenStateDataImplCopyWithImpl<
          _$GenerationScreenStateDataImpl>(this, _$identity);

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
      final GeneratingState generatingState}) = _$GenerationScreenStateDataImpl;

  @override
  Config get config;
  @override
  GeneratingState get generatingState;
  @override
  @JsonKey(ignore: true)
  _$$GenerationScreenStateDataImplCopyWith<_$GenerationScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
