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
  String get projectPath => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  PlatformsList get platformsList => throw _privateConstructorUsedError;
  bool get flavorize => throw _privateConstructorUsedError;
  String get flavors => throw _privateConstructorUsedError;
  bool get generateSigningKey => throw _privateConstructorUsedError;
  bool get useSonar => throw _privateConstructorUsedError;
  ProjectRouter get router => throw _privateConstructorUsedError;
  ProjectLocalization get localization => throw _privateConstructorUsedError;
  ProjectTheming get theming => throw _privateConstructorUsedError;
  bool get integrateDevicePreview => throw _privateConstructorUsedError;
  List<String> get signingVars => throw _privateConstructorUsedError;
  Set<Screen> get screens => throw _privateConstructorUsedError;
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
      {String projectPath,
      String projectName,
      String organization,
      PlatformsList platformsList,
      bool flavorize,
      String flavors,
      bool generateSigningKey,
      bool useSonar,
      ProjectRouter router,
      ProjectLocalization localization,
      ProjectTheming theming,
      bool integrateDevicePreview,
      List<String> signingVars,
      Set<Screen> screens,
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
    Object? projectPath = null,
    Object? projectName = null,
    Object? organization = null,
    Object? platformsList = null,
    Object? flavorize = null,
    Object? flavors = null,
    Object? generateSigningKey = null,
    Object? useSonar = null,
    Object? router = null,
    Object? localization = null,
    Object? theming = null,
    Object? integrateDevicePreview = null,
    Object? signingVars = null,
    Object? screens = null,
    Object? swaggerUrl = null,
    Object? dataComponents = null,
    Object? sources = null,
  }) {
    return _then(_value.copyWith(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
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
      useSonar: null == useSonar
          ? _value.useSonar
          : useSonar // ignore: cast_nullable_to_non_nullable
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
      integrateDevicePreview: null == integrateDevicePreview
          ? _value.integrateDevicePreview
          : integrateDevicePreview // ignore: cast_nullable_to_non_nullable
              as bool,
      signingVars: null == signingVars
          ? _value.signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      screens: null == screens
          ? _value.screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
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
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectPath,
      String projectName,
      String organization,
      PlatformsList platformsList,
      bool flavorize,
      String flavors,
      bool generateSigningKey,
      bool useSonar,
      ProjectRouter router,
      ProjectLocalization localization,
      ProjectTheming theming,
      bool integrateDevicePreview,
      List<String> signingVars,
      Set<Screen> screens,
      String swaggerUrl,
      Set<DataComponent> dataComponents,
      Set<Source> sources});

  @override
  $PlatformsListCopyWith<$Res> get platformsList;
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
    Object? projectName = null,
    Object? organization = null,
    Object? platformsList = null,
    Object? flavorize = null,
    Object? flavors = null,
    Object? generateSigningKey = null,
    Object? useSonar = null,
    Object? router = null,
    Object? localization = null,
    Object? theming = null,
    Object? integrateDevicePreview = null,
    Object? signingVars = null,
    Object? screens = null,
    Object? swaggerUrl = null,
    Object? dataComponents = null,
    Object? sources = null,
  }) {
    return _then(_$_Config(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
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
      useSonar: null == useSonar
          ? _value.useSonar
          : useSonar // ignore: cast_nullable_to_non_nullable
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
      integrateDevicePreview: null == integrateDevicePreview
          ? _value.integrateDevicePreview
          : integrateDevicePreview // ignore: cast_nullable_to_non_nullable
              as bool,
      signingVars: null == signingVars
          ? _value._signingVars
          : signingVars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      screens: null == screens
          ? _value._screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
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
class _$_Config extends _Config {
  const _$_Config(
      {this.projectPath = '',
      this.projectName = '',
      this.organization = '',
      this.platformsList = const PlatformsList(),
      this.flavorize = false,
      this.flavors = '',
      this.generateSigningKey = false,
      this.useSonar = false,
      this.router = ProjectRouter.goRouter,
      this.localization = ProjectLocalization.intl,
      this.theming = ProjectTheming.manual,
      this.integrateDevicePreview = false,
      final List<String> signingVars = const [
        'Some developer',
        'Flutter dep',
        'Onix-Systems',
        'Kropyvnytskyi',
        'Kirovohrad oblast',
        'UA',
        ''
      ],
      final Set<Screen> screens = const {},
      this.swaggerUrl = '',
      final Set<DataComponent> dataComponents = const {},
      final Set<Source> sources = const {}})
      : _signingVars = signingVars,
        _screens = screens,
        _dataComponents = dataComponents,
        _sources = sources,
        super._();

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  @JsonKey()
  final String projectPath;
  @override
  @JsonKey()
  final String projectName;
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
  final bool useSonar;
  @override
  @JsonKey()
  final ProjectRouter router;
  @override
  @JsonKey()
  final ProjectLocalization localization;
  @override
  @JsonKey()
  final ProjectTheming theming;
  @override
  @JsonKey()
  final bool integrateDevicePreview;
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
    return 'Config(projectPath: $projectPath, projectName: $projectName, organization: $organization, platformsList: $platformsList, flavorize: $flavorize, flavors: $flavors, generateSigningKey: $generateSigningKey, useSonar: $useSonar, router: $router, localization: $localization, theming: $theming, integrateDevicePreview: $integrateDevicePreview, signingVars: $signingVars, screens: $screens, swaggerUrl: $swaggerUrl, dataComponents: $dataComponents, sources: $sources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.platformsList, platformsList) ||
                other.platformsList == platformsList) &&
            (identical(other.flavorize, flavorize) ||
                other.flavorize == flavorize) &&
            (identical(other.flavors, flavors) || other.flavors == flavors) &&
            (identical(other.generateSigningKey, generateSigningKey) ||
                other.generateSigningKey == generateSigningKey) &&
            (identical(other.useSonar, useSonar) ||
                other.useSonar == useSonar) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.localization, localization) ||
                other.localization == localization) &&
            (identical(other.theming, theming) || other.theming == theming) &&
            (identical(other.integrateDevicePreview, integrateDevicePreview) ||
                other.integrateDevicePreview == integrateDevicePreview) &&
            const DeepCollectionEquality()
                .equals(other._signingVars, _signingVars) &&
            const DeepCollectionEquality().equals(other._screens, _screens) &&
            (identical(other.swaggerUrl, swaggerUrl) ||
                other.swaggerUrl == swaggerUrl) &&
            const DeepCollectionEquality()
                .equals(other._dataComponents, _dataComponents) &&
            const DeepCollectionEquality().equals(other._sources, _sources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectPath,
      projectName,
      organization,
      platformsList,
      flavorize,
      flavors,
      generateSigningKey,
      useSonar,
      router,
      localization,
      theming,
      integrateDevicePreview,
      const DeepCollectionEquality().hash(_signingVars),
      const DeepCollectionEquality().hash(_screens),
      swaggerUrl,
      const DeepCollectionEquality().hash(_dataComponents),
      const DeepCollectionEquality().hash(_sources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
  }
}

abstract class _Config extends Config {
  const factory _Config(
      {final String projectPath,
      final String projectName,
      final String organization,
      final PlatformsList platformsList,
      final bool flavorize,
      final String flavors,
      final bool generateSigningKey,
      final bool useSonar,
      final ProjectRouter router,
      final ProjectLocalization localization,
      final ProjectTheming theming,
      final bool integrateDevicePreview,
      final List<String> signingVars,
      final Set<Screen> screens,
      final String swaggerUrl,
      final Set<DataComponent> dataComponents,
      final Set<Source> sources}) = _$_Config;
  const _Config._() : super._();

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  String get projectPath;
  @override
  String get projectName;
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
  bool get useSonar;
  @override
  ProjectRouter get router;
  @override
  ProjectLocalization get localization;
  @override
  ProjectTheming get theming;
  @override
  bool get integrateDevicePreview;
  @override
  List<String> get signingVars;
  @override
  Set<Screen> get screens;
  @override
  String get swaggerUrl;
  @override
  Set<DataComponent> get dataComponents;
  @override
  Set<Source> get sources;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}
