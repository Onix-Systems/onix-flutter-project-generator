// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Config {
  BranchConfig get branchConfig;
  ArchType get arch;
  String get projectPath;
  String get projectName;
  bool get projectExists;
  String get organization;
  PlatformsList get platformsList;
  ProjectStateManager get stateManager;
  bool get flavorize;
  String get flavors;
  bool get generateSigningKey;
  bool get firebaseAuth;
  bool get useSonar;
  bool get graphql;
  bool get screenUtil;
  ProjectRouter get router;
  ProjectLocalization get localization;
  ProjectTheming get theming;
  List<String> get signingVars;
  Set<Screen> get screens; // ignore: invalid_annotation_target
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppStyle> get styles;
  String get swaggerUrl;
  bool get sentry;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<Config> get copyWith =>
      _$ConfigCopyWithImpl<Config>(this as Config, _$identity);

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Config &&
            (identical(other.branchConfig, branchConfig) ||
                other.branchConfig == branchConfig) &&
            (identical(other.arch, arch) || other.arch == arch) &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.platformsList, platformsList) ||
                other.platformsList == platformsList) &&
            (identical(other.stateManager, stateManager) ||
                other.stateManager == stateManager) &&
            (identical(other.flavorize, flavorize) ||
                other.flavorize == flavorize) &&
            (identical(other.flavors, flavors) || other.flavors == flavors) &&
            (identical(other.generateSigningKey, generateSigningKey) ||
                other.generateSigningKey == generateSigningKey) &&
            (identical(other.firebaseAuth, firebaseAuth) ||
                other.firebaseAuth == firebaseAuth) &&
            (identical(other.useSonar, useSonar) ||
                other.useSonar == useSonar) &&
            (identical(other.graphql, graphql) || other.graphql == graphql) &&
            (identical(other.screenUtil, screenUtil) ||
                other.screenUtil == screenUtil) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.localization, localization) ||
                other.localization == localization) &&
            (identical(other.theming, theming) || other.theming == theming) &&
            const DeepCollectionEquality()
                .equals(other.signingVars, signingVars) &&
            const DeepCollectionEquality().equals(other.screens, screens) &&
            const DeepCollectionEquality().equals(other.styles, styles) &&
            (identical(other.swaggerUrl, swaggerUrl) ||
                other.swaggerUrl == swaggerUrl) &&
            (identical(other.sentry, sentry) || other.sentry == sentry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        branchConfig,
        arch,
        projectPath,
        projectName,
        projectExists,
        organization,
        platformsList,
        stateManager,
        flavorize,
        flavors,
        generateSigningKey,
        firebaseAuth,
        useSonar,
        graphql,
        screenUtil,
        router,
        localization,
        theming,
        const DeepCollectionEquality().hash(signingVars),
        const DeepCollectionEquality().hash(screens),
        const DeepCollectionEquality().hash(styles),
        swaggerUrl,
        sentry
      ]);

  @override
  String toString() {
    return 'Config(branchConfig: $branchConfig, arch: $arch, projectPath: $projectPath, projectName: $projectName, projectExists: $projectExists, organization: $organization, platformsList: $platformsList, stateManager: $stateManager, flavorize: $flavorize, flavors: $flavors, generateSigningKey: $generateSigningKey, firebaseAuth: $firebaseAuth, useSonar: $useSonar, graphql: $graphql, screenUtil: $screenUtil, router: $router, localization: $localization, theming: $theming, signingVars: $signingVars, screens: $screens, styles: $styles, swaggerUrl: $swaggerUrl, sentry: $sentry)';
  }
}

/// @nodoc
abstract mixin class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) _then) =
      _$ConfigCopyWithImpl;
  @useResult
  $Res call(
      {BranchConfig branchConfig,
      ArchType arch,
      String projectPath,
      String projectName,
      bool projectExists,
      String organization,
      PlatformsList platformsList,
      ProjectStateManager stateManager,
      bool flavorize,
      String flavors,
      bool generateSigningKey,
      bool firebaseAuth,
      bool useSonar,
      bool graphql,
      bool screenUtil,
      ProjectRouter router,
      ProjectLocalization localization,
      ProjectTheming theming,
      List<String> signingVars,
      Set<Screen> screens,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<AppStyle> styles,
      String swaggerUrl,
      bool sentry});

  $BranchConfigCopyWith<$Res> get branchConfig;
  $PlatformsListCopyWith<$Res> get platformsList;
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._self, this._then);

  final Config _self;
  final $Res Function(Config) _then;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchConfig = null,
    Object? arch = null,
    Object? projectPath = null,
    Object? projectName = null,
    Object? projectExists = null,
    Object? organization = null,
    Object? platformsList = null,
    Object? stateManager = null,
    Object? flavorize = null,
    Object? flavors = null,
    Object? generateSigningKey = null,
    Object? firebaseAuth = null,
    Object? useSonar = null,
    Object? graphql = null,
    Object? screenUtil = null,
    Object? router = null,
    Object? localization = null,
    Object? theming = null,
    Object? signingVars = null,
    Object? screens = null,
    Object? styles = null,
    Object? swaggerUrl = null,
    Object? sentry = null,
  }) {
    return _then(_self.copyWith(
      branchConfig: null == branchConfig
          ? _self.branchConfig
          : branchConfig // ignore: cast_nullable_to_non_nullable
              as BranchConfig,
      arch: null == arch
          ? _self.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as ArchType,
      projectPath: null == projectPath
          ? _self.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectExists: null == projectExists
          ? _self.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      organization: null == organization
          ? _self.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      platformsList: null == platformsList
          ? _self.platformsList
          : platformsList // ignore: cast_nullable_to_non_nullable
              as PlatformsList,
      stateManager: null == stateManager
          ? _self.stateManager
          : stateManager // ignore: cast_nullable_to_non_nullable
              as ProjectStateManager,
      flavorize: null == flavorize
          ? _self.flavorize
          : flavorize // ignore: cast_nullable_to_non_nullable
              as bool,
      flavors: null == flavors
          ? _self.flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as String,
      generateSigningKey: null == generateSigningKey
          ? _self.generateSigningKey
          : generateSigningKey // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseAuth: null == firebaseAuth
          ? _self.firebaseAuth
          : firebaseAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      useSonar: null == useSonar
          ? _self.useSonar
          : useSonar // ignore: cast_nullable_to_non_nullable
              as bool,
      graphql: null == graphql
          ? _self.graphql
          : graphql // ignore: cast_nullable_to_non_nullable
              as bool,
      screenUtil: null == screenUtil
          ? _self.screenUtil
          : screenUtil // ignore: cast_nullable_to_non_nullable
              as bool,
      router: null == router
          ? _self.router
          : router // ignore: cast_nullable_to_non_nullable
              as ProjectRouter,
      localization: null == localization
          ? _self.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as ProjectLocalization,
      theming: null == theming
          ? _self.theming
          : theming // ignore: cast_nullable_to_non_nullable
              as ProjectTheming,
      signingVars: null == signingVars
          ? _self.signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      screens: null == screens
          ? _self.screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
      styles: null == styles
          ? _self.styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AppStyle>,
      swaggerUrl: null == swaggerUrl
          ? _self.swaggerUrl
          : swaggerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sentry: null == sentry
          ? _self.sentry
          : sentry // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchConfigCopyWith<$Res> get branchConfig {
    return $BranchConfigCopyWith<$Res>(_self.branchConfig, (value) {
      return _then(_self.copyWith(branchConfig: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformsListCopyWith<$Res> get platformsList {
    return $PlatformsListCopyWith<$Res>(_self.platformsList, (value) {
      return _then(_self.copyWith(platformsList: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Config].
extension ConfigPatterns on Config {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Config value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_Config value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Config value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            BranchConfig branchConfig,
            ArchType arch,
            String projectPath,
            String projectName,
            bool projectExists,
            String organization,
            PlatformsList platformsList,
            ProjectStateManager stateManager,
            bool flavorize,
            String flavors,
            bool generateSigningKey,
            bool firebaseAuth,
            bool useSonar,
            bool graphql,
            bool screenUtil,
            ProjectRouter router,
            ProjectLocalization localization,
            ProjectTheming theming,
            List<String> signingVars,
            Set<Screen> screens,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<AppStyle> styles,
            String swaggerUrl,
            bool sentry)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
        return $default(
            _that.branchConfig,
            _that.arch,
            _that.projectPath,
            _that.projectName,
            _that.projectExists,
            _that.organization,
            _that.platformsList,
            _that.stateManager,
            _that.flavorize,
            _that.flavors,
            _that.generateSigningKey,
            _that.firebaseAuth,
            _that.useSonar,
            _that.graphql,
            _that.screenUtil,
            _that.router,
            _that.localization,
            _that.theming,
            _that.signingVars,
            _that.screens,
            _that.styles,
            _that.swaggerUrl,
            _that.sentry);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            BranchConfig branchConfig,
            ArchType arch,
            String projectPath,
            String projectName,
            bool projectExists,
            String organization,
            PlatformsList platformsList,
            ProjectStateManager stateManager,
            bool flavorize,
            String flavors,
            bool generateSigningKey,
            bool firebaseAuth,
            bool useSonar,
            bool graphql,
            bool screenUtil,
            ProjectRouter router,
            ProjectLocalization localization,
            ProjectTheming theming,
            List<String> signingVars,
            Set<Screen> screens,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<AppStyle> styles,
            String swaggerUrl,
            bool sentry)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config():
        return $default(
            _that.branchConfig,
            _that.arch,
            _that.projectPath,
            _that.projectName,
            _that.projectExists,
            _that.organization,
            _that.platformsList,
            _that.stateManager,
            _that.flavorize,
            _that.flavors,
            _that.generateSigningKey,
            _that.firebaseAuth,
            _that.useSonar,
            _that.graphql,
            _that.screenUtil,
            _that.router,
            _that.localization,
            _that.theming,
            _that.signingVars,
            _that.screens,
            _that.styles,
            _that.swaggerUrl,
            _that.sentry);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            BranchConfig branchConfig,
            ArchType arch,
            String projectPath,
            String projectName,
            bool projectExists,
            String organization,
            PlatformsList platformsList,
            ProjectStateManager stateManager,
            bool flavorize,
            String flavors,
            bool generateSigningKey,
            bool firebaseAuth,
            bool useSonar,
            bool graphql,
            bool screenUtil,
            ProjectRouter router,
            ProjectLocalization localization,
            ProjectTheming theming,
            List<String> signingVars,
            Set<Screen> screens,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<AppStyle> styles,
            String swaggerUrl,
            bool sentry)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
        return $default(
            _that.branchConfig,
            _that.arch,
            _that.projectPath,
            _that.projectName,
            _that.projectExists,
            _that.organization,
            _that.platformsList,
            _that.stateManager,
            _that.flavorize,
            _that.flavors,
            _that.generateSigningKey,
            _that.firebaseAuth,
            _that.useSonar,
            _that.graphql,
            _that.screenUtil,
            _that.router,
            _that.localization,
            _that.theming,
            _that.signingVars,
            _that.screens,
            _that.styles,
            _that.swaggerUrl,
            _that.sentry);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Config extends Config {
  const _Config(
      {this.branchConfig = const BranchConfig(),
      this.arch = ArchType.basic,
      this.projectPath = '',
      this.projectName = '',
      this.projectExists = false,
      this.organization = '',
      this.platformsList = const PlatformsList(),
      this.stateManager = ProjectStateManager.bloc,
      this.flavorize = false,
      this.flavors = '',
      this.generateSigningKey = false,
      this.firebaseAuth = false,
      this.useSonar = true,
      this.graphql = false,
      this.screenUtil = true,
      this.router = ProjectRouter.goRouter,
      this.localization = ProjectLocalization.intl,
      this.theming = ProjectTheming.manual,
      final List<String> signingVars = AppConsts.defaultSigningVars,
      final Set<Screen> screens = const {},
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<AppStyle> styles = const [],
      this.swaggerUrl = '',
      this.sentry = false})
      : _signingVars = signingVars,
        _screens = screens,
        _styles = styles,
        super._();
  factory _Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  @override
  @JsonKey()
  final BranchConfig branchConfig;
  @override
  @JsonKey()
  final ArchType arch;
  @override
  @JsonKey()
  final String projectPath;
  @override
  @JsonKey()
  final String projectName;
  @override
  @JsonKey()
  final bool projectExists;
  @override
  @JsonKey()
  final String organization;
  @override
  @JsonKey()
  final PlatformsList platformsList;
  @override
  @JsonKey()
  final ProjectStateManager stateManager;
  @override
  @JsonKey()
  final bool flavorize;
  @override
  @JsonKey()
  final String flavors;
  @override
  @JsonKey()
  final bool generateSigningKey;
  @override
  @JsonKey()
  final bool firebaseAuth;
  @override
  @JsonKey()
  final bool useSonar;
  @override
  @JsonKey()
  final bool graphql;
  @override
  @JsonKey()
  final bool screenUtil;
  @override
  @JsonKey()
  final ProjectRouter router;
  @override
  @JsonKey()
  final ProjectLocalization localization;
  @override
  @JsonKey()
  final ProjectTheming theming;
  final List<String> _signingVars;
  @override
  @JsonKey()
  List<String> get signingVars {
    if (_signingVars is EqualUnmodifiableListView) return _signingVars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signingVars);
  }

  final Set<Screen> _screens;
  @override
  @JsonKey()
  Set<Screen> get screens {
    if (_screens is EqualUnmodifiableSetView) return _screens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_screens);
  }

// ignore: invalid_annotation_target
  final List<AppStyle> _styles;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppStyle> get styles {
    if (_styles is EqualUnmodifiableListView) return _styles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_styles);
  }

  @override
  @JsonKey()
  final String swaggerUrl;
  @override
  @JsonKey()
  final bool sentry;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfigCopyWith<_Config> get copyWith =>
      __$ConfigCopyWithImpl<_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Config &&
            (identical(other.branchConfig, branchConfig) ||
                other.branchConfig == branchConfig) &&
            (identical(other.arch, arch) || other.arch == arch) &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.platformsList, platformsList) ||
                other.platformsList == platformsList) &&
            (identical(other.stateManager, stateManager) ||
                other.stateManager == stateManager) &&
            (identical(other.flavorize, flavorize) ||
                other.flavorize == flavorize) &&
            (identical(other.flavors, flavors) || other.flavors == flavors) &&
            (identical(other.generateSigningKey, generateSigningKey) ||
                other.generateSigningKey == generateSigningKey) &&
            (identical(other.firebaseAuth, firebaseAuth) ||
                other.firebaseAuth == firebaseAuth) &&
            (identical(other.useSonar, useSonar) ||
                other.useSonar == useSonar) &&
            (identical(other.graphql, graphql) || other.graphql == graphql) &&
            (identical(other.screenUtil, screenUtil) ||
                other.screenUtil == screenUtil) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.localization, localization) ||
                other.localization == localization) &&
            (identical(other.theming, theming) || other.theming == theming) &&
            const DeepCollectionEquality()
                .equals(other._signingVars, _signingVars) &&
            const DeepCollectionEquality().equals(other._screens, _screens) &&
            const DeepCollectionEquality().equals(other._styles, _styles) &&
            (identical(other.swaggerUrl, swaggerUrl) ||
                other.swaggerUrl == swaggerUrl) &&
            (identical(other.sentry, sentry) || other.sentry == sentry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        branchConfig,
        arch,
        projectPath,
        projectName,
        projectExists,
        organization,
        platformsList,
        stateManager,
        flavorize,
        flavors,
        generateSigningKey,
        firebaseAuth,
        useSonar,
        graphql,
        screenUtil,
        router,
        localization,
        theming,
        const DeepCollectionEquality().hash(_signingVars),
        const DeepCollectionEquality().hash(_screens),
        const DeepCollectionEquality().hash(_styles),
        swaggerUrl,
        sentry
      ]);

  @override
  String toString() {
    return 'Config(branchConfig: $branchConfig, arch: $arch, projectPath: $projectPath, projectName: $projectName, projectExists: $projectExists, organization: $organization, platformsList: $platformsList, stateManager: $stateManager, flavorize: $flavorize, flavors: $flavors, generateSigningKey: $generateSigningKey, firebaseAuth: $firebaseAuth, useSonar: $useSonar, graphql: $graphql, screenUtil: $screenUtil, router: $router, localization: $localization, theming: $theming, signingVars: $signingVars, screens: $screens, styles: $styles, swaggerUrl: $swaggerUrl, sentry: $sentry)';
  }
}

/// @nodoc
abstract mixin class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) _then) =
      __$ConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BranchConfig branchConfig,
      ArchType arch,
      String projectPath,
      String projectName,
      bool projectExists,
      String organization,
      PlatformsList platformsList,
      ProjectStateManager stateManager,
      bool flavorize,
      String flavors,
      bool generateSigningKey,
      bool firebaseAuth,
      bool useSonar,
      bool graphql,
      bool screenUtil,
      ProjectRouter router,
      ProjectLocalization localization,
      ProjectTheming theming,
      List<String> signingVars,
      Set<Screen> screens,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<AppStyle> styles,
      String swaggerUrl,
      bool sentry});

  @override
  $BranchConfigCopyWith<$Res> get branchConfig;
  @override
  $PlatformsListCopyWith<$Res> get platformsList;
}

/// @nodoc
class __$ConfigCopyWithImpl<$Res> implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(this._self, this._then);

  final _Config _self;
  final $Res Function(_Config) _then;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? branchConfig = null,
    Object? arch = null,
    Object? projectPath = null,
    Object? projectName = null,
    Object? projectExists = null,
    Object? organization = null,
    Object? platformsList = null,
    Object? stateManager = null,
    Object? flavorize = null,
    Object? flavors = null,
    Object? generateSigningKey = null,
    Object? firebaseAuth = null,
    Object? useSonar = null,
    Object? graphql = null,
    Object? screenUtil = null,
    Object? router = null,
    Object? localization = null,
    Object? theming = null,
    Object? signingVars = null,
    Object? screens = null,
    Object? styles = null,
    Object? swaggerUrl = null,
    Object? sentry = null,
  }) {
    return _then(_Config(
      branchConfig: null == branchConfig
          ? _self.branchConfig
          : branchConfig // ignore: cast_nullable_to_non_nullable
              as BranchConfig,
      arch: null == arch
          ? _self.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as ArchType,
      projectPath: null == projectPath
          ? _self.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectExists: null == projectExists
          ? _self.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      organization: null == organization
          ? _self.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      platformsList: null == platformsList
          ? _self.platformsList
          : platformsList // ignore: cast_nullable_to_non_nullable
              as PlatformsList,
      stateManager: null == stateManager
          ? _self.stateManager
          : stateManager // ignore: cast_nullable_to_non_nullable
              as ProjectStateManager,
      flavorize: null == flavorize
          ? _self.flavorize
          : flavorize // ignore: cast_nullable_to_non_nullable
              as bool,
      flavors: null == flavors
          ? _self.flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as String,
      generateSigningKey: null == generateSigningKey
          ? _self.generateSigningKey
          : generateSigningKey // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseAuth: null == firebaseAuth
          ? _self.firebaseAuth
          : firebaseAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      useSonar: null == useSonar
          ? _self.useSonar
          : useSonar // ignore: cast_nullable_to_non_nullable
              as bool,
      graphql: null == graphql
          ? _self.graphql
          : graphql // ignore: cast_nullable_to_non_nullable
              as bool,
      screenUtil: null == screenUtil
          ? _self.screenUtil
          : screenUtil // ignore: cast_nullable_to_non_nullable
              as bool,
      router: null == router
          ? _self.router
          : router // ignore: cast_nullable_to_non_nullable
              as ProjectRouter,
      localization: null == localization
          ? _self.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as ProjectLocalization,
      theming: null == theming
          ? _self.theming
          : theming // ignore: cast_nullable_to_non_nullable
              as ProjectTheming,
      signingVars: null == signingVars
          ? _self._signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      screens: null == screens
          ? _self._screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
      styles: null == styles
          ? _self._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AppStyle>,
      swaggerUrl: null == swaggerUrl
          ? _self.swaggerUrl
          : swaggerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sentry: null == sentry
          ? _self.sentry
          : sentry // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchConfigCopyWith<$Res> get branchConfig {
    return $BranchConfigCopyWith<$Res>(_self.branchConfig, (value) {
      return _then(_self.copyWith(branchConfig: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformsListCopyWith<$Res> get platformsList {
    return $PlatformsListCopyWith<$Res>(_self.platformsList, (value) {
      return _then(_self.copyWith(platformsList: value));
    });
  }
}

// dart format on
