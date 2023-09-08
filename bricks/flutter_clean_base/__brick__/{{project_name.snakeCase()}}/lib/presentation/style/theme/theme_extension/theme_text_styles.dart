import 'package:{{project_name}}/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
{{^web_only}}import 'package:flutter_screenutil/flutter_screenutil.dart';{{/web_only}}
{{#theme_generate}}import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_text_styles.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onBuildContext)
class _$ThemeTextStyles {
  static List<TextStyle> fs28 = [
    TextStyle(
    {{^web_only}}fontSize: 28.sp,{{/web_only}}
    {{#web_only}}fontSize: 28,{{/web_only}}
    fontWeight: FontWeight.w700,
    color: AppColors.textLight,
    ),
    TextStyle(
    {{^web_only}}fontSize: 28.sp,{{/web_only}}
    {{#web_only}}fontSize: 28,{{/web_only}}
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
    ),
  ];

  static List<TextStyle> fs24 = [
    TextStyle(
    {{^web_only}}fontSize: 24.sp,{{/web_only}}
    {{#web_only}}fontSize: 24,{{/web_only}}
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    ),
    TextStyle(
    {{^web_only}}fontSize: 24.sp,{{/web_only}}
    {{#web_only}}fontSize: 24,{{/web_only}}
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
    ),
  ];

  static List<TextStyle> fs18 = [
    TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
    ),
    TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
  ];

  static List<TextStyle> button18 = [
    TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    ),
    TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
  ];

  static List<TextStyle> bodyText16 = [
    TextStyle(
    {{^web_only}}fontSize: 16.sp,{{/web_only}}
    {{#web_only}}fontSize: 16,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    ),
    TextStyle(
    {{^web_only}}fontSize: 16.sp,{{/web_only}}
    {{#web_only}}fontSize: 16,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
  ];

  static List<TextStyle> caption14 = [
    TextStyle(
    {{^web_only}}fontSize: 14.sp,{{/web_only}}
    {{#web_only}}fontSize: 14,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    ),
    TextStyle(
    {{^web_only}}fontSize: 14.sp,{{/web_only}}
    {{#web_only}}fontSize: 14,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
  ];
}{{/theme_generate}}
{{^theme_generate}}class ThemeTextStyles
    extends ThemeExtension<ThemeTextStyles> {
  {{^web_only}}static final light = ThemeTextStyles({{/web_only}}
  {{#web_only}}static const light = ThemeTextStyles({{/web_only}}
  fs28: TextStyle(
  {{^web_only}}fontSize: 28.sp,{{/web_only}}
  {{#web_only}}fontSize: 28,{{/web_only}}
  fontWeight: FontWeight.w700,
  color: AppColors.textLight,
  ),
  fs24: TextStyle(
  {{^web_only}}fontSize: 24.sp,{{/web_only}}
  {{#web_only}}fontSize: 24,{{/web_only}}
  fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    ),
    fs18: TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
    ),
    button18: TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
    ),
    bodyText16: TextStyle(
    {{^web_only}}fontSize: 16.sp,{{/web_only}}
    {{#web_only}}fontSize: 16,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
  ),
  caption14: TextStyle(
  {{^web_only}}fontSize: 14.sp,{{/web_only}}
  {{#web_only}}fontSize: 14,{{/web_only}}
  fontWeight: FontWeight.w400,
  color: AppColors.textLight,
  ),
  );

  {{^web_only}}static final dark = ThemeTextStyles({{/web_only}}
  {{#web_only}}static const dark = ThemeTextStyles({{/web_only}}
  fs28: TextStyle(
  {{^web_only}}fontSize: 28.sp,{{/web_only}}
  {{#web_only}}fontSize: 28,{{/web_only}}
  fontWeight: FontWeight.w600,
  color: AppColors.textDark,
  ),
  fs24: TextStyle(
  {{^web_only}}fontSize: 24.sp,{{/web_only}}
    {{#web_only}}fontSize: 24,{{/web_only}}
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
    ),
    fs18: TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
    button18: TextStyle(
    {{^web_only}}fontSize: 18.sp,{{/web_only}}
    {{#web_only}}fontSize: 18,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
    bodyText16: TextStyle(
    {{^web_only}}fontSize: 16.sp,{{/web_only}}
    {{#web_only}}fontSize: 16,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
    caption14: TextStyle(
    {{^web_only}}fontSize: 14.sp,{{/web_only}}
    {{#web_only}}fontSize: 14,{{/web_only}}
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    ),
  );

  final TextStyle? fs28;
  final TextStyle? fs24;
  final TextStyle? fs18;
  final TextStyle? button18;
  final TextStyle? bodyText16;
  final TextStyle? caption14;

  const ThemeTextStyles({
    required this.fs28,
    required this.fs24,
    required this.fs18,
    required this.button18,
    required this.bodyText16,
    required this.caption14,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? fs28,
    TextStyle? fs24,
    TextStyle? fs18,
    TextStyle? button18,
    TextStyle? bodyText16,
    TextStyle? caption14,
  }) {
    return ThemeTextStyles(
      fs28: fs28 ?? this.fs28,
      fs24: fs24 ?? this.fs24,
      fs18: fs18 ?? this.fs18,
      button18: button18 ?? this.button18,
      bodyText16: bodyText16 ?? this.bodyText16,
      caption14: caption14 ?? this.caption14,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other,
      double t,) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      fs28: TextStyle.lerp(fs28, other.fs28, t),
      fs24: TextStyle.lerp(fs24, other.fs24, t),
      fs18: TextStyle.lerp(fs18, other.fs18, t),
      button18: TextStyle.lerp(button18, other.button18, t),
      bodyText16: TextStyle.lerp(bodyText16, other.bodyText16, t),
      caption14: TextStyle.lerp(caption14, other.caption14, t),
    );
  }
}{{/theme_generate}}