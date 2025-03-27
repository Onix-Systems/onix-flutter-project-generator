import 'package:flutter/services.dart';
import 'package:recase/recase.dart';

class PascalCaseFormatter extends TextInputFormatter {
  const PascalCaseFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.pascalCase;
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
