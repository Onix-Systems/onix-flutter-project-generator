// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_name_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectNameScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectNameScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectNameScreenEvent()';
  }
}

/// @nodoc
class $ProjectNameScreenEventCopyWith<$Res> {
  $ProjectNameScreenEventCopyWith(
      ProjectNameScreenEvent _, $Res Function(ProjectNameScreenEvent) __);
}

/// Adds pattern-matching-related methods to [ProjectNameScreenEvent].
extension ProjectNameScreenEventPatterns on ProjectNameScreenEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case ProjectNameScreenEventInit() when init != null:
        return init(_that);
      case ProjectNameScreenEventProjectNameChanged()
          when projectNameChanged != null:
        return projectNameChanged(_that);
      case ProjectNameScreenEventOrganizationChanged()
          when organizationChanged != null:
        return organizationChanged(_that);
      case ProjectNameScreenEventBranchChanged() when branchChanged != null:
        return branchChanged(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case ProjectNameScreenEventInit():
        return init(_that);
      case ProjectNameScreenEventProjectNameChanged():
        return projectNameChanged(_that);
      case ProjectNameScreenEventOrganizationChanged():
        return organizationChanged(_that);
      case ProjectNameScreenEventBranchChanged():
        return branchChanged(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenEventInit value)? init,
    TResult? Function(ProjectNameScreenEventProjectNameChanged value)?
        projectNameChanged,
    TResult? Function(ProjectNameScreenEventOrganizationChanged value)?
        organizationChanged,
    TResult? Function(ProjectNameScreenEventBranchChanged value)? branchChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenEventInit() when init != null:
        return init(_that);
      case ProjectNameScreenEventProjectNameChanged()
          when projectNameChanged != null:
        return projectNameChanged(_that);
      case ProjectNameScreenEventOrganizationChanged()
          when organizationChanged != null:
        return organizationChanged(_that);
      case ProjectNameScreenEventBranchChanged() when branchChanged != null:
        return branchChanged(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String projectName)? projectNameChanged,
    TResult Function(String organization)? organizationChanged,
    TResult Function(String newBranch)? branchChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenEventInit() when init != null:
        return init();
      case ProjectNameScreenEventProjectNameChanged()
          when projectNameChanged != null:
        return projectNameChanged(_that.projectName);
      case ProjectNameScreenEventOrganizationChanged()
          when organizationChanged != null:
        return organizationChanged(_that.organization);
      case ProjectNameScreenEventBranchChanged() when branchChanged != null:
        return branchChanged(_that.newBranch);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String projectName) projectNameChanged,
    required TResult Function(String organization) organizationChanged,
    required TResult Function(String newBranch) branchChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenEventInit():
        return init();
      case ProjectNameScreenEventProjectNameChanged():
        return projectNameChanged(_that.projectName);
      case ProjectNameScreenEventOrganizationChanged():
        return organizationChanged(_that.organization);
      case ProjectNameScreenEventBranchChanged():
        return branchChanged(_that.newBranch);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String projectName)? projectNameChanged,
    TResult? Function(String organization)? organizationChanged,
    TResult? Function(String newBranch)? branchChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenEventInit() when init != null:
        return init();
      case ProjectNameScreenEventProjectNameChanged()
          when projectNameChanged != null:
        return projectNameChanged(_that.projectName);
      case ProjectNameScreenEventOrganizationChanged()
          when organizationChanged != null:
        return organizationChanged(_that.organization);
      case ProjectNameScreenEventBranchChanged() when branchChanged != null:
        return branchChanged(_that.newBranch);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProjectNameScreenEventInit implements ProjectNameScreenEvent {
  const ProjectNameScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectNameScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectNameScreenEvent.init()';
  }
}

/// @nodoc

class ProjectNameScreenEventProjectNameChanged
    implements ProjectNameScreenEvent {
  const ProjectNameScreenEventProjectNameChanged({required this.projectName});

  final String projectName;

  /// Create a copy of ProjectNameScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectNameScreenEventProjectNameChangedCopyWith<
          ProjectNameScreenEventProjectNameChanged>
      get copyWith => _$ProjectNameScreenEventProjectNameChangedCopyWithImpl<
          ProjectNameScreenEventProjectNameChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectNameScreenEventProjectNameChanged &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  @override
  String toString() {
    return 'ProjectNameScreenEvent.projectNameChanged(projectName: $projectName)';
  }
}

/// @nodoc
abstract mixin class $ProjectNameScreenEventProjectNameChangedCopyWith<$Res>
    implements $ProjectNameScreenEventCopyWith<$Res> {
  factory $ProjectNameScreenEventProjectNameChangedCopyWith(
          ProjectNameScreenEventProjectNameChanged value,
          $Res Function(ProjectNameScreenEventProjectNameChanged) _then) =
      _$ProjectNameScreenEventProjectNameChangedCopyWithImpl;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class _$ProjectNameScreenEventProjectNameChangedCopyWithImpl<$Res>
    implements $ProjectNameScreenEventProjectNameChangedCopyWith<$Res> {
  _$ProjectNameScreenEventProjectNameChangedCopyWithImpl(
      this._self, this._then);

  final ProjectNameScreenEventProjectNameChanged _self;
  final $Res Function(ProjectNameScreenEventProjectNameChanged) _then;

  /// Create a copy of ProjectNameScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectName = null,
  }) {
    return _then(ProjectNameScreenEventProjectNameChanged(
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProjectNameScreenEventOrganizationChanged
    implements ProjectNameScreenEvent {
  const ProjectNameScreenEventOrganizationChanged({required this.organization});

  final String organization;

  /// Create a copy of ProjectNameScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectNameScreenEventOrganizationChangedCopyWith<
          ProjectNameScreenEventOrganizationChanged>
      get copyWith => _$ProjectNameScreenEventOrganizationChangedCopyWithImpl<
          ProjectNameScreenEventOrganizationChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectNameScreenEventOrganizationChanged &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organization);

  @override
  String toString() {
    return 'ProjectNameScreenEvent.organizationChanged(organization: $organization)';
  }
}

/// @nodoc
abstract mixin class $ProjectNameScreenEventOrganizationChangedCopyWith<$Res>
    implements $ProjectNameScreenEventCopyWith<$Res> {
  factory $ProjectNameScreenEventOrganizationChangedCopyWith(
          ProjectNameScreenEventOrganizationChanged value,
          $Res Function(ProjectNameScreenEventOrganizationChanged) _then) =
      _$ProjectNameScreenEventOrganizationChangedCopyWithImpl;
  @useResult
  $Res call({String organization});
}

/// @nodoc
class _$ProjectNameScreenEventOrganizationChangedCopyWithImpl<$Res>
    implements $ProjectNameScreenEventOrganizationChangedCopyWith<$Res> {
  _$ProjectNameScreenEventOrganizationChangedCopyWithImpl(
      this._self, this._then);

  final ProjectNameScreenEventOrganizationChanged _self;
  final $Res Function(ProjectNameScreenEventOrganizationChanged) _then;

  /// Create a copy of ProjectNameScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organization = null,
  }) {
    return _then(ProjectNameScreenEventOrganizationChanged(
      organization: null == organization
          ? _self.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProjectNameScreenEventBranchChanged implements ProjectNameScreenEvent {
  const ProjectNameScreenEventBranchChanged({required this.newBranch});

  final String newBranch;

  /// Create a copy of ProjectNameScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectNameScreenEventBranchChangedCopyWith<
          ProjectNameScreenEventBranchChanged>
      get copyWith => _$ProjectNameScreenEventBranchChangedCopyWithImpl<
          ProjectNameScreenEventBranchChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectNameScreenEventBranchChanged &&
            (identical(other.newBranch, newBranch) ||
                other.newBranch == newBranch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newBranch);

  @override
  String toString() {
    return 'ProjectNameScreenEvent.branchChanged(newBranch: $newBranch)';
  }
}

/// @nodoc
abstract mixin class $ProjectNameScreenEventBranchChangedCopyWith<$Res>
    implements $ProjectNameScreenEventCopyWith<$Res> {
  factory $ProjectNameScreenEventBranchChangedCopyWith(
          ProjectNameScreenEventBranchChanged value,
          $Res Function(ProjectNameScreenEventBranchChanged) _then) =
      _$ProjectNameScreenEventBranchChangedCopyWithImpl;
  @useResult
  $Res call({String newBranch});
}

/// @nodoc
class _$ProjectNameScreenEventBranchChangedCopyWithImpl<$Res>
    implements $ProjectNameScreenEventBranchChangedCopyWith<$Res> {
  _$ProjectNameScreenEventBranchChangedCopyWithImpl(this._self, this._then);

  final ProjectNameScreenEventBranchChanged _self;
  final $Res Function(ProjectNameScreenEventBranchChanged) _then;

  /// Create a copy of ProjectNameScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? newBranch = null,
  }) {
    return _then(ProjectNameScreenEventBranchChanged(
      newBranch: null == newBranch
          ? _self.newBranch
          : newBranch // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProjectNameScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectNameScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectNameScreenSR()';
  }
}

/// @nodoc
class $ProjectNameScreenSRCopyWith<$Res> {
  $ProjectNameScreenSRCopyWith(
      ProjectNameScreenSR _, $Res Function(ProjectNameScreenSR) __);
}

/// Adds pattern-matching-related methods to [ProjectNameScreenSR].
extension ProjectNameScreenSRPatterns on ProjectNameScreenSR {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenSRStub value)? init,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenSRStub() when init != null:
        return init(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenSRStub value) init,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenSRStub():
        return init(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenSRStub value)? init,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenSRStub() when init != null:
        return init(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenSRStub() when init != null:
        return init();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenSRStub():
        return init();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenSRStub() when init != null:
        return init();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProjectNameScreenSRStub implements ProjectNameScreenSR {
  const ProjectNameScreenSRStub();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectNameScreenSRStub);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectNameScreenSR.init()';
  }
}

/// @nodoc
mixin _$ProjectNameScreenState {
  Config get config;
  bool get isValidProjectName;
  bool get isValidOrganizationName;
  List<String> get branches;

  /// Create a copy of ProjectNameScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectNameScreenStateCopyWith<ProjectNameScreenState> get copyWith =>
      _$ProjectNameScreenStateCopyWithImpl<ProjectNameScreenState>(
          this as ProjectNameScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectNameScreenState &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.isValidProjectName, isValidProjectName) ||
                other.isValidProjectName == isValidProjectName) &&
            (identical(
                    other.isValidOrganizationName, isValidOrganizationName) ||
                other.isValidOrganizationName == isValidOrganizationName) &&
            const DeepCollectionEquality().equals(other.branches, branches));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, isValidProjectName,
      isValidOrganizationName, const DeepCollectionEquality().hash(branches));

  @override
  String toString() {
    return 'ProjectNameScreenState(config: $config, isValidProjectName: $isValidProjectName, isValidOrganizationName: $isValidOrganizationName, branches: $branches)';
  }
}

/// @nodoc
abstract mixin class $ProjectNameScreenStateCopyWith<$Res> {
  factory $ProjectNameScreenStateCopyWith(ProjectNameScreenState value,
          $Res Function(ProjectNameScreenState) _then) =
      _$ProjectNameScreenStateCopyWithImpl;
  @useResult
  $Res call(
      {Config config,
      bool isValidProjectName,
      bool isValidOrganizationName,
      List<String> branches});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ProjectNameScreenStateCopyWithImpl<$Res>
    implements $ProjectNameScreenStateCopyWith<$Res> {
  _$ProjectNameScreenStateCopyWithImpl(this._self, this._then);

  final ProjectNameScreenState _self;
  final $Res Function(ProjectNameScreenState) _then;

  /// Create a copy of ProjectNameScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? isValidProjectName = null,
    Object? isValidOrganizationName = null,
    Object? branches = null,
  }) {
    return _then(_self.copyWith(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      isValidProjectName: null == isValidProjectName
          ? _self.isValidProjectName
          : isValidProjectName // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidOrganizationName: null == isValidOrganizationName
          ? _self.isValidOrganizationName
          : isValidOrganizationName // ignore: cast_nullable_to_non_nullable
              as bool,
      branches: null == branches
          ? _self.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of ProjectNameScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProjectNameScreenState].
extension ProjectNameScreenStatePatterns on ProjectNameScreenState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectNameScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenStateData() when data != null:
        return data(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectNameScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenStateData():
        return data(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectNameScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenStateData() when data != null:
        return data(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, bool isValidProjectName,
            bool isValidOrganizationName, List<String> branches)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenStateData() when data != null:
        return data(_that.config, _that.isValidProjectName,
            _that.isValidOrganizationName, _that.branches);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, bool isValidProjectName,
            bool isValidOrganizationName, List<String> branches)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenStateData():
        return data(_that.config, _that.isValidProjectName,
            _that.isValidOrganizationName, _that.branches);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, bool isValidProjectName,
            bool isValidOrganizationName, List<String> branches)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectNameScreenStateData() when data != null:
        return data(_that.config, _that.isValidProjectName,
            _that.isValidOrganizationName, _that.branches);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProjectNameScreenStateData extends ProjectNameScreenState {
  const ProjectNameScreenStateData(
      {required this.config,
      this.isValidProjectName = false,
      this.isValidOrganizationName = false,
      final List<String> branches = const []})
      : _branches = branches,
        super._();

  @override
  final Config config;
  @override
  @JsonKey()
  final bool isValidProjectName;
  @override
  @JsonKey()
  final bool isValidOrganizationName;
  final List<String> _branches;
  @override
  @JsonKey()
  List<String> get branches {
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branches);
  }

  /// Create a copy of ProjectNameScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectNameScreenStateDataCopyWith<ProjectNameScreenStateData>
      get copyWith =>
          _$ProjectNameScreenStateDataCopyWithImpl<ProjectNameScreenStateData>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectNameScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.isValidProjectName, isValidProjectName) ||
                other.isValidProjectName == isValidProjectName) &&
            (identical(
                    other.isValidOrganizationName, isValidOrganizationName) ||
                other.isValidOrganizationName == isValidOrganizationName) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, isValidProjectName,
      isValidOrganizationName, const DeepCollectionEquality().hash(_branches));

  @override
  String toString() {
    return 'ProjectNameScreenState.data(config: $config, isValidProjectName: $isValidProjectName, isValidOrganizationName: $isValidOrganizationName, branches: $branches)';
  }
}

/// @nodoc
abstract mixin class $ProjectNameScreenStateDataCopyWith<$Res>
    implements $ProjectNameScreenStateCopyWith<$Res> {
  factory $ProjectNameScreenStateDataCopyWith(ProjectNameScreenStateData value,
          $Res Function(ProjectNameScreenStateData) _then) =
      _$ProjectNameScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Config config,
      bool isValidProjectName,
      bool isValidOrganizationName,
      List<String> branches});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ProjectNameScreenStateDataCopyWithImpl<$Res>
    implements $ProjectNameScreenStateDataCopyWith<$Res> {
  _$ProjectNameScreenStateDataCopyWithImpl(this._self, this._then);

  final ProjectNameScreenStateData _self;
  final $Res Function(ProjectNameScreenStateData) _then;

  /// Create a copy of ProjectNameScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
    Object? isValidProjectName = null,
    Object? isValidOrganizationName = null,
    Object? branches = null,
  }) {
    return _then(ProjectNameScreenStateData(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      isValidProjectName: null == isValidProjectName
          ? _self.isValidProjectName
          : isValidProjectName // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidOrganizationName: null == isValidOrganizationName
          ? _self.isValidOrganizationName
          : isValidOrganizationName // ignore: cast_nullable_to_non_nullable
              as bool,
      branches: null == branches
          ? _self._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of ProjectNameScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

// dart format on
