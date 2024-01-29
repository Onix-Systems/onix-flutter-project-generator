import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_data_model.g.dart';

@JsonSerializable()
class ScreenDataModel {
  final String? name;
  final String? stateManager;
  final bool? exists;

  const ScreenDataModel({
    required this.name,
    required this.stateManager,
    required this.exists,
  });

  factory ScreenDataModel.fromJson(Map<String, dynamic> json) =>
      _$ScreenDataModelFromJson(json);
}
