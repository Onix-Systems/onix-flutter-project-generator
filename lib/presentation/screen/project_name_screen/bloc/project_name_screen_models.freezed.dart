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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectNameScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
    required TResult Function(String newBranch) branchChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
    TResult? Function(String newBranch)? branchChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    TResult Function(String newBranch)? branchChanged,
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
    required TResult Function(ProjectNameScreenEventBranchChanged value)
        branchChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    TResult? Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenEventInit value)? init,
    TResult Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    TResult Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
abstract class _$$ProjectNameScreenEventInitImplCopyWith<$Res> {
  factory _$$ProjectNameScreenEventInitImplCopyWith(
          _$ProjectNameScreenEventInitImpl value,
          $Res Function(_$ProjectNameScreenEventInitImpl) then) =
      __$$ProjectNameScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProjectNameScreenEventInitImplCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventInitImpl>
    implements _$$ProjectNameScreenEventInitImplCopyWith<$Res> {
  __$$ProjectNameScreenEventInitImplCopyWithImpl(
      _$ProjectNameScreenEventInitImpl _value,
      $Res Function(_$ProjectNameScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ProjectNameScreenEventInitImpl(
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

class _$ProjectNameScreenEventInitImpl implements ProjectNameScreenEventInit {
  const _$ProjectNameScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventInitImplCopyWith<_$ProjectNameScreenEventInitImpl>
      get copyWith => __$$ProjectNameScreenEventInitImplCopyWithImpl<
          _$ProjectNameScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
    required TResult Function(String newBranch) branchChanged,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
    TResult? Function(String newBranch)? branchChanged,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    TResult Function(String newBranch)? branchChanged,
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
    required TResult Function(ProjectNameScreenEventBranchChanged value)
        branchChanged,
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
    TResult? Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
    TResult Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
      _$ProjectNameScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventInitImplCopyWith<_$ProjectNameScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectNameScreenEventProjectNameChangedImplCopyWith<$Res> {
  factory _$$ProjectNameScreenEventProjectNameChangedImplCopyWith(
          _$ProjectNameScreenEventProjectNameChangedImpl value,
          $Res Function(_$ProjectNameScreenEventProjectNameChangedImpl) then) =
      __$$ProjectNameScreenEventProjectNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$ProjectNameScreenEventProjectNameChangedImplCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventProjectNameChangedImpl>
    implements _$$ProjectNameScreenEventProjectNameChangedImplCopyWith<$Res> {
  __$$ProjectNameScreenEventProjectNameChangedImplCopyWithImpl(
      _$ProjectNameScreenEventProjectNameChangedImpl _value,
      $Res Function(_$ProjectNameScreenEventProjectNameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$ProjectNameScreenEventProjectNameChangedImpl(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenEventProjectNameChangedImpl
    implements ProjectNameScreenEventProjectNameChanged {
  const _$ProjectNameScreenEventProjectNameChangedImpl(
      {required this.projectName});

  @override
  final String projectName;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.projectNameChanged(projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventProjectNameChangedImpl &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventProjectNameChangedImplCopyWith<
          _$ProjectNameScreenEventProjectNameChangedImpl>
      get copyWith =>
          __$$ProjectNameScreenEventProjectNameChangedImplCopyWithImpl<
              _$ProjectNameScreenEventProjectNameChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
    required TResult Function(String newBranch) branchChanged,
  }) {
    return projectNameChanged(projectName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
    TResult? Function(String newBranch)? branchChanged,
  }) {
    return projectNameChanged?.call(projectName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    TResult Function(String newBranch)? branchChanged,
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
    required TResult Function(ProjectNameScreenEventBranchChanged value)
        branchChanged,
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
    TResult? Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
    TResult Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
      _$ProjectNameScreenEventProjectNameChangedImpl;

  String get projectName;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventProjectNameChangedImplCopyWith<
          _$ProjectNameScreenEventProjectNameChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectNameScreenEventOrganizationChangedImplCopyWith<$Res> {
  factory _$$ProjectNameScreenEventOrganizationChangedImplCopyWith(
          _$ProjectNameScreenEventOrganizationChangedImpl value,
          $Res Function(_$ProjectNameScreenEventOrganizationChangedImpl) then) =
      __$$ProjectNameScreenEventOrganizationChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String organization});
}

/// @nodoc
class __$$ProjectNameScreenEventOrganizationChangedImplCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventOrganizationChangedImpl>
    implements _$$ProjectNameScreenEventOrganizationChangedImplCopyWith<$Res> {
  __$$ProjectNameScreenEventOrganizationChangedImplCopyWithImpl(
      _$ProjectNameScreenEventOrganizationChangedImpl _value,
      $Res Function(_$ProjectNameScreenEventOrganizationChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = null,
  }) {
    return _then(_$ProjectNameScreenEventOrganizationChangedImpl(
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenEventOrganizationChangedImpl
    implements ProjectNameScreenEventOrganizationChanged {
  const _$ProjectNameScreenEventOrganizationChangedImpl(
      {required this.organization});

  @override
  final String organization;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.organizationChanged(organization: $organization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventOrganizationChangedImpl &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventOrganizationChangedImplCopyWith<
          _$ProjectNameScreenEventOrganizationChangedImpl>
      get copyWith =>
          __$$ProjectNameScreenEventOrganizationChangedImplCopyWithImpl<
                  _$ProjectNameScreenEventOrganizationChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
    required TResult Function(String newBranch) branchChanged,
  }) {
    return organizationChanged(organization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
    TResult? Function(String newBranch)? branchChanged,
  }) {
    return organizationChanged?.call(organization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    TResult Function(String newBranch)? branchChanged,
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
    required TResult Function(ProjectNameScreenEventBranchChanged value)
        branchChanged,
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
    TResult? Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
    TResult Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
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
      _$ProjectNameScreenEventOrganizationChangedImpl;

  String get organization;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventOrganizationChangedImplCopyWith<
          _$ProjectNameScreenEventOrganizationChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectNameScreenEventBranchChangedImplCopyWith<$Res> {
  factory _$$ProjectNameScreenEventBranchChangedImplCopyWith(
          _$ProjectNameScreenEventBranchChangedImpl value,
          $Res Function(_$ProjectNameScreenEventBranchChangedImpl) then) =
      __$$ProjectNameScreenEventBranchChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newBranch});
}

/// @nodoc
class __$$ProjectNameScreenEventBranchChangedImplCopyWithImpl<$Res>
    extends _$ProjectNameScreenEventCopyWithImpl<$Res,
        _$ProjectNameScreenEventBranchChangedImpl>
    implements _$$ProjectNameScreenEventBranchChangedImplCopyWith<$Res> {
  __$$ProjectNameScreenEventBranchChangedImplCopyWithImpl(
      _$ProjectNameScreenEventBranchChangedImpl _value,
      $Res Function(_$ProjectNameScreenEventBranchChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newBranch = null,
  }) {
    return _then(_$ProjectNameScreenEventBranchChangedImpl(
      newBranch: null == newBranch
          ? _value.newBranch
          : newBranch // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenEventBranchChangedImpl
    implements ProjectNameScreenEventBranchChanged {
  const _$ProjectNameScreenEventBranchChangedImpl({required this.newBranch});

  @override
  final String newBranch;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.branchChanged(newBranch: $newBranch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenEventBranchChangedImpl &&
            (identical(other.newBranch, newBranch) ||
                other.newBranch == newBranch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newBranch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenEventBranchChangedImplCopyWith<
          _$ProjectNameScreenEventBranchChangedImpl>
      get copyWith => __$$ProjectNameScreenEventBranchChangedImplCopyWithImpl<
          _$ProjectNameScreenEventBranchChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
    required TResult Function(String newBranch) branchChanged,
  }) {
    return branchChanged(newBranch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
    TResult? Function(String newBranch)? branchChanged,
  }) {
    return branchChanged?.call(newBranch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    TResult Function(String newBranch)? branchChanged,
    required TResult orElse(),
  }) {
    if (branchChanged != null) {
      return branchChanged(newBranch);
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
    required TResult Function(ProjectNameScreenEventBranchChanged value)
        branchChanged,
  }) {
    return branchChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    TResult? Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
  }) {
    return branchChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenEventInit value)? init,
    TResult Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    TResult Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
    required TResult orElse(),
  }) {
    if (branchChanged != null) {
      return branchChanged(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenEventBranchChanged
    implements ProjectNameScreenEvent {
  const factory ProjectNameScreenEventBranchChanged(
          {required final String newBranch}) =
      _$ProjectNameScreenEventBranchChangedImpl;

  String get newBranch;
  @JsonKey(ignore: true)
  _$$ProjectNameScreenEventBranchChangedImplCopyWith<
          _$ProjectNameScreenEventBranchChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectNameScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenSRStub value) stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenSRStub value)? stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenSRStub value)? stub,
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
abstract class _$$ProjectNameScreenSRStubImplCopyWith<$Res> {
  factory _$$ProjectNameScreenSRStubImplCopyWith(
          _$ProjectNameScreenSRStubImpl value,
          $Res Function(_$ProjectNameScreenSRStubImpl) then) =
      __$$ProjectNameScreenSRStubImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectNameScreenSRStubImplCopyWithImpl<$Res>
    extends _$ProjectNameScreenSRCopyWithImpl<$Res,
        _$ProjectNameScreenSRStubImpl>
    implements _$$ProjectNameScreenSRStubImplCopyWith<$Res> {
  __$$ProjectNameScreenSRStubImplCopyWithImpl(
      _$ProjectNameScreenSRStubImpl _value,
      $Res Function(_$ProjectNameScreenSRStubImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectNameScreenSRStubImpl implements ProjectNameScreenSRStub {
  const _$ProjectNameScreenSRStubImpl();

  @override
  String toString() {
    return 'ProjectNameScreenSR.stub()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenSRStubImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stub,
  }) {
    return stub();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stub,
  }) {
    return stub?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stub,
    required TResult orElse(),
  }) {
    if (stub != null) {
      return stub();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenSRStub value) stub,
  }) {
    return stub(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenSRStub value)? stub,
  }) {
    return stub?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenSRStub value)? stub,
    required TResult orElse(),
  }) {
    if (stub != null) {
      return stub(this);
    }
    return orElse();
  }
}

abstract class ProjectNameScreenSRStub implements ProjectNameScreenSR {
  const factory ProjectNameScreenSRStub() = _$ProjectNameScreenSRStubImpl;
}

/// @nodoc
mixin _$ProjectNameScreenState {
  Config get config => throw _privateConstructorUsedError;
  bool get projectExists => throw _privateConstructorUsedError;
  List<String> get branches => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Config config, bool projectExists, List<String> branches)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, bool projectExists, List<String> branches)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, bool projectExists, List<String> branches)?
        data,
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
  $Res call({Config config, bool projectExists, List<String> branches});

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
    Object? branches = null,
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
      branches: null == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$ProjectNameScreenStateDataImplCopyWith<$Res>
    implements $ProjectNameScreenStateCopyWith<$Res> {
  factory _$$ProjectNameScreenStateDataImplCopyWith(
          _$ProjectNameScreenStateDataImpl value,
          $Res Function(_$ProjectNameScreenStateDataImpl) then) =
      __$$ProjectNameScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, bool projectExists, List<String> branches});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ProjectNameScreenStateDataImplCopyWithImpl<$Res>
    extends _$ProjectNameScreenStateCopyWithImpl<$Res,
        _$ProjectNameScreenStateDataImpl>
    implements _$$ProjectNameScreenStateDataImplCopyWith<$Res> {
  __$$ProjectNameScreenStateDataImplCopyWithImpl(
      _$ProjectNameScreenStateDataImpl _value,
      $Res Function(_$ProjectNameScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? projectExists = null,
    Object? branches = null,
  }) {
    return _then(_$ProjectNameScreenStateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      branches: null == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProjectNameScreenStateDataImpl implements ProjectNameScreenStateData {
  const _$ProjectNameScreenStateDataImpl(
      {required this.config,
      this.projectExists = false,
      final List<String> branches = const []})
      : _branches = branches;

  @override
  final Config config;
  @override
  @JsonKey()
  final bool projectExists;
  final List<String> _branches;
  @override
  @JsonKey()
  List<String> get branches {
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branches);
  }

  @override
  String toString() {
    return 'ProjectNameScreenState.data(config: $config, projectExists: $projectExists, branches: $branches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, projectExists,
      const DeepCollectionEquality().hash(_branches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameScreenStateDataImplCopyWith<_$ProjectNameScreenStateDataImpl>
      get copyWith => __$$ProjectNameScreenStateDataImplCopyWithImpl<
          _$ProjectNameScreenStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Config config, bool projectExists, List<String> branches)
        data,
  }) {
    return data(config, projectExists, branches);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, bool projectExists, List<String> branches)?
        data,
  }) {
    return data?.call(config, projectExists, branches);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, bool projectExists, List<String> branches)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, projectExists, branches);
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
      final bool projectExists,
      final List<String> branches}) = _$ProjectNameScreenStateDataImpl;

  @override
  Config get config;
  @override
  bool get projectExists;
  @override
  List<String> get branches;
  @override
  @JsonKey(ignore: true)
  _$$ProjectNameScreenStateDataImplCopyWith<_$ProjectNameScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
