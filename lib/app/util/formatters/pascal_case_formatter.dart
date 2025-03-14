import 'package:flutter/services.dart';
import 'package:recase/recase.dart';

class PascalCaseFormatter extends TextInputFormatter {
  const PascalCaseFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.pascalCase,
      selection: newValue.selection,
    );
  }
}
