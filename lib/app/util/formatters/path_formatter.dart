import 'package:flutter/services.dart';

class PathFormatter extends TextInputFormatter {
  const PathFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    // Normalize path by replacing backslashes with forward slashes
    text = text.replaceAll(r'\', '/');

    // Ensure path starts with a slash if not empty
    if (text.isNotEmpty && !text.startsWith('/')) {
      text = '/$text';
    }

    // Make first letter after leading slash lowercase
    if (text.length > 1 &&
        text[0] == '/' &&
        RegExp('[A-Z]').hasMatch(text[1])) {
      text =
          '/${text[1].toLowerCase()}${text.length > 2 ? text.substring(2) : ''}';
    }

    // Remove consecutive slashes
    while (text.contains('//')) {
      text = text.replaceAll('//', '/');
    }

    // Filter out invalid path characters
    text = text.replaceAll(RegExp(r'[^a-zA-Z0-9_\-./{}]'), '');

    return TextEditingValue(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: text.length -
            (newValue.text.length - newValue.selection.baseOffset),
        extentOffset: text.length -
            (newValue.text.length - newValue.selection.extentOffset),
      ),
    );
  }
}
