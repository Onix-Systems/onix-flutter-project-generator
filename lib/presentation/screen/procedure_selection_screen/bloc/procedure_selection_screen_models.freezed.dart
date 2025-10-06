// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'procedure_selection_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcedureSelectionScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent()';
  }
}

/// @nodoc
class $ProcedureSelectionScreenEventCopyWith<$Res> {
  $ProcedureSelectionScreenEventCopyWith(ProcedureSelectionScreenEvent _,
      $Res Function(ProcedureSelectionScreenEvent) __);
}

/// Adds pattern-matching-related methods to [ProcedureSelectionScreenEvent].
extension ProcedureSelectionScreenEventPatterns
    on ProcedureSelectionScreenEvent {
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
    TResult Function(ProcedureSelectionScreenEventOpenProjectInStudio value)?
        onOpenInStudio,
    TResult Function(ProcedureSelectionScreenEventOnFlavorizrOutputClose value)?
        onFlavorizrOutputClose,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenEventInit() when init != null:
        return init(_that);
      case ProcedureSelectionScreenEventOnNewProject()
          when onNewProject != null:
        return onNewProject(_that);
      case ProcedureSelectionScreenEventOnProjectOpen()
          when onProjectOpen != null:
        return onProjectOpen(_that);
      case ProcedureSelectionScreenEventOnLocaleChange()
          when onLocaleChange != null:
        return onLocaleChange(_that);
      case ProcedureSelectionScreenEventOnAndroidSigning()
          when onGenerateAndroidSigning != null:
        return onGenerateAndroidSigning(_that);
      case ProcedureSelectionScreenEventOnGenerateFlavors()
          when onGenerateFlavors != null:
        return onGenerateFlavors(_that);
      case ProcedureSelectionScreenEventOpenProjectInStudio()
          when onOpenInStudio != null:
        return onOpenInStudio(_that);
      case ProcedureSelectionScreenEventOnFlavorizrOutputClose()
          when onFlavorizrOutputClose != null:
        return onFlavorizrOutputClose(_that);
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
    required TResult Function(
            ProcedureSelectionScreenEventOpenProjectInStudio value)
        onOpenInStudio,
    required TResult Function(
            ProcedureSelectionScreenEventOnFlavorizrOutputClose value)
        onFlavorizrOutputClose,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenEventInit():
        return init(_that);
      case ProcedureSelectionScreenEventOnNewProject():
        return onNewProject(_that);
      case ProcedureSelectionScreenEventOnProjectOpen():
        return onProjectOpen(_that);
      case ProcedureSelectionScreenEventOnLocaleChange():
        return onLocaleChange(_that);
      case ProcedureSelectionScreenEventOnAndroidSigning():
        return onGenerateAndroidSigning(_that);
      case ProcedureSelectionScreenEventOnGenerateFlavors():
        return onGenerateFlavors(_that);
      case ProcedureSelectionScreenEventOpenProjectInStudio():
        return onOpenInStudio(_that);
      case ProcedureSelectionScreenEventOnFlavorizrOutputClose():
        return onFlavorizrOutputClose(_that);
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
    TResult? Function(ProcedureSelectionScreenEventOpenProjectInStudio value)?
        onOpenInStudio,
    TResult? Function(
            ProcedureSelectionScreenEventOnFlavorizrOutputClose value)?
        onFlavorizrOutputClose,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenEventInit() when init != null:
        return init(_that);
      case ProcedureSelectionScreenEventOnNewProject()
          when onNewProject != null:
        return onNewProject(_that);
      case ProcedureSelectionScreenEventOnProjectOpen()
          when onProjectOpen != null:
        return onProjectOpen(_that);
      case ProcedureSelectionScreenEventOnLocaleChange()
          when onLocaleChange != null:
        return onLocaleChange(_that);
      case ProcedureSelectionScreenEventOnAndroidSigning()
          when onGenerateAndroidSigning != null:
        return onGenerateAndroidSigning(_that);
      case ProcedureSelectionScreenEventOnGenerateFlavors()
          when onGenerateFlavors != null:
        return onGenerateFlavors(_that);
      case ProcedureSelectionScreenEventOpenProjectInStudio()
          when onOpenInStudio != null:
        return onOpenInStudio(_that);
      case ProcedureSelectionScreenEventOnFlavorizrOutputClose()
          when onFlavorizrOutputClose != null:
        return onFlavorizrOutputClose(_that);
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
    TResult Function(String projectPath)? onNewProject,
    TResult Function(String projectURI)? onProjectOpen,
    TResult Function(String language)? onLocaleChange,
    TResult Function(
            Directory directory, List<String> signingVars, bool overwrite)?
        onGenerateAndroidSigning,
    TResult Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
    TResult Function()? onOpenInStudio,
    TResult Function()? onFlavorizrOutputClose,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenEventInit() when init != null:
        return init();
      case ProcedureSelectionScreenEventOnNewProject()
          when onNewProject != null:
        return onNewProject(_that.projectPath);
      case ProcedureSelectionScreenEventOnProjectOpen()
          when onProjectOpen != null:
        return onProjectOpen(_that.projectURI);
      case ProcedureSelectionScreenEventOnLocaleChange()
          when onLocaleChange != null:
        return onLocaleChange(_that.language);
      case ProcedureSelectionScreenEventOnAndroidSigning()
          when onGenerateAndroidSigning != null:
        return onGenerateAndroidSigning(
            _that.directory, _that.signingVars, _that.overwrite);
      case ProcedureSelectionScreenEventOnGenerateFlavors()
          when onGenerateFlavors != null:
        return onGenerateFlavors(_that.directory, _that.flavors);
      case ProcedureSelectionScreenEventOpenProjectInStudio()
          when onOpenInStudio != null:
        return onOpenInStudio();
      case ProcedureSelectionScreenEventOnFlavorizrOutputClose()
          when onFlavorizrOutputClose != null:
        return onFlavorizrOutputClose();
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
    required TResult Function(String projectPath) onNewProject,
    required TResult Function(String projectURI) onProjectOpen,
    required TResult Function(String language) onLocaleChange,
    required TResult Function(
            Directory directory, List<String> signingVars, bool overwrite)
        onGenerateAndroidSigning,
    required TResult Function(Directory directory, Set<String> flavors)
        onGenerateFlavors,
    required TResult Function() onOpenInStudio,
    required TResult Function() onFlavorizrOutputClose,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenEventInit():
        return init();
      case ProcedureSelectionScreenEventOnNewProject():
        return onNewProject(_that.projectPath);
      case ProcedureSelectionScreenEventOnProjectOpen():
        return onProjectOpen(_that.projectURI);
      case ProcedureSelectionScreenEventOnLocaleChange():
        return onLocaleChange(_that.language);
      case ProcedureSelectionScreenEventOnAndroidSigning():
        return onGenerateAndroidSigning(
            _that.directory, _that.signingVars, _that.overwrite);
      case ProcedureSelectionScreenEventOnGenerateFlavors():
        return onGenerateFlavors(_that.directory, _that.flavors);
      case ProcedureSelectionScreenEventOpenProjectInStudio():
        return onOpenInStudio();
      case ProcedureSelectionScreenEventOnFlavorizrOutputClose():
        return onFlavorizrOutputClose();
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
    TResult? Function(String projectPath)? onNewProject,
    TResult? Function(String projectURI)? onProjectOpen,
    TResult? Function(String language)? onLocaleChange,
    TResult? Function(
            Directory directory, List<String> signingVars, bool overwrite)?
        onGenerateAndroidSigning,
    TResult? Function(Directory directory, Set<String> flavors)?
        onGenerateFlavors,
    TResult? Function()? onOpenInStudio,
    TResult? Function()? onFlavorizrOutputClose,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenEventInit() when init != null:
        return init();
      case ProcedureSelectionScreenEventOnNewProject()
          when onNewProject != null:
        return onNewProject(_that.projectPath);
      case ProcedureSelectionScreenEventOnProjectOpen()
          when onProjectOpen != null:
        return onProjectOpen(_that.projectURI);
      case ProcedureSelectionScreenEventOnLocaleChange()
          when onLocaleChange != null:
        return onLocaleChange(_that.language);
      case ProcedureSelectionScreenEventOnAndroidSigning()
          when onGenerateAndroidSigning != null:
        return onGenerateAndroidSigning(
            _that.directory, _that.signingVars, _that.overwrite);
      case ProcedureSelectionScreenEventOnGenerateFlavors()
          when onGenerateFlavors != null:
        return onGenerateFlavors(_that.directory, _that.flavors);
      case ProcedureSelectionScreenEventOpenProjectInStudio()
          when onOpenInStudio != null:
        return onOpenInStudio();
      case ProcedureSelectionScreenEventOnFlavorizrOutputClose()
          when onFlavorizrOutputClose != null:
        return onFlavorizrOutputClose();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProcedureSelectionScreenEventInit
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.init()';
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOnNewProject
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOnNewProject({required this.projectPath});

  final String projectPath;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenEventOnNewProjectCopyWith<
          ProcedureSelectionScreenEventOnNewProject>
      get copyWith => _$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl<
          ProcedureSelectionScreenEventOnNewProject>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOnNewProject &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath);

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onNewProject(projectPath: $projectPath)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenEventOnNewProjectCopyWith<$Res>
    implements $ProcedureSelectionScreenEventCopyWith<$Res> {
  factory $ProcedureSelectionScreenEventOnNewProjectCopyWith(
          ProcedureSelectionScreenEventOnNewProject value,
          $Res Function(ProcedureSelectionScreenEventOnNewProject) _then) =
      _$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl;
  @useResult
  $Res call({String projectPath});
}

/// @nodoc
class _$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenEventOnNewProjectCopyWith<$Res> {
  _$ProcedureSelectionScreenEventOnNewProjectCopyWithImpl(
      this._self, this._then);

  final ProcedureSelectionScreenEventOnNewProject _self;
  final $Res Function(ProcedureSelectionScreenEventOnNewProject) _then;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectPath = null,
  }) {
    return _then(ProcedureSelectionScreenEventOnNewProject(
      projectPath: null == projectPath
          ? _self.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOnProjectOpen
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOnProjectOpen({required this.projectURI});

  final String projectURI;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenEventOnProjectOpenCopyWith<
          ProcedureSelectionScreenEventOnProjectOpen>
      get copyWith => _$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl<
          ProcedureSelectionScreenEventOnProjectOpen>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOnProjectOpen &&
            (identical(other.projectURI, projectURI) ||
                other.projectURI == projectURI));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectURI);

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onProjectOpen(projectURI: $projectURI)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenEventOnProjectOpenCopyWith<$Res>
    implements $ProcedureSelectionScreenEventCopyWith<$Res> {
  factory $ProcedureSelectionScreenEventOnProjectOpenCopyWith(
          ProcedureSelectionScreenEventOnProjectOpen value,
          $Res Function(ProcedureSelectionScreenEventOnProjectOpen) _then) =
      _$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl;
  @useResult
  $Res call({String projectURI});
}

/// @nodoc
class _$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenEventOnProjectOpenCopyWith<$Res> {
  _$ProcedureSelectionScreenEventOnProjectOpenCopyWithImpl(
      this._self, this._then);

  final ProcedureSelectionScreenEventOnProjectOpen _self;
  final $Res Function(ProcedureSelectionScreenEventOnProjectOpen) _then;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectURI = null,
  }) {
    return _then(ProcedureSelectionScreenEventOnProjectOpen(
      projectURI: null == projectURI
          ? _self.projectURI
          : projectURI // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOnLocaleChange
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOnLocaleChange({required this.language});

  final String language;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenEventOnLocaleChangeCopyWith<
          ProcedureSelectionScreenEventOnLocaleChange>
      get copyWith => _$ProcedureSelectionScreenEventOnLocaleChangeCopyWithImpl<
          ProcedureSelectionScreenEventOnLocaleChange>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOnLocaleChange &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onLocaleChange(language: $language)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenEventOnLocaleChangeCopyWith<$Res>
    implements $ProcedureSelectionScreenEventCopyWith<$Res> {
  factory $ProcedureSelectionScreenEventOnLocaleChangeCopyWith(
          ProcedureSelectionScreenEventOnLocaleChange value,
          $Res Function(ProcedureSelectionScreenEventOnLocaleChange) _then) =
      _$ProcedureSelectionScreenEventOnLocaleChangeCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$ProcedureSelectionScreenEventOnLocaleChangeCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenEventOnLocaleChangeCopyWith<$Res> {
  _$ProcedureSelectionScreenEventOnLocaleChangeCopyWithImpl(
      this._self, this._then);

  final ProcedureSelectionScreenEventOnLocaleChange _self;
  final $Res Function(ProcedureSelectionScreenEventOnLocaleChange) _then;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(ProcedureSelectionScreenEventOnLocaleChange(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOnAndroidSigning
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOnAndroidSigning(
      {required this.directory,
      required final List<String> signingVars,
      required this.overwrite})
      : _signingVars = signingVars;

  final Directory directory;
  final List<String> _signingVars;
  List<String> get signingVars {
    if (_signingVars is EqualUnmodifiableListView) return _signingVars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signingVars);
  }

  final bool overwrite;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenEventOnAndroidSigningCopyWith<
          ProcedureSelectionScreenEventOnAndroidSigning>
      get copyWith =>
          _$ProcedureSelectionScreenEventOnAndroidSigningCopyWithImpl<
              ProcedureSelectionScreenEventOnAndroidSigning>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOnAndroidSigning &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            const DeepCollectionEquality()
                .equals(other._signingVars, _signingVars) &&
            (identical(other.overwrite, overwrite) ||
                other.overwrite == overwrite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, directory,
      const DeepCollectionEquality().hash(_signingVars), overwrite);

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onGenerateAndroidSigning(directory: $directory, signingVars: $signingVars, overwrite: $overwrite)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenEventOnAndroidSigningCopyWith<
    $Res> implements $ProcedureSelectionScreenEventCopyWith<$Res> {
  factory $ProcedureSelectionScreenEventOnAndroidSigningCopyWith(
          ProcedureSelectionScreenEventOnAndroidSigning value,
          $Res Function(ProcedureSelectionScreenEventOnAndroidSigning) _then) =
      _$ProcedureSelectionScreenEventOnAndroidSigningCopyWithImpl;
  @useResult
  $Res call({Directory directory, List<String> signingVars, bool overwrite});
}

/// @nodoc
class _$ProcedureSelectionScreenEventOnAndroidSigningCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenEventOnAndroidSigningCopyWith<$Res> {
  _$ProcedureSelectionScreenEventOnAndroidSigningCopyWithImpl(
      this._self, this._then);

  final ProcedureSelectionScreenEventOnAndroidSigning _self;
  final $Res Function(ProcedureSelectionScreenEventOnAndroidSigning) _then;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? directory = null,
    Object? signingVars = null,
    Object? overwrite = null,
  }) {
    return _then(ProcedureSelectionScreenEventOnAndroidSigning(
      directory: null == directory
          ? _self.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as Directory,
      signingVars: null == signingVars
          ? _self._signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      overwrite: null == overwrite
          ? _self.overwrite
          : overwrite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOnGenerateFlavors
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOnGenerateFlavors(
      {required this.directory, required final Set<String> flavors})
      : _flavors = flavors;

  final Directory directory;
  final Set<String> _flavors;
  Set<String> get flavors {
    if (_flavors is EqualUnmodifiableSetView) return _flavors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_flavors);
  }

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenEventOnGenerateFlavorsCopyWith<
          ProcedureSelectionScreenEventOnGenerateFlavors>
      get copyWith =>
          _$ProcedureSelectionScreenEventOnGenerateFlavorsCopyWithImpl<
              ProcedureSelectionScreenEventOnGenerateFlavors>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOnGenerateFlavors &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            const DeepCollectionEquality().equals(other._flavors, _flavors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, directory, const DeepCollectionEquality().hash(_flavors));

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onGenerateFlavors(directory: $directory, flavors: $flavors)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenEventOnGenerateFlavorsCopyWith<
    $Res> implements $ProcedureSelectionScreenEventCopyWith<$Res> {
  factory $ProcedureSelectionScreenEventOnGenerateFlavorsCopyWith(
          ProcedureSelectionScreenEventOnGenerateFlavors value,
          $Res Function(ProcedureSelectionScreenEventOnGenerateFlavors) _then) =
      _$ProcedureSelectionScreenEventOnGenerateFlavorsCopyWithImpl;
  @useResult
  $Res call({Directory directory, Set<String> flavors});
}

/// @nodoc
class _$ProcedureSelectionScreenEventOnGenerateFlavorsCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenEventOnGenerateFlavorsCopyWith<$Res> {
  _$ProcedureSelectionScreenEventOnGenerateFlavorsCopyWithImpl(
      this._self, this._then);

  final ProcedureSelectionScreenEventOnGenerateFlavors _self;
  final $Res Function(ProcedureSelectionScreenEventOnGenerateFlavors) _then;

  /// Create a copy of ProcedureSelectionScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? directory = null,
    Object? flavors = null,
  }) {
    return _then(ProcedureSelectionScreenEventOnGenerateFlavors(
      directory: null == directory
          ? _self.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as Directory,
      flavors: null == flavors
          ? _self._flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOpenProjectInStudio
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOpenProjectInStudio();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOpenProjectInStudio);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onOpenInStudio()';
  }
}

/// @nodoc

class ProcedureSelectionScreenEventOnFlavorizrOutputClose
    implements ProcedureSelectionScreenEvent {
  const ProcedureSelectionScreenEventOnFlavorizrOutputClose();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenEventOnFlavorizrOutputClose);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenEvent.onFlavorizrOutputClose()';
  }
}

/// @nodoc
mixin _$ProcedureSelectionScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR()';
  }
}

/// @nodoc
class $ProcedureSelectionScreenSRCopyWith<$Res> {
  $ProcedureSelectionScreenSRCopyWith(ProcedureSelectionScreenSR _,
      $Res Function(ProcedureSelectionScreenSR) __);
}

/// Adds pattern-matching-related methods to [ProcedureSelectionScreenSR].
extension ProcedureSelectionScreenSRPatterns on ProcedureSelectionScreenSR {
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
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_EmptyConfig value)? emptyConfig,
    TResult Function(_onNewProject value)? onNewProject,
    TResult Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished(_that);
      case _EmptyConfig() when emptyConfig != null:
        return emptyConfig(_that);
      case _onNewProject() when onNewProject != null:
        return onNewProject(_that);
      case _onAndroidSigningCreated() when onAndroidSigningCreated != null:
        return onAndroidSigningCreated(_that);
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
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_EmptyConfig value) emptyConfig,
    required TResult Function(_onNewProject value) onNewProject,
    required TResult Function(_onAndroidSigningCreated value)
        onAndroidSigningCreated,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished():
        return loadFinished(_that);
      case _EmptyConfig():
        return emptyConfig(_that);
      case _onNewProject():
        return onNewProject(_that);
      case _onAndroidSigningCreated():
        return onAndroidSigningCreated(_that);
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
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_EmptyConfig value)? emptyConfig,
    TResult? Function(_onNewProject value)? onNewProject,
    TResult? Function(_onAndroidSigningCreated value)? onAndroidSigningCreated,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished(_that);
      case _EmptyConfig() when emptyConfig != null:
        return emptyConfig(_that);
      case _onNewProject() when onNewProject != null:
        return onNewProject(_that);
      case _onAndroidSigningCreated() when onAndroidSigningCreated != null:
        return onAndroidSigningCreated(_that);
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
    TResult Function()? loadFinished,
    TResult Function()? emptyConfig,
    TResult Function()? onNewProject,
    TResult Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished();
      case _EmptyConfig() when emptyConfig != null:
        return emptyConfig();
      case _onNewProject() when onNewProject != null:
        return onNewProject();
      case _onAndroidSigningCreated() when onAndroidSigningCreated != null:
        return onAndroidSigningCreated(_that.fingerprints);
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
    required TResult Function() loadFinished,
    required TResult Function() emptyConfig,
    required TResult Function() onNewProject,
    required TResult Function(List<Fingerprint> fingerprints)
        onAndroidSigningCreated,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished():
        return loadFinished();
      case _EmptyConfig():
        return emptyConfig();
      case _onNewProject():
        return onNewProject();
      case _onAndroidSigningCreated():
        return onAndroidSigningCreated(_that.fingerprints);
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
    TResult? Function()? loadFinished,
    TResult? Function()? emptyConfig,
    TResult? Function()? onNewProject,
    TResult? Function(List<Fingerprint> fingerprints)? onAndroidSigningCreated,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished();
      case _EmptyConfig() when emptyConfig != null:
        return emptyConfig();
      case _onNewProject() when onNewProject != null:
        return onNewProject();
      case _onAndroidSigningCreated() when onAndroidSigningCreated != null:
        return onAndroidSigningCreated(_that.fingerprints);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadFinished implements ProcedureSelectionScreenSR {
  const _LoadFinished();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.loadFinished()';
  }
}

/// @nodoc

class _EmptyConfig implements ProcedureSelectionScreenSR {
  const _EmptyConfig();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmptyConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.emptyConfig()';
  }
}

/// @nodoc

class _onNewProject implements ProcedureSelectionScreenSR {
  const _onNewProject();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _onNewProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.onNewProject()';
  }
}

/// @nodoc

class _onAndroidSigningCreated implements ProcedureSelectionScreenSR {
  const _onAndroidSigningCreated(
      {required final List<Fingerprint> fingerprints})
      : _fingerprints = fingerprints;

  final List<Fingerprint> _fingerprints;
  List<Fingerprint> get fingerprints {
    if (_fingerprints is EqualUnmodifiableListView) return _fingerprints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fingerprints);
  }

  /// Create a copy of ProcedureSelectionScreenSR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$onAndroidSigningCreatedCopyWith<_onAndroidSigningCreated> get copyWith =>
      __$onAndroidSigningCreatedCopyWithImpl<_onAndroidSigningCreated>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _onAndroidSigningCreated &&
            const DeepCollectionEquality()
                .equals(other._fingerprints, _fingerprints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_fingerprints));

  @override
  String toString() {
    return 'ProcedureSelectionScreenSR.onAndroidSigningCreated(fingerprints: $fingerprints)';
  }
}

/// @nodoc
abstract mixin class _$onAndroidSigningCreatedCopyWith<$Res>
    implements $ProcedureSelectionScreenSRCopyWith<$Res> {
  factory _$onAndroidSigningCreatedCopyWith(_onAndroidSigningCreated value,
          $Res Function(_onAndroidSigningCreated) _then) =
      __$onAndroidSigningCreatedCopyWithImpl;
  @useResult
  $Res call({List<Fingerprint> fingerprints});
}

/// @nodoc
class __$onAndroidSigningCreatedCopyWithImpl<$Res>
    implements _$onAndroidSigningCreatedCopyWith<$Res> {
  __$onAndroidSigningCreatedCopyWithImpl(this._self, this._then);

  final _onAndroidSigningCreated _self;
  final $Res Function(_onAndroidSigningCreated) _then;

  /// Create a copy of ProcedureSelectionScreenSR
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fingerprints = null,
  }) {
    return _then(_onAndroidSigningCreated(
      fingerprints: null == fingerprints
          ? _self._fingerprints
          : fingerprints // ignore: cast_nullable_to_non_nullable
              as List<Fingerprint>,
    ));
  }
}

/// @nodoc
mixin _$ProcedureSelectionScreenState {
  BranchConfig get branchConfig;
  dynamic get language;
  Directory? get flavorizingDirectory;
  Stream<List<OutputLine>>? get outputStream;
  bool get flavorizrOutputVisible;
  bool get isGenerating;

  /// Create a copy of ProcedureSelectionScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenStateCopyWith<ProcedureSelectionScreenState>
      get copyWith => _$ProcedureSelectionScreenStateCopyWithImpl<
              ProcedureSelectionScreenState>(
          this as ProcedureSelectionScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenState &&
            (identical(other.branchConfig, branchConfig) ||
                other.branchConfig == branchConfig) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            (identical(other.flavorizingDirectory, flavorizingDirectory) ||
                other.flavorizingDirectory == flavorizingDirectory) &&
            (identical(other.outputStream, outputStream) ||
                other.outputStream == outputStream) &&
            (identical(other.flavorizrOutputVisible, flavorizrOutputVisible) ||
                other.flavorizrOutputVisible == flavorizrOutputVisible) &&
            (identical(other.isGenerating, isGenerating) ||
                other.isGenerating == isGenerating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      branchConfig,
      const DeepCollectionEquality().hash(language),
      flavorizingDirectory,
      outputStream,
      flavorizrOutputVisible,
      isGenerating);

  @override
  String toString() {
    return 'ProcedureSelectionScreenState(branchConfig: $branchConfig, language: $language, flavorizingDirectory: $flavorizingDirectory, outputStream: $outputStream, flavorizrOutputVisible: $flavorizrOutputVisible, isGenerating: $isGenerating)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenStateCopyWith<$Res> {
  factory $ProcedureSelectionScreenStateCopyWith(
          ProcedureSelectionScreenState value,
          $Res Function(ProcedureSelectionScreenState) _then) =
      _$ProcedureSelectionScreenStateCopyWithImpl;
  @useResult
  $Res call(
      {BranchConfig branchConfig,
      dynamic language,
      Directory? flavorizingDirectory,
      Stream<List<OutputLine>>? outputStream,
      bool flavorizrOutputVisible,
      bool isGenerating});

  $BranchConfigCopyWith<$Res> get branchConfig;
}

/// @nodoc
class _$ProcedureSelectionScreenStateCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenStateCopyWith<$Res> {
  _$ProcedureSelectionScreenStateCopyWithImpl(this._self, this._then);

  final ProcedureSelectionScreenState _self;
  final $Res Function(ProcedureSelectionScreenState) _then;

  /// Create a copy of ProcedureSelectionScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchConfig = null,
    Object? language = freezed,
    Object? flavorizingDirectory = freezed,
    Object? outputStream = freezed,
    Object? flavorizrOutputVisible = null,
    Object? isGenerating = null,
  }) {
    return _then(_self.copyWith(
      branchConfig: null == branchConfig
          ? _self.branchConfig
          : branchConfig // ignore: cast_nullable_to_non_nullable
              as BranchConfig,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flavorizingDirectory: freezed == flavorizingDirectory
          ? _self.flavorizingDirectory
          : flavorizingDirectory // ignore: cast_nullable_to_non_nullable
              as Directory?,
      outputStream: freezed == outputStream
          ? _self.outputStream
          : outputStream // ignore: cast_nullable_to_non_nullable
              as Stream<List<OutputLine>>?,
      flavorizrOutputVisible: null == flavorizrOutputVisible
          ? _self.flavorizrOutputVisible
          : flavorizrOutputVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isGenerating: null == isGenerating
          ? _self.isGenerating
          : isGenerating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ProcedureSelectionScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchConfigCopyWith<$Res> get branchConfig {
    return $BranchConfigCopyWith<$Res>(_self.branchConfig, (value) {
      return _then(_self.copyWith(branchConfig: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProcedureSelectionScreenState].
extension ProcedureSelectionScreenStatePatterns
    on ProcedureSelectionScreenState {
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
    TResult Function(ProcedureSelectionScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenStateData() when data != null:
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
    required TResult Function(ProcedureSelectionScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenStateData():
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
    TResult? Function(ProcedureSelectionScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenStateData() when data != null:
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
    TResult Function(
            BranchConfig branchConfig,
            dynamic language,
            Directory? flavorizingDirectory,
            Stream<List<OutputLine>>? outputStream,
            bool flavorizrOutputVisible,
            bool isGenerating)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenStateData() when data != null:
        return data(
            _that.branchConfig,
            _that.language,
            _that.flavorizingDirectory,
            _that.outputStream,
            _that.flavorizrOutputVisible,
            _that.isGenerating);
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
    required TResult Function(
            BranchConfig branchConfig,
            dynamic language,
            Directory? flavorizingDirectory,
            Stream<List<OutputLine>>? outputStream,
            bool flavorizrOutputVisible,
            bool isGenerating)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenStateData():
        return data(
            _that.branchConfig,
            _that.language,
            _that.flavorizingDirectory,
            _that.outputStream,
            _that.flavorizrOutputVisible,
            _that.isGenerating);
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
    TResult? Function(
            BranchConfig branchConfig,
            dynamic language,
            Directory? flavorizingDirectory,
            Stream<List<OutputLine>>? outputStream,
            bool flavorizrOutputVisible,
            bool isGenerating)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case ProcedureSelectionScreenStateData() when data != null:
        return data(
            _that.branchConfig,
            _that.language,
            _that.flavorizingDirectory,
            _that.outputStream,
            _that.flavorizrOutputVisible,
            _that.isGenerating);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProcedureSelectionScreenStateData
    implements ProcedureSelectionScreenState {
  const ProcedureSelectionScreenStateData(
      {required this.branchConfig,
      this.language = 'en',
      this.flavorizingDirectory,
      this.outputStream,
      this.flavorizrOutputVisible = false,
      this.isGenerating = false});

  @override
  final BranchConfig branchConfig;
  @override
  @JsonKey()
  final dynamic language;
  @override
  final Directory? flavorizingDirectory;
  @override
  final Stream<List<OutputLine>>? outputStream;
  @override
  @JsonKey()
  final bool flavorizrOutputVisible;
  @override
  @JsonKey()
  final bool isGenerating;

  /// Create a copy of ProcedureSelectionScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcedureSelectionScreenStateDataCopyWith<ProcedureSelectionScreenStateData>
      get copyWith => _$ProcedureSelectionScreenStateDataCopyWithImpl<
          ProcedureSelectionScreenStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcedureSelectionScreenStateData &&
            (identical(other.branchConfig, branchConfig) ||
                other.branchConfig == branchConfig) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            (identical(other.flavorizingDirectory, flavorizingDirectory) ||
                other.flavorizingDirectory == flavorizingDirectory) &&
            (identical(other.outputStream, outputStream) ||
                other.outputStream == outputStream) &&
            (identical(other.flavorizrOutputVisible, flavorizrOutputVisible) ||
                other.flavorizrOutputVisible == flavorizrOutputVisible) &&
            (identical(other.isGenerating, isGenerating) ||
                other.isGenerating == isGenerating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      branchConfig,
      const DeepCollectionEquality().hash(language),
      flavorizingDirectory,
      outputStream,
      flavorizrOutputVisible,
      isGenerating);

  @override
  String toString() {
    return 'ProcedureSelectionScreenState.data(branchConfig: $branchConfig, language: $language, flavorizingDirectory: $flavorizingDirectory, outputStream: $outputStream, flavorizrOutputVisible: $flavorizrOutputVisible, isGenerating: $isGenerating)';
  }
}

/// @nodoc
abstract mixin class $ProcedureSelectionScreenStateDataCopyWith<$Res>
    implements $ProcedureSelectionScreenStateCopyWith<$Res> {
  factory $ProcedureSelectionScreenStateDataCopyWith(
          ProcedureSelectionScreenStateData value,
          $Res Function(ProcedureSelectionScreenStateData) _then) =
      _$ProcedureSelectionScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BranchConfig branchConfig,
      dynamic language,
      Directory? flavorizingDirectory,
      Stream<List<OutputLine>>? outputStream,
      bool flavorizrOutputVisible,
      bool isGenerating});

  @override
  $BranchConfigCopyWith<$Res> get branchConfig;
}

/// @nodoc
class _$ProcedureSelectionScreenStateDataCopyWithImpl<$Res>
    implements $ProcedureSelectionScreenStateDataCopyWith<$Res> {
  _$ProcedureSelectionScreenStateDataCopyWithImpl(this._self, this._then);

  final ProcedureSelectionScreenStateData _self;
  final $Res Function(ProcedureSelectionScreenStateData) _then;

  /// Create a copy of ProcedureSelectionScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? branchConfig = null,
    Object? language = freezed,
    Object? flavorizingDirectory = freezed,
    Object? outputStream = freezed,
    Object? flavorizrOutputVisible = null,
    Object? isGenerating = null,
  }) {
    return _then(ProcedureSelectionScreenStateData(
      branchConfig: null == branchConfig
          ? _self.branchConfig
          : branchConfig // ignore: cast_nullable_to_non_nullable
              as BranchConfig,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flavorizingDirectory: freezed == flavorizingDirectory
          ? _self.flavorizingDirectory
          : flavorizingDirectory // ignore: cast_nullable_to_non_nullable
              as Directory?,
      outputStream: freezed == outputStream
          ? _self.outputStream
          : outputStream // ignore: cast_nullable_to_non_nullable
              as Stream<List<OutputLine>>?,
      flavorizrOutputVisible: null == flavorizrOutputVisible
          ? _self.flavorizrOutputVisible
          : flavorizrOutputVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isGenerating: null == isGenerating
          ? _self.isGenerating
          : isGenerating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ProcedureSelectionScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchConfigCopyWith<$Res> get branchConfig {
    return $BranchConfigCopyWith<$Res>(_self.branchConfig, (value) {
      return _then(_self.copyWith(branchConfig: value));
    });
  }
}

// dart format on
