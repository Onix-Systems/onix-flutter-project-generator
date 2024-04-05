import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ColoredLine extends StatelessWidget {
  ColoredLine({
    super.key,
    required String line,
  }) {
    _process(line);
  }

  late final String line;
  late final Color color;
  late final String tag;

  void _process(String line) {
    tag = line.substring(0, line.indexOf('}') + 1);
    this.line = line.replaceFirst(tag, '');

    switch (tag) {
      case '{#info}':
        {
          color = CupertinoColors.activeGreen;
          break;
        }
      case '{#error}':
        {
          color = CupertinoColors.destructiveRed;
          break;
        }
      case '{#progress}':
        {
          color = CupertinoColors.systemYellow;
          break;
        }
      default:
        {
          color = CupertinoColors.white;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      line,
      style: context.appTextStyles.fs18?.copyWith(
        color: color,
      ),
    );
  }
}
