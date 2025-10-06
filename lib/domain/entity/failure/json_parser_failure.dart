import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';

class JsonParserFailure implements Exception {
  final String failureText;

  JsonParserFailure({required this.failureText}) : super();
}

class JsonParserEmptyValueFailure extends JsonParserFailure {
  JsonParserEmptyValueFailure({required super.failureText});
}

extension JsonParserFailureExtension on JsonParserFailure {
  String getMessage(BuildContext context) {
    if (this is JsonParserEmptyValueFailure) {
      return S.of(context).jsonParserEmptyValueFailure(failureText);
    }

    return failureText;
  }
}
