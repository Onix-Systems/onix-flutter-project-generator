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
    required TResult Function(String projectPath) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
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
  $Res call({String projectPath});
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
    Object? projectPath = null,
  }) {
    return _then(_$ProjectNameScreenEventInit(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenEventInit implements ProjectNameScreenEventInit {
  const _$ProjectNameScreenEventInit({required this.projectPath});

  @override
  final String projectPath;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.init(projectPath: $projectPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventInit &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventInitCopyWith<_$ProjectNameScreenEventInit>
      get copyWith => __$$ProjectNameScreenEventInitCopyWithImpl<
          _$ProjectNameScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) {
    return init(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) {
    return init?.call(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(projectPath);
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
  const factory ProjectNameScreenEventInit(
      {required final String projectPath}) = _$ProjectNameScreenEventInit;

  String get projectPath;
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
    required TResult Function(String projectPath) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) {
    return projectNameChanged(projectName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) {
    return projectNameChanged?.call(projectName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
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
    required TResult Function(String projectPath) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
  }) {
    return organizationChanged(organization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
  }) {
    return organizationChanged?.call(organization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
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
  String get projectName => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  String get projectPath => throw _privateConstructorUsedError;
  bool get projectExists => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName, String organization,
            String projectPath, bool projectExists)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName, String organization,
            String projectPath, bool projectExists)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName, String organization,
            String projectPath, bool projectExists)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProjectNameScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProjectNameScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProjectNameScreenStateData value)? data,
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
  $Res call(
      {String projectName,
      String organization,
      String projectPath,
      bool projectExists});
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
    Object? projectName = null,
    Object? organization = null,
    Object? projectPath = null,
    Object? projectExists = null,
  }) {
    return _then(_value.copyWith(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectNameScreenStateDataCopyWith<$Res>
    implements $ProjectNameScreenStateCopyWith<$Res> {
  factory _$$_ProjectNameScreenStateDataCopyWith(
          _$_ProjectNameScreenStateData value,
          $Res Function(_$_ProjectNameScreenStateData) then) =
      __$$_ProjectNameScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectName,
      String organization,
      String projectPath,
      bool projectExists});
}

/// @nodoc
class __$$_ProjectNameScreenStateDataCopyWithImpl<$Res>
    extends _$ProjectNameScreenStateCopyWithImpl<$Res,
        _$_ProjectNameScreenStateData>
    implements _$$_ProjectNameScreenStateDataCopyWith<$Res> {
  __$$_ProjectNameScreenStateDataCopyWithImpl(
      _$_ProjectNameScreenStateData _value,
      $Res Function(_$_ProjectNameScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? organization = null,
    Object? projectPath = null,
    Object? projectExists = null,
  }) {
    return _then(_$_ProjectNameScreenStateData(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProjectNameScreenStateData implements _ProjectNameScreenStateData {
  const _$_ProjectNameScreenStateData(
      {this.projectName = '',
      this.organization = '',
      this.projectPath = '',
      this.projectExists = false});

  @override
  @JsonKey()
  final String projectName;
  @override
  @JsonKey()
  final String organization;
  @override
  @JsonKey()
  final String projectPath;
  @override
  @JsonKey()
  final bool projectExists;

  @override
  String toString() {
    return 'ProjectNameScreenState.data(projectName: $projectName, organization: $organization, projectPath: $projectPath, projectExists: $projectExists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectNameScreenStateData &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, projectName, organization, projectPath, projectExists);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectNameScreenStateDataCopyWith<_$_ProjectNameScreenStateData>
      get copyWith => __$$_ProjectNameScreenStateDataCopyWithImpl<
          _$_ProjectNameScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName, String organization,
            String projectPath, bool projectExists)
        data,
  }) {
    return data(projectName, organization, projectPath, projectExists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName, String organization,
            String projectPath, bool projectExists)?
        data,
  }) {
    return data?.call(projectName, organization, projectPath, projectExists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName, String organization,
            String projectPath, bool projectExists)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(projectName, organization, projectPath, projectExists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProjectNameScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProjectNameScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProjectNameScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _ProjectNameScreenStateData implements ProjectNameScreenState {
  const factory _ProjectNameScreenStateData(
      {final String projectName,
      final String organization,
      final String projectPath,
      final bool projectExists}) = _$_ProjectNameScreenStateData;

  @override
  String get projectName;
  @override
  String get organization;
  @override
  String get projectPath;
  @override
  bool get projectExists;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectNameScreenStateDataCopyWith<_$_ProjectNameScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
