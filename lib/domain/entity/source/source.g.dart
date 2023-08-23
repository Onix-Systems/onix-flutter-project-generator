// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      name: json['name'] as String,
      dataComponents: (json['dataComponents'] as List<dynamic>)
          .map((e) => DataComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      exists: json['exists'] as bool? ?? false,
      isGenerated: json['isGenerated'] as bool? ?? true,
      paths: (json['paths'] as List<dynamic>?)
              ?.map((e) => Path.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tag: json['tag'] as String? ?? '',
      dataComponentsNames: (json['dataComponentsNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'name': instance.name,
      'dataComponents': instance.dataComponents,
      'exists': instance.exists,
      'isGenerated': instance.isGenerated,
      'paths': instance.paths,
      'tag': instance.tag,
      'dataComponentsNames': instance.dataComponentsNames,
    };
