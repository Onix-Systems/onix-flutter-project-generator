import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'output_line.freezed.dart';

@freezed
class OutputLine with _$OutputLine {
  const factory OutputLine({
    required String line,
    required Color color,
    required String tag,
  }) = _OutputLine;

  factory OutputLine.fromRaw(String input) {
    final tag = input.substring(0, input.indexOf('}') + 1);
    final line = input.replaceFirst(tag, '');
    Color color = CupertinoColors.white;
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
    return OutputLine(
      line: line,
      color: color,
      tag: tag,
    );
  }
}
