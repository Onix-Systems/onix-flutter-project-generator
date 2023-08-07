import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class AppFilledButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final bool iconLeft;
  final bool big;
  final EdgeInsets? padding;
  final Size? minimumSize;
  final bool active;

  const AppFilledButton({
    required this.label,
    this.active = true,
    this.onPressed,
    this.color,
    this.icon,
    this.iconLeft = true,
    this.big = false,
    this.padding,
    this.minimumSize,
    super.key,
  });

  @override
  State<AppFilledButton> createState() => _AppFilledButtonState();
}

class _AppFilledButtonState extends State<AppFilledButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },
      onPressed: () => widget.active ? widget.onPressed?.call() : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.active
            ? hovered
                ? _textColor()
                : widget.color ?? AppColors.orange
            : AppColors.inactiveText,
        foregroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        minimumSize: widget.minimumSize ?? const Size(100, 60),
      ),
      child: widget.big
          ? Column(
              children: [
                if (widget.icon != null)
                  Icon(
                    widget.icon,
                    size: 100,
                    color: hovered
                        ? widget.color ?? AppColors.orange
                        : _textColor(),
                  ),
                Text(widget.label,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: hovered
                          ? widget.color ?? AppColors.orange
                          : _textColor(),
                    )),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null && widget.iconLeft) ...[
                  Icon(
                    widget.icon,
                    size: 25,
                    color: hovered
                        ? widget.color ?? AppColors.orange
                        : _textColor(),
                  ),
                  const Delimiter.width(10),
                ],
                Text(widget.label,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: hovered
                          ? widget.color ?? AppColors.orange
                          : _textColor(),
                    )),
                if (widget.icon != null && !widget.iconLeft) ...[
                  const Delimiter.width(10),
                  Icon(
                    widget.icon,
                    size: 25,
                    color: hovered
                        ? widget.color ?? AppColors.orange
                        : _textColor(),
                  ),
                ],
              ],
            ),
    );
  }

  Color _textColor() {
    return (widget.color ?? AppColors.orange).computeLuminance() >= 0.4
        ? AppColors.bgDark
        : AppColors.bgLight;
  }
}
