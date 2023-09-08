// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'procedure_selection_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProcedureSelectionScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcedureSelectionScreenEventInit value) init,
    required TResult Function(ProcedureSelectionScreenEventOnNewProject value)
        onNewProject,
    required TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)
        onProjectOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcedureSelectionScreenEventCopyWith<$Res> {
  factory $ProcedureSelectionScreenEventCopyWith(
          ProcedureSelectionScreenEvent value,
          $Res Function(ProcedureSelectionScreenEvent) then) =
      _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
          ProcedureSelectionScreenEvent>;
}

/// @nodoc
class _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        $Val extends ProcedureSelectionScreenEvent>
    implements $ProcedureSelectionScreenEventCopyWith<$Res> {
  _$ProcedureSelectionScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventInitCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenEventInitCopyWith(
          _$ProcedureSelectionScreenEventInit value,
          $Res Function(_$ProcedureSelectionScreenEventInit) then) =
      __$$ProcedureSelectionScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProcedureSelectionScreenEventInitCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventInit>
    implements _$$ProcedureSelectionScreenEventInitCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventInitCopyWithImpl(
      _$ProcedureSelectionScreenEventInit _value,
      $Res Function(_$ProcedureSelectionScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventInit(
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

class _$ProcedureSelectionScreenEventInit
    implements ProcedureSelectionScreenEventInit {
  const _$ProcedureSelectionScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventInitCopyWith<
          _$ProcedureSelectionScreenEventInit>
      get copyWith => __$$ProcedureSelectionScreenEventInitCopyWithImpl<
          _$ProcedureSelectionScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
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
    required TResult Function(ProcedureSelectionScreenEventInit value) init,
    required TResult Function(ProcedureSelectionScreenEventOnNewProject value)
        onNewProject,
    required TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)
        onProjectOpen,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenEventInit
    implements ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEventInit(
      {required final Config config}) = _$ProcedureSelectionScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventInitCopyWith<
          _$ProcedureSelectionScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnNewProjectCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenEventOnNewProjectCopyWith(
          _$ProcedureSelectionScreenEventOnNewProject value,
          $Res Function(_$ProcedureSelectionScreenEventOnNewProject) then) =
      __$$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectPath});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnNewProject>
    implements _$$ProcedureSelectionScreenEventOnNewProjectCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl(
      _$ProcedureSelectionScreenEventOnNewProject _value,
      $Res Function(_$ProcedureSelectionScreenEventOnNewProject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnNewProject(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnNewProject
    implements ProcedureSelectionScreenEventOnNewProject {
  const _$ProcedureSelectionScreenEventOnNewProject(
      {required this.projectPath});

  @override
  final String projectPath;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onNewProject(projectPath: $projectPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnNewProject &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnNewProjectCopyWith<
          _$ProcedureSelectionScreenEventOnNewProject>
      get copyWith => __$$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl<
          _$ProcedureSelectionScreenEventOnNewProject>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
  }) {
    return onNewProject(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
  }) {
    return onNewProject?.call(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    required TResult orElse(),
  }) {
    if (onNewProject != null) {
      return onNewProject(projectPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcedureSelectionScreenEventInit value) init,
    required TResult Function(ProcedureSelectionScreenEventOnNewProject value)
        onNewProject,
    required TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)
        onProjectOpen,
  }) {
    return onNewProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
  }) {
    return onNewProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    required TResult orElse(),
  }) {
    if (onNewProject != null) {
      return onNewProject(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenEventOnNewProject
    implements ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEventOnNewProject(
          {required final String projectPath}) =
      _$ProcedureSelectionScreenEventOnNewProject;

  String get projectPath;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnNewProjectCopyWith<
          _$ProcedureSelectionScreenEventOnNewProject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnProjectOpenCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenEventOnProjectOpenCopyWith(
          _$ProcedureSelectionScreenEventOnProjectOpen value,
          $Res Function(_$ProcedureSelectionScreenEventOnProjectOpen) then) =
      __$$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectURI});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnProjectOpen>
    implements _$$ProcedureSelectionScreenEventOnProjectOpenCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl(
      _$ProcedureSelectionScreenEventOnProjectOpen _value,
      $Res Function(_$ProcedureSelectionScreenEventOnProjectOpen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectURI = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnProjectOpen(
      projectURI: null == projectURI
          ? _value.projectURI
          : projectURI // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnProjectOpen
    implements ProcedureSelectionScreenEventOnProjectOpen {
  const _$ProcedureSelectionScreenEventOnProjectOpen(
      {required this.projectURI});

  @override
  final String projectURI;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onProjectOpen(projectURI: $projectURI)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnProjectOpen &&
            (identical(other.projectURI, projectURI) ||
                other.projectURI == projectURI));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectURI);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnProjectOpenCopyWith<
          _$ProcedureSelectionScreenEventOnProjectOpen>
      get copyWith =>
          __$$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl<
              _$ProcedureSelectionScreenEventOnProjectOpen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
  }) {
    return onProjectOpen(projectURI);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
  }) {
    return onProjectOpen?.call(projectURI);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    required TResult orElse(),
  }) {
    if (onProjectOpen != null) {
      return onProjectOpen(projectURI);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcedureSelectionScreenEventInit value) init,
    required TResult Function(ProcedureSelectionScreenEventOnNewProject value)
        onNewProject,
    required TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)
        onProjectOpen,
  }) {
    return onProjectOpen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
  }) {
    return onProjectOpen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    required TResult orElse(),
  }) {
    if (onProjectOpen != null) {
      return onProjectOpen(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenEventOnProjectOpen
    implements ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEventOnProjectOpen(
          {required final String projectURI}) =
      _$ProcedureSelectionScreenEventOnProjectOpen;

  String get projectURI;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnProjectOpenCopyWith<
          _$ProcedureSelectionScreenEventOnProjectOpen>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProcedureSelectionScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcedureSelectionScreenSRCopyWith<$Res> {
  factory $ProcedureSelectionScreenSRCopyWith(ProcedureSelectionScreenSR value,
          $Res Function(ProcedureSelectionScreenSR) then) =
      _$ProcedureSelectionScreenSRCopyWithImpl<$Res,
          ProcedureSelectionScreenSR>;
}

/// @nodoc
class _$ProcedureSelectionScreenSRCopyWithImpl<$Res,
        $Val extends ProcedureSelectionScreenSR>
    implements $ProcedureSelectionScreenSRCopyWith<$Res> {
  _$ProcedureSelectionScreenSRCopyWithImpl(this._value, this._then);

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
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res, _$_LoadFinished>
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
    return 'ProcedureSelectionScreenSR.loadFinished()';
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
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
  }) {
    return loadFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
  }) {
    return loadFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
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
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(this);
    }
    return orElse();
  }
}

abstract class _LoadFinished implements ProcedureSelectionScreenSR {
  const factory _LoadFinished() = _$_LoadFinished;
}

/// @nodoc
abstract class _$$_EmptyConfigCopyWith<$Res> {
  factory _$$_EmptyConfigCopyWith(
          _$_EmptyConfig value, $Res Function(_$_EmptyConfig) then) =
      __$$_EmptyConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyConfigCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res, _$_EmptyConfig>
    implements _$$_EmptyConfigCopyWith<$Res> {
  __$$_EmptyConfigCopyWithImpl(
      _$_EmptyConfig _value, $Res Function(_$_EmptyConfig) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EmptyConfig implements _EmptyConfig {
  const _$_EmptyConfig();

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.emptyConfig()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmptyConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
  }) {
    return emptyConfig();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
  }) {
    return emptyConfig?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    required TResult orElse(),
  }) {
    if (emptyConfig != null) {
      return emptyConfig();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
  }) {
    return emptyConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
  }) {
    return emptyConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    required TResult orElse(),
  }) {
    if (emptyConfig != null) {
      return emptyConfig(this);
    }
    return orElse();
  }
}

abstract class _EmptyConfig implements ProcedureSelectionScreenSR {
  const factory _EmptyConfig() = _$_EmptyConfig;
}

/// @nodoc
abstract class _$$_onNewProjectCopyWith<$Res> {
  factory _$$_onNewProjectCopyWith(
          _$_onNewProject value, $Res Function(_$_onNewProject) then) =
      __$$_onNewProjectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_onNewProjectCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res, _$_onNewProject>
    implements _$$_onNewProjectCopyWith<$Res> {
  __$$_onNewProjectCopyWithImpl(
      _$_onNewProject _value, $Res Function(_$_onNewProject) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_onNewProject implements _onNewProject {
  const _$_onNewProject();

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.onNewProject()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_onNewProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
  }) {
    return onNewProject();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
  }) {
    return onNewProject?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    required TResult orElse(),
  }) {
    if (onNewProject != null) {
      return onNewProject();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
  }) {
    return onNewProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
  }) {
    return onNewProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    required TResult orElse(),
  }) {
    if (onNewProject != null) {
      return onNewProject(this);
    }
    return orElse();
  }
}

abstract class _onNewProject implements ProcedureSelectionScreenSR {
  const factory _onNewProject() = _$_onNewProject;
}

/// @nodoc
mixin _$ProcedureSelectionScreenState {
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
    required TResult Function(ProcedureSelectionScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProcedureSelectionScreenStateCopyWith<ProcedureSelectionScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcedureSelectionScreenStateCopyWith<$Res> {
  factory $ProcedureSelectionScreenStateCopyWith(
          ProcedureSelectionScreenState value,
          $Res Function(ProcedureSelectionScreenState) then) =
      _$ProcedureSelectionScreenStateCopyWithImpl<$Res,
          ProcedureSelectionScreenState>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ProcedureSelectionScreenStateCopyWithImpl<$Res,
        $Val extends ProcedureSelectionScreenState>
    implements $ProcedureSelectionScreenStateCopyWith<$Res> {
  _$ProcedureSelectionScreenStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ProcedureSelectionScreenStateDataCopyWith<$Res>
    implements $ProcedureSelectionScreenStateCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenStateDataCopyWith(
          _$ProcedureSelectionScreenStateData value,
          $Res Function(_$ProcedureSelectionScreenStateData) then) =
      __$$ProcedureSelectionScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProcedureSelectionScreenStateDataCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenStateCopyWithImpl<$Res,
        _$ProcedureSelectionScreenStateData>
    implements _$$ProcedureSelectionScreenStateDataCopyWith<$Res> {
  __$$ProcedureSelectionScreenStateDataCopyWithImpl(
      _$ProcedureSelectionScreenStateData _value,
      $Res Function(_$ProcedureSelectionScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ProcedureSelectionScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenStateData
    implements ProcedureSelectionScreenStateData {
  const _$ProcedureSelectionScreenStateData({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ProcedureSelectionScreenState.data(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenStateData &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenStateDataCopyWith<
          _$ProcedureSelectionScreenStateData>
      get copyWith => __$$ProcedureSelectionScreenStateDataCopyWithImpl<
          _$ProcedureSelectionScreenStateData>(this, _$identity);

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
    required TResult Function(ProcedureSelectionScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenStateData
    implements ProcedureSelectionScreenState {
  const factory ProcedureSelectionScreenStateData(
      {required final Config config}) = _$ProcedureSelectionScreenStateData;

  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenStateDataCopyWith<
          _$ProcedureSelectionScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
