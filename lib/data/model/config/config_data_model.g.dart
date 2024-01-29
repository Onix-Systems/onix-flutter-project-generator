// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigDataModel _$ConfigDataModelFromJson(Map<String, dynamic> json) =>
    ConfigDataModel(
      localVersion: json['localVersion'] as String?,
      remoteVersion: json['remoteVersion'] as String?,
      projectPath: json['projectPath'] as String?,
      projectName: json['projectName'] as String?,
      projectExist: json['projectExist'] as bool?,
      organization: json['organization'] as String?,
      platforms: json['platforms'] == null
          ? null
          : PlatformsDataModel.fromJson(
              json['platforms'] as Map<String, dynamic>),
      flavorize: json['flavorize'] as bool?,
      flavor: json['flavor'] as String?,
      generateSigningKey: json['generateSigningKey'] as bool?,
      firebaseAuth: json['firebaseAuth'] as bool?,
      useSonar: json['useSonar'] as bool?,
      graphQL: json['graphQL'] as bool?,
      router: json['router'] as String?,
      localization: json['localization'] as String?,
      theming: json['theming'] as String?,
      signingVars: (json['signingVars'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      screens: (json['screens'] as List<dynamic>?)
          ?.map((e) => ScreenDataModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
      swaggerUrl: json['swaggerUrl'] as String?,
      dataComponents: (json['dataComponents'] as List<dynamic>?)
          ?.map((e) => DataComponentModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => SourceDataModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ConfigDataModelToJson(ConfigDataModel instance) =>
    <String, dynamic>{
      'localVersion': instance.localVersion,
      'remoteVersion': instance.remoteVersion,
      'projectPath': instance.projectPath,
      'projectName': instance.projectName,
      'projectExist': instance.projectExist,
      'organization': instance.organization,
      'platforms': instance.platforms,
      'flavorize': instance.flavorize,
      'flavor': instance.flavor,
      'generateSigningKey': instance.generateSigningKey,
      'firebaseAuth': instance.firebaseAuth,
      'useSonar': instance.useSonar,
      'graphQL': instance.graphQL,
      'router': instance.router,
      'localization': instance.localization,
      'theming': instance.theming,
      'signingVars': instance.signingVars,
      'screens': instance.screens?.toList(),
      'swaggerUrl': instance.swaggerUrl,
      'dataComponents': instance.dataComponents?.toList(),
      'sources': instance.sources?.toList(),
    };
