import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/util/enum/output_type.dart';

part 'output_line.freezed.dart';

@freezed
class OutputLine with _$OutputLine {
  const factory OutputLine({
    required String line,
    required Color color,
    required OutputType tag,
  }) = _OutputLine;

  factory OutputLine.fromRaw(String input) {
    final tagRaw = input.substring(0, input.indexOf('}') + 1);
    final line = input.replaceFirst(tagRaw, '');
    final tag = OutputType.fromTag(tagRaw);
    Color color = CupertinoColors.white;
    switch (tag) {
      case OutputType.info:
        color = CupertinoColors.activeGreen;
        break;
      case OutputType.error:
        color = CupertinoColors.destructiveRed;
        break;
      case OutputType.progress:
        color = CupertinoColors.systemYellow;
        break;
      default:
        color = CupertinoColors.white;
        break;
    }
    return OutputLine(
      line: line,
      color: color,
      tag: tag,
    );
  }
}
