// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Path _$PathFromJson(Map<String, dynamic> json) => Path(
      path: json['path'] as String,
      methods: (json['methods'] as List<dynamic>)
          .map((e) => Method.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
      'path': instance.path,
      'methods': instance.methods,
    };
