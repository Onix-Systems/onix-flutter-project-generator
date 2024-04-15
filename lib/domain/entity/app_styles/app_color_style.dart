import 'dart:ui';

import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';

class AppColorStyle extends AppStyle {
  final Color color;

  AppColorStyle({
    required super.id,
    required super.name,
    required this.color,
  });

  AppColorStyle copyWithName({required String name}) => AppColorStyle(
        id: id,
        name: name,
        color: color,
      );

  @override
  String toString() => 'AppColorStyle(id: $id, name: $name, color: $color)';
}
