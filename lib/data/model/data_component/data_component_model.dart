import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/property/property_data_model.dart';

part 'data_component_model.g.dart';

@JsonSerializable()
class DataComponentModel {
  final String? name;
  final bool? generateRequest;
  final bool? generateResponse;
  final bool? isExist;
  final bool? isGenerated;
  final List<PropertyDataModel>? properties;
  final Set<String>? imports;
  final String? sourceName;
  final bool? isEnum;

  const DataComponentModel({
    required this.name,
    required this.generateRequest,
    required this.generateResponse,
    required this.isExist,
    required this.isGenerated,
    required this.properties,
    required this.imports,
    required this.sourceName,
    required this.isEnum,
  });

  factory DataComponentModel.fromJson(Map<String, dynamic> json) =>
      _$DataComponentModelFromJson(json);
}
