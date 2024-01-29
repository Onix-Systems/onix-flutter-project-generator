import 'package:freezed_annotation/freezed_annotation.dart';

part 'platforms_data_model.g.dart';

@JsonSerializable()
class PlatformsDataModel {
  final bool? android;
  final bool? iOS;
  final bool? web;
  final bool? macOS;
  final bool? windows;
  final bool? linux;

  const PlatformsDataModel({
    required this.android,
    required this.iOS,
    required this.web,
    required this.macOS,
    required this.windows,
    required this.linux,
  });

  factory PlatformsDataModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformsDataModelFromJson(json);
}
