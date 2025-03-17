import 'package:flutter/services.dart';

class MethodNameFormatter extends TextInputFormatter {
  const MethodNameFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Allow only alphanumeric and underscore characters
    text = text.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '');

    // Ensure method name starts with lowercase letter or underscore
    if (text.isNotEmpty && RegExp(r'^[A-Z]').hasMatch(text)) {
      text = text[0].toLowerCase() + text.substring(1);
    }

    // Ensure first character is not a number
    if (text.isNotEmpty && RegExp(r'^[0-9]').hasMatch(text)) {
      text = '_' + text;
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
