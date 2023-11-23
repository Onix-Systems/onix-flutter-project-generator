import 'package:{{project_name}}/presentation/style/theme/theme_extension/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool enabled;
  final String label;
  final TextInputType? keyboardType;
  final BorderRadius? borderRadius;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const AppTextField({
    required this.label,
    this.enabled = true,
    this.controller,
    this.keyboardType,
    this.borderRadius,
    this.labelStyle,
    this.fillColor,
    this.obscureText = false,
    this.inputFormatters,
    this.onEditingComplete,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.appColors.textColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.appColors.textColor.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.appColors.buttonColor,
          ),
        ),
        labelText: label,
        labelStyle: enabled
            ? labelStyle ?? context.appTextStyles.fs18
            : labelStyle?.copyWith(
                    color: labelStyle?.color?.withOpacity(0.2)) ??
                context.appTextStyles.fs18?.copyWith(
                  color: context.appTextStyles.fs18?.color?.withOpacity(0.2),
                ),
        fillColor: fillColor,
        filled: fillColor != null,
      ),
      onEditingComplete: () => onEditingComplete?.call(),
      onChanged: (value) => onChanged?.call(value),
      onSubmitted: (value) => onSubmitted?.call(value),
    );
  }
}
