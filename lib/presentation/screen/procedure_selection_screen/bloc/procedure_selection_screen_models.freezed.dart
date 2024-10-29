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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProcedureSelectionScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
abstract class _$$ProcedureSelectionScreenEventInitImplCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenEventInitImplCopyWith(
          _$ProcedureSelectionScreenEventInitImpl value,
          $Res Function(_$ProcedureSelectionScreenEventInitImpl) then) =
      __$$ProcedureSelectionScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProcedureSelectionScreenEventInitImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventInitImpl>
    implements _$$ProcedureSelectionScreenEventInitImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventInitImplCopyWithImpl(
      _$ProcedureSelectionScreenEventInitImpl _value,
      $Res Function(_$ProcedureSelectionScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventInitImpl(
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

class _$ProcedureSelectionScreenEventInitImpl
    implements ProcedureSelectionScreenEventInit {
  const _$ProcedureSelectionScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventInitImplCopyWith<
          _$ProcedureSelectionScreenEventInitImpl>
      get copyWith => __$$ProcedureSelectionScreenEventInitImplCopyWithImpl<
          _$ProcedureSelectionScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
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
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
      {required final Config config}) = _$ProcedureSelectionScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventInitImplCopyWith<
          _$ProcedureSelectionScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnNewProjectImplCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenEventOnNewProjectImplCopyWith(
          _$ProcedureSelectionScreenEventOnNewProjectImpl value,
          $Res Function(_$ProcedureSelectionScreenEventOnNewProjectImpl) then) =
      __$$ProcedureSelectionScreenEventOnNewProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectPath});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnNewProjectImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnNewProjectImpl>
    implements _$$ProcedureSelectionScreenEventOnNewProjectImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnNewProjectImplCopyWithImpl(
      _$ProcedureSelectionScreenEventOnNewProjectImpl _value,
      $Res Function(_$ProcedureSelectionScreenEventOnNewProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnNewProjectImpl(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnNewProjectImpl
    implements ProcedureSelectionScreenEventOnNewProject {
  const _$ProcedureSelectionScreenEventOnNewProjectImpl(
      {required this.projectPath});

  @override
  final String projectPath;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onNewProject(projectPath: $projectPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnNewProjectImpl &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnNewProjectImplCopyWith<
          _$ProcedureSelectionScreenEventOnNewProjectImpl>
      get copyWith =>
          __$$ProcedureSelectionScreenEventOnNewProjectImplCopyWithImpl<
                  _$ProcedureSelectionScreenEventOnNewProjectImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) {
    return onNewProject(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) {
    return onNewProject?.call(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
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
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
      _$ProcedureSelectionScreenEventOnNewProjectImpl;

  String get projectPath;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnNewProjectImplCopyWith<
          _$ProcedureSelectionScreenEventOnNewProjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWith(
          _$ProcedureSelectionScreenEventOnProjectOpenImpl value,
          $Res Function(_$ProcedureSelectionScreenEventOnProjectOpenImpl)
              then) =
      __$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectURI});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnProjectOpenImpl>
    implements _$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWithImpl(
      _$ProcedureSelectionScreenEventOnProjectOpenImpl _value,
      $Res Function(_$ProcedureSelectionScreenEventOnProjectOpenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectURI = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnProjectOpenImpl(
      projectURI: null == projectURI
          ? _value.projectURI
          : projectURI // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnProjectOpenImpl
    implements ProcedureSelectionScreenEventOnProjectOpen {
  const _$ProcedureSelectionScreenEventOnProjectOpenImpl(
      {required this.projectURI});

  @override
  final String projectURI;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onProjectOpen(projectURI: $projectURI)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnProjectOpenImpl &&
            (identical(other.projectURI, projectURI) ||
                other.projectURI == projectURI));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectURI);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWith<
          _$ProcedureSelectionScreenEventOnProjectOpenImpl>
      get copyWith =>
          __$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWithImpl<
                  _$ProcedureSelectionScreenEventOnProjectOpenImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) {
    return onProjectOpen(projectURI);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) {
    return onProjectOpen?.call(projectURI);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
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
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
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
      _$ProcedureSelectionScreenEventOnProjectOpenImpl;

  String get projectURI;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnProjectOpenImplCopyWith<
          _$ProcedureSelectionScreenEventOnProjectOpenImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWith<
    $Res> {
  factory _$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWith(
          _$ProcedureSelectionScreenEventOnLocaleChangeImpl value,
          $Res Function(_$ProcedureSelectionScreenEventOnLocaleChangeImpl)
              then) =
      __$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnLocaleChangeImpl>
    implements
        _$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWithImpl(
      _$ProcedureSelectionScreenEventOnLocaleChangeImpl _value,
      $Res Function(_$ProcedureSelectionScreenEventOnLocaleChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnLocaleChangeImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnLocaleChangeImpl
    implements ProcedureSelectionScreenEventOnLocaleChange {
  const _$ProcedureSelectionScreenEventOnLocaleChangeImpl(
      {required this.language});

  @override
  final String language;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onLocaleChange(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnLocaleChangeImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWith<
          _$ProcedureSelectionScreenEventOnLocaleChangeImpl>
      get copyWith =>
          __$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWithImpl<
                  _$ProcedureSelectionScreenEventOnLocaleChangeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) {
    return onLocaleChange(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) {
    return onLocaleChange?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
    required TResult orElse(),
  }) {
    if (onLocaleChange != null) {
      return onLocaleChange(language);
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
  }) {
    return onLocaleChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
  }) {
    return onLocaleChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
    required TResult orElse(),
  }) {
    if (onLocaleChange != null) {
      return onLocaleChange(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenEventOnLocaleChange
    implements ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEventOnLocaleChange(
          {required final String language}) =
      _$ProcedureSelectionScreenEventOnLocaleChangeImpl;

  String get language;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnLocaleChangeImplCopyWith<
          _$ProcedureSelectionScreenEventOnLocaleChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWith<
    $Res> {
  factory _$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWith(
          _$ProcedureSelectionScreenEventOnAndroidSigningImpl value,
          $Res Function(_$ProcedureSelectionScreenEventOnAndroidSigningImpl)
              then) =
      __$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Directory directory, List<String> signingVars});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnAndroidSigningImpl>
    implements
        _$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWithImpl(
      _$ProcedureSelectionScreenEventOnAndroidSigningImpl _value,
      $Res Function(_$ProcedureSelectionScreenEventOnAndroidSigningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directory = null,
    Object? signingVars = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnAndroidSigningImpl(
      directory: null == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as Directory,
      signingVars: null == signingVars
          ? _value._signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnAndroidSigningImpl
    implements ProcedureSelectionScreenEventOnAndroidSigning {
  const _$ProcedureSelectionScreenEventOnAndroidSigningImpl(
      {required this.directory, required final List<String> signingVars})
      : _signingVars = signingVars;

  @override
  final Directory directory;
  final List<String> _signingVars;
  @override
  List<String> get signingVars {
    if (_signingVars is EqualUnmodifiableListView) return _signingVars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signingVars);
  }

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onGenerateAndroidSigning(directory: $directory, signingVars: $signingVars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnAndroidSigningImpl &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            const DeepCollectionEquality()
                .equals(other._signingVars, _signingVars));
  }

  @override
  int get hashCode => Object.hash(runtimeType, directory,
      const DeepCollectionEquality().hash(_signingVars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWith<
          _$ProcedureSelectionScreenEventOnAndroidSigningImpl>
      get copyWith =>
          __$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWithImpl<
                  _$ProcedureSelectionScreenEventOnAndroidSigningImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) {
    return onGenerateAndroidSigning(directory, signingVars);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) {
    return onGenerateAndroidSigning?.call(directory, signingVars);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
    required TResult orElse(),
  }) {
    if (onGenerateAndroidSigning != null) {
      return onGenerateAndroidSigning(directory, signingVars);
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
  }) {
    return onGenerateAndroidSigning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
  }) {
    return onGenerateAndroidSigning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
    required TResult orElse(),
  }) {
    if (onGenerateAndroidSigning != null) {
      return onGenerateAndroidSigning(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenEventOnAndroidSigning
    implements ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEventOnAndroidSigning(
          {required final Directory directory,
          required final List<String> signingVars}) =
      _$ProcedureSelectionScreenEventOnAndroidSigningImpl;

  Directory get directory;
  List<String> get signingVars;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnAndroidSigningImplCopyWith<
          _$ProcedureSelectionScreenEventOnAndroidSigningImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWith<
    $Res> {
  factory _$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWith(
          _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl value,
          $Res Function(_$ProcedureSelectionScreenEventOnGenerateFlavorsImpl)
              then) =
      __$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Directory directory, Set<String> flavors});
}

/// @nodoc
class __$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenEventCopyWithImpl<$Res,
        _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl>
    implements
        _$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWithImpl(
      _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl _value,
      $Res Function(_$ProcedureSelectionScreenEventOnGenerateFlavorsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directory = null,
    Object? flavors = null,
  }) {
    return _then(_$ProcedureSelectionScreenEventOnGenerateFlavorsImpl(
      directory: null == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as Directory,
      flavors: null == flavors
          ? _value._flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl
    implements ProcedureSelectionScreenEventOnGenerateFlavors {
  const _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl(
      {required this.directory, required final Set<String> flavors})
      : _flavors = flavors;

  @override
  final Directory directory;
  final Set<String> _flavors;
  @override
  Set<String> get flavors {
    if (_flavors is EqualUnmodifiableSetView) return _flavors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_flavors);
  }

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onGenerateFlavors(directory: $directory, flavors: $flavors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            const DeepCollectionEquality().equals(other._flavors, _flavors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, directory, const DeepCollectionEquality().hash(_flavors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWith<
          _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl>
      get copyWith =>
          __$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWithImpl<
                  _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(Directory directory, List<String> signingVars)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
  }) {
    return onGenerateFlavors(directory, flavors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
  }) {
    return onGenerateFlavors?.call(directory, flavors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(Directory directory, List<String> signingVars)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
    required TResult orElse(),
  }) {
    if (onGenerateFlavors != null) {
      return onGenerateFlavors(directory, flavors);
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
    required TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)
        onLocaleChange,
    required TResult Function(
            ProcedureSelectionScreenEventOnAndroidSigning value)
        onGenerateAndroidSigning,
    required TResult Function(
            ProcedureSelectionScreenEventOnGenerateFlavors value)
        onGenerateFlavors,
  }) {
    return onGenerateFlavors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcedureSelectionScreenEventInit value)? init,
    TResult? Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult? Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult? Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult? Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult? Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
  }) {
    return onGenerateFlavors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcedureSelectionScreenEventInit value)? init,
    TResult Function(ProcedureSelectionScreenEventOnNewProject value)?
        onNewProject,
    TResult Function(ProcedureSelectionScreenEventOnProjectOpen value)?
        onProjectOpen,
    TResult Function(ProcedureSelectionScreenEventOnLocaleChange value)?
        onLocaleChange,
    TResult Function(ProcedureSelectionScreenEventOnAndroidSigning value)?
        onGenerateAndroidSigning,
    TResult Function(ProcedureSelectionScreenEventOnGenerateFlavors value)?
        onGenerateFlavors,
    required TResult orElse(),
  }) {
    if (onGenerateFlavors != null) {
      return onGenerateFlavors(this);
    }
    return orElse();
  }
}

abstract class ProcedureSelectionScreenEventOnGenerateFlavors
    implements ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEventOnGenerateFlavors(
          {required final Directory directory,
          required final Set<String> flavors}) =
      _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl;

  Directory get directory;
  Set<String> get flavors;
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenEventOnGenerateFlavorsImplCopyWith<
          _$ProcedureSelectionScreenEventOnGenerateFlavorsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProcedureSelectionScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
    required TResult Function() onFlavorsCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult? Function()? onFlavorsCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult Function()? onFlavorsCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
    required TResult Function(_onFlavorsCreated value) onFlavorsCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult? Function(_onFlavorsCreated value)? onFlavorsCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult Function(_onFlavorsCreated value)? onFlavorsCreated,
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
abstract class _$$LoadFinishedImplCopyWith<$Res> {
  factory _$$LoadFinishedImplCopyWith(
          _$LoadFinishedImpl value, $Res Function(_$LoadFinishedImpl) then) =
      __$$LoadFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFinishedImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res, _$LoadFinishedImpl>
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
    return 'ProcedureSelectionScreenSR.loadFinished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
    required TResult Function() onFlavorsCreated,
  }) {
    return loadFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult? Function()? onFlavorsCreated,
  }) {
    return loadFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult Function()? onFlavorsCreated,
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
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
    required TResult Function(_onFlavorsCreated value) onFlavorsCreated,
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult? Function(_onFlavorsCreated value)? onFlavorsCreated,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult Function(_onFlavorsCreated value)? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(this);
    }
    return orElse();
  }
}

abstract class _LoadFinished implements ProcedureSelectionScreenSR {
  const factory _LoadFinished() = _$LoadFinishedImpl;
}

/// @nodoc
abstract class _$$EmptyConfigImplCopyWith<$Res> {
  factory _$$EmptyConfigImplCopyWith(
          _$EmptyConfigImpl value, $Res Function(_$EmptyConfigImpl) then) =
      __$$EmptyConfigImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyConfigImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res, _$EmptyConfigImpl>
    implements _$$EmptyConfigImplCopyWith<$Res> {
  __$$EmptyConfigImplCopyWithImpl(
      _$EmptyConfigImpl _value, $Res Function(_$EmptyConfigImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyConfigImpl implements _EmptyConfig {
  const _$EmptyConfigImpl();

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.emptyConfig()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyConfigImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
    required TResult Function() onFlavorsCreated,
  }) {
    return emptyConfig();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult? Function()? onFlavorsCreated,
  }) {
    return emptyConfig?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult Function()? onFlavorsCreated,
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
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
    required TResult Function(_onFlavorsCreated value) onFlavorsCreated,
  }) {
    return emptyConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult? Function(_onFlavorsCreated value)? onFlavorsCreated,
  }) {
    return emptyConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult Function(_onFlavorsCreated value)? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (emptyConfig != null) {
      return emptyConfig(this);
    }
    return orElse();
  }
}

abstract class _EmptyConfig implements ProcedureSelectionScreenSR {
  const factory _EmptyConfig() = _$EmptyConfigImpl;
}

/// @nodoc
abstract class _$$onNewProjectImplCopyWith<$Res> {
  factory _$$onNewProjectImplCopyWith(
          _$onNewProjectImpl value, $Res Function(_$onNewProjectImpl) then) =
      __$$onNewProjectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onNewProjectImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res, _$onNewProjectImpl>
    implements _$$onNewProjectImplCopyWith<$Res> {
  __$$onNewProjectImplCopyWithImpl(
      _$onNewProjectImpl _value, $Res Function(_$onNewProjectImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onNewProjectImpl implements _onNewProject {
  const _$onNewProjectImpl();

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.onNewProject()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onNewProjectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
    required TResult Function() onFlavorsCreated,
  }) {
    return onNewProject();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult? Function()? onFlavorsCreated,
  }) {
    return onNewProject?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult Function()? onFlavorsCreated,
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
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
    required TResult Function(_onFlavorsCreated value) onFlavorsCreated,
  }) {
    return onNewProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult? Function(_onFlavorsCreated value)? onFlavorsCreated,
  }) {
    return onNewProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult Function(_onFlavorsCreated value)? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (onNewProject != null) {
      return onNewProject(this);
    }
    return orElse();
  }
}

abstract class _onNewProject implements ProcedureSelectionScreenSR {
  const factory _onNewProject() = _$onNewProjectImpl;
}

/// @nodoc
abstract class _$$onAndroidSigningCreatedImplCopyWith<$Res> {
  factory _$$onAndroidSigningCreatedImplCopyWith(
          _$onAndroidSigningCreatedImpl value,
          $Res Function(_$onAndroidSigningCreatedImpl) then) =
      __$$onAndroidSigningCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Fingerprint> fingerprints});
}

/// @nodoc
class __$$onAndroidSigningCreatedImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res,
        _$onAndroidSigningCreatedImpl>
    implements _$$onAndroidSigningCreatedImplCopyWith<$Res> {
  __$$onAndroidSigningCreatedImplCopyWithImpl(
      _$onAndroidSigningCreatedImpl _value,
      $Res Function(_$onAndroidSigningCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fingerprints = null,
  }) {
    return _then(_$onAndroidSigningCreatedImpl(
      fingerprints: null == fingerprints
          ? _value._fingerprints
          : fingerprints // ignore: cast_nullable_to_non_nullable
              as List<Fingerprint>,
    ));
  }
}

/// @nodoc

class _$onAndroidSigningCreatedImpl implements _onAndroidSigningCreated {
  const _$onAndroidSigningCreatedImpl(
      {required final List<Fingerprint> fingerprints})
      : _fingerprints = fingerprints;

  final List<Fingerprint> _fingerprints;
  @override
  List<Fingerprint> get fingerprints {
    if (_fingerprints is EqualUnmodifiableListView) return _fingerprints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fingerprints);
  }

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.onAndroidSigningCreated(fingerprints: $fingerprints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAndroidSigningCreatedImpl &&
            const DeepCollectionEquality()
                .equals(other._fingerprints, _fingerprints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_fingerprints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAndroidSigningCreatedImplCopyWith<_$onAndroidSigningCreatedImpl>
      get copyWith => __$$onAndroidSigningCreatedImplCopyWithImpl<
          _$onAndroidSigningCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
    required TResult Function() onFlavorsCreated,
  }) {
    return onAndroidSigningCreated(fingerprints);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult? Function()? onFlavorsCreated,
  }) {
    return onAndroidSigningCreated?.call(fingerprints);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult Function()? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (onAndroidSigningCreated != null) {
      return onAndroidSigningCreated(fingerprints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
    required TResult Function(_onFlavorsCreated value) onFlavorsCreated,
  }) {
    return onAndroidSigningCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult? Function(_onFlavorsCreated value)? onFlavorsCreated,
  }) {
    return onAndroidSigningCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult Function(_onFlavorsCreated value)? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (onAndroidSigningCreated != null) {
      return onAndroidSigningCreated(this);
    }
    return orElse();
  }
}

abstract class _onAndroidSigningCreated implements ProcedureSelectionScreenSR {
  const factory _onAndroidSigningCreated(
          {required final List<Fingerprint> fingerprints}) =
      _$onAndroidSigningCreatedImpl;

  List<Fingerprint> get fingerprints;
  @JsonKey(ignore: true)
  _$$onAndroidSigningCreatedImplCopyWith<_$onAndroidSigningCreatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onFlavorsCreatedImplCopyWith<$Res> {
  factory _$$onFlavorsCreatedImplCopyWith(_$onFlavorsCreatedImpl value,
          $Res Function(_$onFlavorsCreatedImpl) then) =
      __$$onFlavorsCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onFlavorsCreatedImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenSRCopyWithImpl<$Res,
        _$onFlavorsCreatedImpl>
    implements _$$onFlavorsCreatedImplCopyWith<$Res> {
  __$$onFlavorsCreatedImplCopyWithImpl(_$onFlavorsCreatedImpl _value,
      $Res Function(_$onFlavorsCreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onFlavorsCreatedImpl implements _onFlavorsCreated {
  const _$onFlavorsCreatedImpl();

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.onFlavorsCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onFlavorsCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
    required TResult Function() onFlavorsCreated,
  }) {
    return onFlavorsCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult? Function()? onFlavorsCreated,
  }) {
    return onFlavorsCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    TResult Function()? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (onFlavorsCreated != null) {
      return onFlavorsCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
    required TResult Function(_onFlavorsCreated value) onFlavorsCreated,
  }) {
    return onFlavorsCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult? Function(_onFlavorsCreated value)? onFlavorsCreated,
  }) {
    return onFlavorsCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    TResult Function(_onFlavorsCreated value)? onFlavorsCreated,
    required TResult orElse(),
  }) {
    if (onFlavorsCreated != null) {
      return onFlavorsCreated(this);
    }
    return orElse();
  }
}

abstract class _onFlavorsCreated implements ProcedureSelectionScreenSR {
  const factory _onFlavorsCreated() = _$onFlavorsCreatedImpl;
}

/// @nodoc
mixin _$ProcedureSelectionScreenState {
  Config get config => throw _privateConstructorUsedError;
  dynamic get language => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, dynamic language) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, dynamic language)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, dynamic language)? data,
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
  $Res call({Config config, dynamic language});

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
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$ProcedureSelectionScreenStateDataImplCopyWith<$Res>
    implements $ProcedureSelectionScreenStateCopyWith<$Res> {
  factory _$$ProcedureSelectionScreenStateDataImplCopyWith(
          _$ProcedureSelectionScreenStateDataImpl value,
          $Res Function(_$ProcedureSelectionScreenStateDataImpl) then) =
      __$$ProcedureSelectionScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, dynamic language});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProcedureSelectionScreenStateDataImplCopyWithImpl<$Res>
    extends _$ProcedureSelectionScreenStateCopyWithImpl<$Res,
        _$ProcedureSelectionScreenStateDataImpl>
    implements _$$ProcedureSelectionScreenStateDataImplCopyWith<$Res> {
  __$$ProcedureSelectionScreenStateDataImplCopyWithImpl(
      _$ProcedureSelectionScreenStateDataImpl _value,
      $Res Function(_$ProcedureSelectionScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? language = freezed,
  }) {
    return _then(_$ProcedureSelectionScreenStateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      language: freezed == language ? _value.language! : language,
    ));
  }
}

/// @nodoc

class _$ProcedureSelectionScreenStateDataImpl
    implements ProcedureSelectionScreenStateData {
  const _$ProcedureSelectionScreenStateDataImpl(
      {required this.config, this.language = 'en'});

  @override
  final Config config;
  @override
  @JsonKey()
  final dynamic language;

  @override
  String toString() {
    return 'ProcedureSelectionScreenState.data(config: $config, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureSelectionScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(other.language, language));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, config, const DeepCollectionEquality().hash(language));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureSelectionScreenStateDataImplCopyWith<
          _$ProcedureSelectionScreenStateDataImpl>
      get copyWith => __$$ProcedureSelectionScreenStateDataImplCopyWithImpl<
          _$ProcedureSelectionScreenStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, dynamic language) data,
  }) {
    return data(config, language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, dynamic language)? data,
  }) {
    return data?.call(config, language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, dynamic language)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, language);
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
      {required final Config config,
      final dynamic language}) = _$ProcedureSelectionScreenStateDataImpl;

  @override
  Config get config;
  @override
  dynamic get language;
  @override
  @JsonKey(ignore: true)
  _$$ProcedureSelectionScreenStateDataImplCopyWith<
          _$ProcedureSelectionScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
