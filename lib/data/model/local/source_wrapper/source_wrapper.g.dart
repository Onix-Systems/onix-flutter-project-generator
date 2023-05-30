// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceWrapper _$SourceWrapperFromJson(Map<String, dynamic> json) =>
    SourceWrapper(
      name: json['name'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => EntityWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
      paths: (json['paths'] as List<dynamic>?)
              ?.map((e) => Path.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      exists: json['exists'] as bool? ?? false,
    );

Map<String, dynamic> _$SourceWrapperToJson(SourceWrapper instance) =>
    <String, dynamic>{
      'name': instance.name,
      'entities': instance.entities,
      'exists': instance.exists,
      'paths': instance.paths,
    };
