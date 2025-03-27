import 'package:flutter/services.dart';

class LowerCaseFormatter extends TextInputFormatter {
  const LowerCaseFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.toLowerCase();
    return TextEditingValue(
      text: newText,
      selection: newValue.selection.copyWith(
        baseOffset: newText.length -
            (newValue.text.length - newValue.selection.baseOffset),
        extentOffset: newText.length -
            (newValue.text.length - newValue.selection.extentOffset),
      ),
    );
  }
}
