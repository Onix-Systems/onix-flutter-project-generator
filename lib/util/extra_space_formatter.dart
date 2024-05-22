import 'package:flutter/services.dart';

class ExtraSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(RegExp(r'\s', unicode: true))) {
      return oldValue;
    }

    final correctedText = newValue.text.replaceAll(RegExp(r'\s+'), ' ');

    return TextEditingValue(
      text: correctedText,
      selection: TextSelection.collapsed(offset: correctedText.length),
    );
  }
}
