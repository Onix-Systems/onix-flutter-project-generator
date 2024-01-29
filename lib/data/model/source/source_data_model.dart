import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/data/model/path/path_data_model.dart';

part 'source_data_model.g.dart';

@JsonSerializable()
class SourceDataModel {
  final String? name;
  final bool? isExist;
  final bool? isGenerated;
  final List<PathDataModel>? paths;
  final List<String>? dataComponentsNames;

  const SourceDataModel({
    required this.name,
    required this.isExist,
    required this.isGenerated,
    required this.paths,
    required this.dataComponentsNames,
  });

  factory SourceDataModel.fromJson(Map<String, dynamic> json) =>
      _$SourceDataModelFromJson(json);
}
