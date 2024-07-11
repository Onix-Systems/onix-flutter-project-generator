// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigImpl _$$ConfigImplFromJson(Map<String, dynamic> json) => _$ConfigImpl(
      branch: json['branch'] as String? ?? 'main',
      localVersion: json['localVersion'] as String? ?? '',
      remoteVersion: json['remoteVersion'] as String? ?? '',
      projectPath: json['projectPath'] as String? ?? '',
      projectName: json['projectName'] as String? ?? '',
      projectExists: json['projectExists'] as bool? ?? false,
      organization: json['organization'] as String? ?? '',
      platformsList: json['platformsList'] == null
          ? const PlatformsList()
          : PlatformsList.fromJson(
              json['platformsList'] as Map<String, dynamic>),
      flavorize: json['flavorize'] as bool? ?? false,
      flavors: json['flavors'] as String? ?? '',
      generateSigningKey: json['generateSigningKey'] as bool? ?? false,
      firebaseAuth: json['firebaseAuth'] as bool? ?? false,
      useSonar: json['useSonar'] as bool? ?? true,
      graphql: json['graphql'] as bool? ?? false,
      router: $enumDecodeNullable(_$ProjectRouterEnumMap, json['router']) ??
          ProjectRouter.goRouter,
      localization: $enumDecodeNullable(
              _$ProjectLocalizationEnumMap, json['localization']) ??
          ProjectLocalization.intl,
      theming: $enumDecodeNullable(_$ProjectThemingEnumMap, json['theming']) ??
          ProjectTheming.manual,
      signingVars: (json['signingVars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          AppConsts.defaultSigningVars,
      screens: (json['screens'] as List<dynamic>?)
              ?.map((e) => Screen.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      swaggerUrl: json['swaggerUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'localVersion': instance.localVersion,
      'remoteVersion': instance.remoteVersion,
      'projectPath': instance.projectPath,
      'projectName': instance.projectName,
      'projectExists': instance.projectExists,
      'organization': instance.organization,
      'platformsList': instance.platformsList,
      'flavorize': instance.flavorize,
      'flavors': instance.flavors,
      'generateSigningKey': instance.generateSigningKey,
      'firebaseAuth': instance.firebaseAuth,
      'useSonar': instance.useSonar,
      'graphql': instance.graphql,
      'router': _$ProjectRouterEnumMap[instance.router]!,
      'localization': _$ProjectLocalizationEnumMap[instance.localization]!,
      'theming': _$ProjectThemingEnumMap[instance.theming]!,
      'signingVars': instance.signingVars,
      'screens': instance.screens.toList(),
      'swaggerUrl': instance.swaggerUrl,
    };

const _$ProjectRouterEnumMap = {
  ProjectRouter.goRouter: 'goRouter',
  ProjectRouter.autoRouter: 'autoRouter',
};

const _$ProjectLocalizationEnumMap = {
  ProjectLocalization.intl: 'intl',
  ProjectLocalization.flutterGen: 'flutterGen',
};

const _$ProjectThemingEnumMap = {
  ProjectTheming.manual: 'manual',
  ProjectTheming.themeTailor: 'themeTailor',
};
