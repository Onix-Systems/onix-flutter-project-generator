import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ColoredLine extends StatelessWidget {
  final OutputLine line;

  const ColoredLine({
    super.key,
    required this.line,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      line.line,
      style: context.appTextStyles.fs18?.copyWith(
        color: line.color,
      ),
    );
  }
}
