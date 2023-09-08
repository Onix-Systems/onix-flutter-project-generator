// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
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
      useSonar: json['useSonar'] as bool? ?? false,
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
          const [
            'Some developer',
            'Flutter dep',
            'Onix-Systems',
            'Kropyvnytskyi',
            'Kirovohrad oblast',
            'UA',
            ''
          ],
      screens: (json['screens'] as List<dynamic>?)
              ?.map((e) => Screen.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      swaggerUrl: json['swaggerUrl'] as String? ?? '',
      dataComponents: (json['dataComponents'] as List<dynamic>?)
              ?.map((e) => DataComponent.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      sources: (json['sources'] as List<dynamic>?)
              ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'projectPath': instance.projectPath,
      'projectName': instance.projectName,
      'projectExists': instance.projectExists,
      'organization': instance.organization,
      'platformsList': instance.platformsList,
      'flavorize': instance.flavorize,
      'flavors': instance.flavors,
      'generateSigningKey': instance.generateSigningKey,
      'useSonar': instance.useSonar,
      'graphql': instance.graphql,
      'router': _$ProjectRouterEnumMap[instance.router]!,
      'localization': _$ProjectLocalizationEnumMap[instance.localization]!,
      'theming': _$ProjectThemingEnumMap[instance.theming]!,
      'signingVars': instance.signingVars,
      'screens': instance.screens.toList(),
      'swaggerUrl': instance.swaggerUrl,
      'dataComponents': instance.dataComponents.toList(),
      'sources': instance.sources.toList(),
    };

const _$ProjectRouterEnumMap = {
  ProjectRouter.goRouter: 'goRouter',
  ProjectRouter.autoRouter: 'autoRouter',
};

const _$ProjectLocalizationEnumMap = {
  ProjectLocalization.intl: 'intl',
  ProjectLocalization.flutter_gen: 'flutter_gen',
};

const _$ProjectThemingEnumMap = {
  ProjectTheming.manual: 'manual',
  ProjectTheming.theme_tailor: 'theme_tailor',
};
