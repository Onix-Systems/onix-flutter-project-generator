// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  String get localVersion => throw _privateConstructorUsedError;

  String get remoteVersion => throw _privateConstructorUsedError;

  String get projectPath => throw _privateConstructorUsedError;

  String get projectName => throw _privateConstructorUsedError;

  bool get projectExists => throw _privateConstructorUsedError;

  String get organization => throw _privateConstructorUsedError;

  PlatformsList get platformsList => throw _privateConstructorUsedError;

  bool get flavorize => throw _privateConstructorUsedError;

  String get flavors => throw _privateConstructorUsedError;

  bool get generateSigningKey => throw _privateConstructorUsedError;

  bool get firebaseAuth => throw _privateConstructorUsedError;

  bool get useSonar => throw _privateConstructorUsedError;

  bool get graphql => throw _privateConstructorUsedError;

  ProjectRouter get router => throw _privateConstructorUsedError;

  ProjectLocalization get localization => throw _privateConstructorUsedError;

  ProjectTheming get theming => throw _privateConstructorUsedError;

  List<String> get signingVars => throw _privateConstructorUsedError;

  Set<Screen> get screens =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppStyle> get styles => throw _privateConstructorUsedError;

  String get swaggerUrl => throw _privateConstructorUsedError;

  Set<DataComponent> get dataComponents => throw _privateConstructorUsedError;

  Set<Source> get sources => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;

  @useResult
  $Res call(
      {String localVersion,
      String remoteVersion,
      String projectPath,
      String projectName,
      bool projectExists,
      String organization,
      PlatformsList platformsList,
      bool flavorize,
      String flavors,
      bool generateSigningKey,
      bool firebaseAuth,
      bool useSonar,
      bool graphql,
      ProjectRouter router,
      ProjectLocalization localization,
      ProjectTheming theming,
      List<String> signingVars,
      Set<Screen> screens,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<AppStyle> styles,
      String swaggerUrl,
      Set<DataComponent> dataComponents,
      Set<Source> sources});

  $PlatformsListCopyWith<$Res> get platformsList;
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localVersion = null,
    Object? remoteVersion = null,
    Object? projectPath = null,
    Object? projectName = null,
    Object? projectExists = null,
    Object? organization = null,
    Object? platformsList = null,
    Object? flavorize = null,
    Object? flavors = null,
    Object? generateSigningKey = null,
    Object? firebaseAuth = null,
    Object? useSonar = null,
    Object? graphql = null,
    Object? router = null,
    Object? localization = null,
    Object? theming = null,
    Object? signingVars = null,
    Object? screens = null,
    Object? styles = null,
    Object? swaggerUrl = null,
    Object? dataComponents = null,
    Object? sources = null,
  }) {
    return _then(_value.copyWith(
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersion: null == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      platformsList: null == platformsList
          ? _value.platformsList
          : platformsList // ignore: cast_nullable_to_non_nullable
              as PlatformsList,
      flavorize: null == flavorize
          ? _value.flavorize
          : flavorize // ignore: cast_nullable_to_non_nullable
              as bool,
      flavors: null == flavors
          ? _value.flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as String,
      generateSigningKey: null == generateSigningKey
          ? _value.generateSigningKey
          : generateSigningKey // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseAuth: null == firebaseAuth
          ? _value.firebaseAuth
          : firebaseAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      useSonar: null == useSonar
          ? _value.useSonar
          : useSonar // ignore: cast_nullable_to_non_nullable
              as bool,
      graphql: null == graphql
          ? _value.graphql
          : graphql // ignore: cast_nullable_to_non_nullable
              as bool,
      router: null == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as ProjectRouter,
      localization: null == localization
          ? _value.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as ProjectLocalization,
      theming: null == theming
          ? _value.theming
          : theming // ignore: cast_nullable_to_non_nullable
              as ProjectTheming,
      signingVars: null == signingVars
          ? _value.signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      screens: null == screens
          ? _value.screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
      styles: null == styles
          ? _value.styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AppStyle>,
      swaggerUrl: null == swaggerUrl
          ? _value.swaggerUrl
          : swaggerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      dataComponents: null == dataComponents
          ? _value.dataComponents
          : dataComponents // ignore: cast_nullable_to_non_nullable
              as Set<DataComponent>,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as Set<Source>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlatformsListCopyWith<$Res> get platformsList {
    return $PlatformsListCopyWith<$Res>(_value.platformsList, (value) {
      return _then(_value.copyWith(platformsList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfigImplCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$ConfigImplCopyWith(
          _$ConfigImpl value, $Res Function(_$ConfigImpl) then) =
      __$$ConfigImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String localVersion,
      String remoteVersion,
      String projectPath,
      String projectName,
      bool projectExists,
      String organization,
      PlatformsList platformsList,
      bool flavorize,
      String flavors,
      bool generateSigningKey,
      bool firebaseAuth,
      bool useSonar,
      bool graphql,
      ProjectRouter router,
      ProjectLocalization localization,
      ProjectTheming theming,
      List<String> signingVars,
      Set<Screen> screens,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<AppStyle> styles,
      String swaggerUrl,
      Set<DataComponent> dataComponents,
      Set<Source> sources});

  @override
  $PlatformsListCopyWith<$Res> get platformsList;
}

/// @nodoc
class __$$ConfigImplCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$ConfigImpl>
    implements _$$ConfigImplCopyWith<$Res> {
  __$$ConfigImplCopyWithImpl(
      _$ConfigImpl _value, $Res Function(_$ConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localVersion = null,
    Object? remoteVersion = null,
    Object? projectPath = null,
    Object? projectName = null,
    Object? projectExists = null,
    Object? organization = null,
    Object? platformsList = null,
    Object? flavorize = null,
    Object? flavors = null,
    Object? generateSigningKey = null,
    Object? firebaseAuth = null,
    Object? useSonar = null,
    Object? graphql = null,
    Object? router = null,
    Object? localization = null,
    Object? theming = null,
    Object? signingVars = null,
    Object? screens = null,
    Object? styles = null,
    Object? swaggerUrl = null,
    Object? dataComponents = null,
    Object? sources = null,
  }) {
    return _then(_$ConfigImpl(
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersion: null == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectExists: null == projectExists
          ? _value.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      platformsList: null == platformsList
          ? _value.platformsList
          : platformsList // ignore: cast_nullable_to_non_nullable
              as PlatformsList,
      flavorize: null == flavorize
          ? _value.flavorize
          : flavorize // ignore: cast_nullable_to_non_nullable
              as bool,
      flavors: null == flavors
          ? _value.flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as String,
      generateSigningKey: null == generateSigningKey
          ? _value.generateSigningKey
          : generateSigningKey // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseAuth: null == firebaseAuth
          ? _value.firebaseAuth
          : firebaseAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      useSonar: null == useSonar
          ? _value.useSonar
          : useSonar // ignore: cast_nullable_to_non_nullable
              as bool,
      graphql: null == graphql
          ? _value.graphql
          : graphql // ignore: cast_nullable_to_non_nullable
              as bool,
      router: null == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as ProjectRouter,
      localization: null == localization
          ? _value.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as ProjectLocalization,
      theming: null == theming
          ? _value.theming
          : theming // ignore: cast_nullable_to_non_nullable
              as ProjectTheming,
      signingVars: null == signingVars
          ? _value._signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      screens: null == screens
          ? _value._screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
      styles: null == styles
          ? _value._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AppStyle>,
      swaggerUrl: null == swaggerUrl
          ? _value.swaggerUrl
          : swaggerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      dataComponents: null == dataComponents
          ? _value._dataComponents
          : dataComponents // ignore: cast_nullable_to_non_nullable
              as Set<DataComponent>,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as Set<Source>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigImpl extends _Config {
  const _$ConfigImpl(
      {this.localVersion = '',
      this.remoteVersion = '',
      this.projectPath = '',
      this.projectName = '',
      this.projectExists = false,
      this.organization = '',
      this.platformsList = const PlatformsList(),
      this.flavorize = false,
      this.flavors = '',
      this.generateSigningKey = false,
      this.firebaseAuth = false,
      this.useSonar = true,
      this.graphql = false,
      this.router = ProjectRouter.goRouter,
      this.localization = ProjectLocalization.intl,
      this.theming = ProjectTheming.manual,
      final List<String> signingVars = const [
        'Your Name',
        'Department',
        'Your Company',
        'Your City',
        'Your State or Province',
        'UA',
        ''
      ],
      final Set<Screen> screens = const {},
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<AppStyle> styles = const [],
      this.swaggerUrl = '',
      final Set<DataComponent> dataComponents = const {},
      final Set<Source> sources = const {}})
      : _signingVars = signingVars,
        _screens = screens,
        _styles = styles,
        _dataComponents = dataComponents,
        _sources = sources,
        super._();

  factory _$ConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigImplFromJson(json);

  @override
  @JsonKey()
  final String localVersion;
  @override
  @JsonKey()
  final String remoteVersion;
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
  final Set<DataComponent> _dataComponents;

  @override
  @JsonKey()
  Set<DataComponent> get dataComponents {
    if (_dataComponents is EqualUnmodifiableSetView) return _dataComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_dataComponents);
  }

  final Set<Source> _sources;

  @override
  @JsonKey()
  Set<Source> get sources {
    if (_sources is EqualUnmodifiableSetView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_sources);
  }

  @override
  String toString() {
    return 'Config(localVersion: $localVersion, remoteVersion: $remoteVersion, projectPath: $projectPath, projectName: $projectName, projectExists: $projectExists, organization: $organization, platformsList: $platformsList, flavorize: $flavorize, flavors: $flavors, generateSigningKey: $generateSigningKey, firebaseAuth: $firebaseAuth, useSonar: $useSonar, graphql: $graphql, router: $router, localization: $localization, theming: $theming, signingVars: $signingVars, screens: $screens, styles: $styles, swaggerUrl: $swaggerUrl, dataComponents: $dataComponents, sources: $sources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigImpl &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion) &&
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
            const DeepCollectionEquality()
                .equals(other._dataComponents, _dataComponents) &&
            const DeepCollectionEquality().equals(other._sources, _sources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        localVersion,
        remoteVersion,
        projectPath,
        projectName,
        projectExists,
        organization,
        platformsList,
        flavorize,
        flavors,
        generateSigningKey,
        firebaseAuth,
        useSonar,
        graphql,
        router,
        localization,
        theming,
        const DeepCollectionEquality().hash(_signingVars),
        const DeepCollectionEquality().hash(_screens),
        const DeepCollectionEquality().hash(_styles),
        swaggerUrl,
        const DeepCollectionEquality().hash(_dataComponents),
        const DeepCollectionEquality().hash(_sources)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      __$$ConfigImplCopyWithImpl<_$ConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigImplToJson(
      this,
    );
  }
}

abstract class _Config extends Config {
  const factory _Config(
      {final String localVersion,
      final String remoteVersion,
      final String projectPath,
      final String projectName,
      final bool projectExists,
      final String organization,
      final PlatformsList platformsList,
      final bool flavorize,
      final String flavors,
      final bool generateSigningKey,
      final bool firebaseAuth,
      final bool useSonar,
      final bool graphql,
      final ProjectRouter router,
      final ProjectLocalization localization,
      final ProjectTheming theming,
      final List<String> signingVars,
      final Set<Screen> screens,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<AppStyle> styles,
      final String swaggerUrl,
      final Set<DataComponent> dataComponents,
      final Set<Source> sources}) = _$ConfigImpl;

  const _Config._() : super._();

  factory _Config.fromJson(Map<String, dynamic> json) = _$ConfigImpl.fromJson;

  @override
  String get localVersion;

  @override
  String get remoteVersion;

  @override
  String get projectPath;

  @override
  String get projectName;

  @override
  bool get projectExists;

  @override
  String get organization;

  @override
  PlatformsList get platformsList;

  @override
  bool get flavorize;

  @override
  String get flavors;

  @override
  bool get generateSigningKey;

  @override
  bool get firebaseAuth;

  @override
  bool get useSonar;

  @override
  bool get graphql;

  @override
  ProjectRouter get router;

  @override
  ProjectLocalization get localization;

  @override
  ProjectTheming get theming;

  @override
  List<String> get signingVars;

  @override
  Set<Screen> get screens;

  @override // ignore: invalid_annotation_target
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppStyle> get styles;

  @override
  String get swaggerUrl;

  @override
  Set<DataComponent> get dataComponents;

  @override
  Set<Source> get sources;

  @override
  @JsonKey(ignore: true)
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
