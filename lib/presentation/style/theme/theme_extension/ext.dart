import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

extension ThemeFromContextExtension on BuildContext {
  // ignore: avoid-non-null-assertion
  ThemeColors get appColors => Theme.of(this).extension<ThemeColors>()!;

  ThemeTextStyles get appTextStyles =>
      // ignore: avoid-non-null-assertion
      Theme.of(this).extension<ThemeTextStyles>()!;
}
