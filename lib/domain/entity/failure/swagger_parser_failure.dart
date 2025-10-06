import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';

// When Failed to parse swagger components
sealed class SwaggerParserFailure implements Exception {
  final String? componentName;

  const SwaggerParserFailure(this.componentName);
}

class SwaggerParserFailureNotFound extends SwaggerParserFailure {
  const SwaggerParserFailureNotFound(String super.componentName);
}

class SwaggerParserFailureAlreadyExists extends SwaggerParserFailure {
  const SwaggerParserFailureAlreadyExists(String super.componentName);
}

class SwaggerParserFailureRequestAlreadyExists extends SwaggerParserFailure {
  const SwaggerParserFailureRequestAlreadyExists(String super.componentName);
}

class SwaggerParserFailureDuplicatesFound extends SwaggerParserFailure {
  const SwaggerParserFailureDuplicatesFound(String super.componentName);
}

class SwaggerParserFailureFailedToParse extends SwaggerParserFailure {
  const SwaggerParserFailureFailedToParse() : super(null);
}

extension SwaggerParserFailureX on SwaggerParserFailure {
  String getTranslatedMessage(BuildContext context) {
    switch (runtimeType) {
      case SwaggerParserFailureAlreadyExists _:
        return S.of(context).alreadyExistsError(componentName ?? '');
      case SwaggerParserFailureNotFound _:
        return S.of(context).sourceNotFound;
      case SwaggerParserFailureDuplicatesFound _:
        return S.of(context).duplicatesFoundError(componentName ?? '');
      case SwaggerParserFailureRequestAlreadyExists _:
        return S.of(context).requestAlreadyExistsError;
      case SwaggerParserFailureFailedToParse _:
      default:
        return S.of(context).parseErrorMessage;
    }
  }
}
