import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/method/method_data_model.dart';

part 'path_data_model.g.dart';

@JsonSerializable()
class PathDataModel {
  final String path;
  final List<MethodDataModel> methods;

  const PathDataModel({required this.path, required this.methods});

  factory PathDataModel.fromJson(Map<String, dynamic> json) => _$PathDataModelFromJson(json);
}
