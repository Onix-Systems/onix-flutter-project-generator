import 'dart:ui';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';

class AppColorStyle extends AppStyle {
  final int alpha;
  final int r;
  final int g;
  final int b;
  final double opacity;

  AppColorStyle({
    required super.id,
    required super.name,
    required this.alpha,
    required this.r,
    required this.g,
    required this.b,
    required this.opacity,
  });

  Color get color => Color.fromARGB(alpha, r, g, b).withOpacity(opacity);
}
