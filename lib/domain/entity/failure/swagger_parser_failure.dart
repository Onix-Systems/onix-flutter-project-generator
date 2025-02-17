import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

// When Failed to parse swagger components
class SwaggerParserFailure implements Failure {
  final String? componentName;

  const SwaggerParserFailure(this.componentName);
}

class SwaggerParserFailureNotFound extends SwaggerParserFailure {
  const SwaggerParserFailureNotFound(String super.componentName);
}

class SwaggerParserFailureAlreadyExists extends SwaggerParserFailure {
  const SwaggerParserFailureAlreadyExists(String super.componentName);
}

class SwaggerParserFailureFailedToParse extends SwaggerParserFailure {
  const SwaggerParserFailureFailedToParse() : super(null);
}

extension SwaggerParserFailureX on SwaggerParserFailure {
  String getTranslatedMessage(BuildContext context) {
    switch (runtimeType) {
      case SwaggerParserFailureAlreadyExists:
        return S.of(context).alreadyExistsError(componentName ?? '');
      case SwaggerParserFailureNotFound:
        return S.of(context).sourceNotFound;
      case SwaggerParserFailureFailedToParse:
      default:
        return S.of(context).parseErrorMessage;
    }
  }
}
