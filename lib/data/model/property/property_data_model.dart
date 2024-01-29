import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_data_model.g.dart';

@JsonSerializable()
class PropertyDataModel {
  final String? name;
  final String? type;
  final bool? nullable;
  final bool? isList;

  const PropertyDataModel({
    required this.name,
    required this.type,
    required this.nullable,
    required this.isList,
  });

  factory PropertyDataModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataModelFromJson(json);
}
