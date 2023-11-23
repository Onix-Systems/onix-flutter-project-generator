import 'dart:ui';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';

class AppColorStyle extends AppStyle {
  final Color color;

  AppColorStyle({
    required super.id,
    required super.name,
    required this.color,
  });
}
