// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      methodType: $enumDecode(_$MethodTypeEnumMap, json['methodType']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      entitiesNames: (json['entitiesNames'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'methodType': _$MethodTypeEnumMap[instance.methodType]!,
      'tags': instance.tags,
      'entitiesNames': instance.entitiesNames.toList(),
    };

const _$MethodTypeEnumMap = {
  MethodType.get: 'get',
  MethodType.post: 'post',
  MethodType.put: 'put',
  MethodType.delete: 'delete',
  MethodType.patch: 'patch',
};
