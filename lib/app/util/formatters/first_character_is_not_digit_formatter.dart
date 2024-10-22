import 'package:flutter/services.dart';

class FirstCharacterNotDigitFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isNotEmpty &&
        newValue.text[0].contains(RegExp('[0-9]'))) {
      return oldValue;
    }
    return newValue;
  }
}
