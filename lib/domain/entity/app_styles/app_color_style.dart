import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_style.dart';

part 'app_color_style.g.dart';

@JsonSerializable()
class AppColorStyle extends AppStyle {
  final int alpha;
  final int r;
  final int g;
  final int b;
  final double opacity;

  AppColorStyle(
      {required this.alpha,
      required this.r,
      required this.g,
      required this.b,
      required this.opacity,
      required super.id,
      required super.name});

  Color get color => Color.fromARGB(alpha, r, g, b).withOpacity(opacity);

  @override
  Map<String, dynamic> toJson() => _$AppColorStyleToJson(this);

  @override
  AppStyle fromJson(Map<String, dynamic> json) => AppColorStyle.fromJson(json);

  factory AppColorStyle.fromJson(Map<String, dynamic> json) =>
      _$AppColorStyleFromJson(json);
}
