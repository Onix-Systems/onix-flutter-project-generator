import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class JsonParserFailure extends Failure {
  final String failureText;

  JsonParserFailure({required this.failureText}) : super();
}

class JsonParserEmptyValueFailure extends JsonParserFailure {
  JsonParserEmptyValueFailure({required super.failureText});
}

extension JsonParserFailureExtension on JsonParserFailure {
  String getMessage(BuildContext context) {
    switch (runtimeType) {
      case JsonParserEmptyValueFailure:
        return S.of(context).jsonParserEmptyValueFailure(failureText);
      default:
        return failureText;
    }
  }
}
