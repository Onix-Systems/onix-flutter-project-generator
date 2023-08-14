// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_name_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectNameScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenEventInit value) init,
    required TResult Function(ProjectNameScreenEventProjectNameChanged value)
        projectNameChanged,
    required TResult Function(ProjectNameScreenEventOrganizationChanged value)
        organizationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenEventInit value)? init,
    TResult Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectNameScreenEventCopyWith<$Res> {
  factory $ProjectNameScreenEventCopyWith(ProjectNameScreenEvent value,
          $Res Function(ProjectNameScreenEvent) then) =
      _$ProjectNameScreenEventCopyWithImpl<$Res, ProjectNameScreenEvent>;
}

/// @nodoc
class _$ProjectNameScreenEventCopyWithImpl<$Res,
        $Val extends ProjectNameScreenEvent>
    implements $ProjectNameScreenEventCopyWith<$Res> {
  _$ProjectNameScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProjectNameScreenEventInitCopyWith<$Res> {
  factory _$$ProjectNameScreenEventInitCopyWith(
          _$ProjectNameScreenEventInit value,
          $Res Function(_$ProjectNameScreenEventInit) then) =
      __$$ProjectNameScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProjectNameScreenEventInitCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventInit>
    implements _$$ProjectNameScreenEventInitCopyWith<$Res> {
  __$$ProjectNameScreenEventInitCopyWithImpl(
      _$ProjectNameScreenEventInit _value,
      $Res Function(_$ProjectNameScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ProjectNameScreenEventInit(
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

class _$ProjectNameScreenEventInit implements ProjectNameScreenEventInit {
  const _$ProjectNameScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventInitCopyWith<_$ProjectNameScreenEventInit>
      get copyWith => __$$ProjectNameScreenEventInitCopyWithImpl<
          _$ProjectNameScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
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
    required TResult Function(ProjectNameScreenEventInit value) init,
    required TResult Function(ProjectNameScreenEventProjectNameChanged value)
        projectNameChanged,
    required TResult Function(ProjectNameScreenEventOrganizationChanged value)
        organizationChanged,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenEventInit value)? init,
    TResult Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenEventInit implements ProjectNameScreenEvent {
  const factory ProjectNameScreenEventInit({required final Config config}) =
      _$ProjectNameScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventInitCopyWith<_$ProjectNameScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectNameScreenEventProjectNameChangedCopyWith<$Res> {
  factory _$$ProjectNameScreenEventProjectNameChangedCopyWith(
          _$ProjectNameScreenEventProjectNameChanged value,
          $Res Function(_$ProjectNameScreenEventProjectNameChanged) then) =
      __$$ProjectNameScreenEventProjectNameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$ProjectNameScreenEventProjectNameChangedCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventProjectNameChanged>
    implements _$$ProjectNameScreenEventProjectNameChangedCopyWith<$Res> {
  __$$ProjectNameScreenEventProjectNameChangedCopyWithImpl(
      _$ProjectNameScreenEventProjectNameChanged _value,
      $Res Function(_$ProjectNameScreenEventProjectNameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$ProjectNameScreenEventProjectNameChanged(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenEventProjectNameChanged
    implements ProjectNameScreenEventProjectNameChanged {
  const _$ProjectNameScreenEventProjectNameChanged({required this.projectName});

  @override
  final String projectName;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.projectNameChanged(projectName: $projectName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventProjectNameChanged &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventProjectNameChangedCopyWith<
          _$ProjectNameScreenEventProjectNameChanged>
      get copyWith => __$$ProjectNameScreenEventProjectNameChangedCopyWithImpl<
          _$ProjectNameScreenEventProjectNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) {
    return projectNameChanged(projectName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) {
    return projectNameChanged?.call(projectName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    required TResult orElse(),
  }) {
    if (projectNameChanged != null) {
      return projectNameChanged(projectName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenEventInit value) init,
    required TResult Function(ProjectNameScreenEventProjectNameChanged value)
        projectNameChanged,
    required TResult Function(ProjectNameScreenEventOrganizationChanged value)
        organizationChanged,
  }) {
    return projectNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
  }) {
    return projectNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenEventInit value)? init,
    TResult Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    required TResult orElse(),
  }) {
    if (projectNameChanged != null) {
      return projectNameChanged(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenEventProjectNameChanged
    implements ProjectNameScreenEvent {
  const factory ProjectNameScreenEventProjectNameChanged(
          {required final String projectName}) =
      _$ProjectNameScreenEventProjectNameChanged;

  String get projectName;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventProjectNameChangedCopyWith<
          _$ProjectNameScreenEventProjectNameChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectNameScreenEventOrganizationChangedCopyWith<$Res> {
  factory _$$ProjectNameScreenEventOrganizationChangedCopyWith(
          _$ProjectNameScreenEventOrganizationChanged value,
          $Res Function(_$ProjectNameScreenEventOrganizationChanged) then) =
      __$$ProjectNameScreenEventOrganizationChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String organization});
}

/// @nodoc
class __$$ProjectNameScreenEventOrganizationChangedCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventOrganizationChanged>
    implements _$$ProjectNameScreenEventOrganizationChangedCopyWith<$Res> {
  __$$ProjectNameScreenEventOrganizationChangedCopyWithImpl(
      _$ProjectNameScreenEventOrganizationChanged _value,
      $Res Function(_$ProjectNameScreenEventOrganizationChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = null,
  }) {
    return _then(_$ProjectNameScreenEventOrganizationChanged(
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenEventOrganizationChanged
    implements ProjectNameScreenEventOrganizationChanged {
  const _$ProjectNameScreenEventOrganizationChanged(
      {required this.organization});

  @override
  final String organization;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.organizationChanged(organization: $organization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventOrganizationChanged &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventOrganizationChangedCopyWith<
          _$ProjectNameScreenEventOrganizationChanged>
      get copyWith => __$$ProjectNameScreenEventOrganizationChangedCopyWithImpl<
          _$ProjectNameScreenEventOrganizationChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) {
    return organizationChanged(organization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) {
    return organizationChanged?.call(organization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    required TResult orElse(),
  }) {
    if (organizationChanged != null) {
      return organizationChanged(organization);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenEventInit value) init,
    required TResult Function(ProjectNameScreenEventProjectNameChanged value)
        projectNameChanged,
    required TResult Function(ProjectNameScreenEventOrganizationChanged value)
        organizationChanged,
  }) {
    return organizationChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
  }) {
    return organizationChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenEventInit value)? init,
    TResult Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    required TResult orElse(),
  }) {
    if (organizationChanged != null) {
      return organizationChanged(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenEventOrganizationChanged
    implements ProjectNameScreenEvent {
  const factory ProjectNameScreenEventOrganizationChanged(
          {required final String organization}) =
      _$ProjectNameScreenEventOrganizationChanged;

  String get organization;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventOrganizationChangedCopyWith<
          _$ProjectNameScreenEventOrganizationChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectNameScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkNames,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkNames,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkNames,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenSRCheckNames value) checkNames,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenSRCheckNames value)? checkNames,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenSRCheckNames value)? checkNames,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectNameScreenSRCopyWith<$Res> {
  factory $ProjectNameScreenSRCopyWith(
          ProjectNameScreenSR value, $Res Function(ProjectNameScreenSR) then) =
      _$ProjectNameScreenSRCopyWithImpl<$Res, ProjectNameScreenSR>;
}

/// @nodoc
class _$ProjectNameScreenSRCopyWithImpl<$Res, $Val extends ProjectNameScreenSR>
    implements $ProjectNameScreenSRCopyWith<$Res> {
  _$ProjectNameScreenSRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProjectNameScreenSRCheckNamesCopyWith<$Res> {
  factory _$$ProjectNameScreenSRCheckNamesCopyWith(
          _$ProjectNameScreenSRCheckNames value,
          $Res Function(_$ProjectNameScreenSRCheckNames) then) =
      __$$ProjectNameScreenSRCheckNamesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectNameScreenSRCheckNamesCopyWithImpl<$Res>
    extends _$ProjectNameScreenSRCopyWithImpl<$Res,
        _$ProjectNameScreenSRCheckNames>
    implements _$$ProjectNameScreenSRCheckNamesCopyWith<$Res> {
  __$$ProjectNameScreenSRCheckNamesCopyWithImpl(
      _$ProjectNameScreenSRCheckNames _value,
      $Res Function(_$ProjectNameScreenSRCheckNames) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectNameScreenSRCheckNames implements ProjectNameScreenSRCheckNames {
  const _$ProjectNameScreenSRCheckNames();

  @override
  String toString() {
    return 'ProjectNameScreenSR.checkNames()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenSRCheckNames);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkNames,
  }) {
    return checkNames();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkNames,
  }) {
    return checkNames?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkNames,
    required TResult orElse(),
  }) {
    if (checkNames != null) {
      return checkNames();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenSRCheckNames value) checkNames,
  }) {
    return checkNames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenSRCheckNames value)? checkNames,
  }) {
    return checkNames?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenSRCheckNames value)? checkNames,
    required TResult orElse(),
  }) {
    if (checkNames != null) {
      return checkNames(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenSRCheckNames implements ProjectNameScreenSR {
  const factory ProjectNameScreenSRCheckNames() =
      _$ProjectNameScreenSRCheckNames;
}

/// @nodoc
mixin _$ProjectNameScreenState {
  Config get config => throw _privateConstructorUsedError;
  bool get projectExists => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, bool projectExists) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, bool projectExists)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, bool projectExists)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectNameScreenStateCopyWith<ProjectNameScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectNameScreenStateCopyWith<$Res> {
  factory $ProjectNameScreenStateCopyWith(ProjectNameScreenState value,
          $Res Function(ProjectNameScreenState) then) =
      _$ProjectNameScreenStateCopyWithImpl<$Res, ProjectNameScreenState>;
  @useResult
  $Res call({Config config, bool projectExists});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ProjectNameScreenStateCopyWithImpl<$Res,
        $Val extends ProjectNameScreenState>
    implements $ProjectNameScreenStateCopyWith<$Res> {
  _$ProjectNameScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? projectExists = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ProjectNameScreenStateDataCopyWith<$Res>
    implements $ProjectNameScreenStateCopyWith<$Res> {
  factory _$$ProjectNameScreenStateDataCopyWith(
          _$ProjectNameScreenStateData value,
          $Res Function(_$ProjectNameScreenStateData) then) =
      __$$ProjectNameScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, bool projectExists});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProjectNameScreenStateDataCopyWithImpl<$Res>
    extends _$ProjectNameScreenStateCopyWithImpl<$Res,
        _$ProjectNameScreenStateData>
    implements _$$ProjectNameScreenStateDataCopyWith<$Res> {
  __$$ProjectNameScreenStateDataCopyWithImpl(
      _$ProjectNameScreenStateData _value,
      $Res Function(_$ProjectNameScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? projectExists = null,
  }) {
    return _then(_$ProjectNameScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenStateData implements ProjectNameScreenStateData {
  const _$ProjectNameScreenStateData(
      {required this.config, this.projectExists = false});

  @override
  final Config config;
  @override
  @JsonKey()
  final bool projectExists;

  @override
  String toString() {
    return 'ProjectNameScreenState.data(config: $config, projectExists: $projectExists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, projectExists);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenStateDataCopyWith<_$ProjectNameScreenStateData>
      get copyWith => __$$ProjectNameScreenStateDataCopyWithImpl<
          _$ProjectNameScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, bool projectExists) data,
  }) {
    return data(config, projectExists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, bool projectExists)? data,
  }) {
    return data?.call(config, projectExists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, bool projectExists)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, projectExists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenStateData implements ProjectNameScreenState {
  const factory ProjectNameScreenStateData(
      {required final Config config,
      final bool projectExists}) = _$ProjectNameScreenStateData;

  @override
  Config get config;
  @override
  bool get projectExists;
  @override
  @JsonKey(ignore: true)
  _$$ProjectNameScreenStateDataCopyWith<_$ProjectNameScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
