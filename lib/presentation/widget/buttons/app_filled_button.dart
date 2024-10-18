import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class AppFilledButton extends StatefulWidget {
  final FocusNode? focusNode;
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
    this.focusNode,
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
  Color get _defaultColor => context.appColors.textColor;
  bool hovered = false;
  bool focused = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: widget.focusNode,
      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },
      onFocusChange: (value) {
        setState(() {
          focused = value;
        });
      },
      onPressed: () => widget.active ? widget.onPressed?.call() : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.active
            ? hovered
                ? _textColor()
                : widget.color ?? _defaultColor
            : context.appColors.fadedColor,
        foregroundColor: _defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: focused
              ? BorderSide(
                  color: _defaultColor.withOpacity(0.7),
                  width: 2,
                )
              : BorderSide.none,
        ),
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
        minimumSize: widget.minimumSize ?? const Size(100, 40),
      ),
      child: widget.big
          ? Column(
              children: [
                if (widget.icon != null)
                  Icon(
                    widget.icon,
                    size: 75,
                    color:
                        hovered ? widget.color ?? _defaultColor : _textColor(),
                  ),
                Text(
                  widget.label,
                  style: context.appTextStyles.fs18?.copyWith(
                    color:
                        hovered ? widget.color ?? _defaultColor : _textColor(),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null && widget.iconLeft) ...[
                  Icon(
                    widget.icon,
                    size: 25,
                    color:
                        hovered ? widget.color ?? _defaultColor : _textColor(),
                  ),
                  const Delimiter.width(10),
                ],
                Text(
                  widget.label,
                  style: context.appTextStyles.fs18?.copyWith(
                    color:
                        hovered ? widget.color ?? _defaultColor : _textColor(),
                  ),
                ),
                if (widget.icon != null && !widget.iconLeft) ...[
                  const Delimiter.width(10),
                  Icon(
                    widget.icon,
                    size: 25,
                    color:
                        hovered ? widget.color ?? _defaultColor : _textColor(),
                  ),
                ],
              ],
            ),
    );
  }

  Color _textColor() {
    return (widget.color ?? context.appColors.controlColor)
                .computeLuminance() >=
            0.4
        ? context.appColors.darkColor
        : context.appColors.textColor;
  }
}
