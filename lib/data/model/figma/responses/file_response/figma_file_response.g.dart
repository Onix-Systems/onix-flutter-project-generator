// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaFileResponse _$FigmaFileResponseFromJson(Map<String, dynamic> json) =>
    FigmaFileResponse(
      name: json['name'] as String?,
      styles: (json['styles'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, FigmaNodeStyle.fromJson(e as Map<String, dynamic>)),
      ),
      document: json['document'] == null
          ? null
          : DocumentNodeDataModel.fromJson(
              json['document'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FigmaFileResponseToJson(FigmaFileResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'styles': instance.styles,
      'document': instance.document,
    };
