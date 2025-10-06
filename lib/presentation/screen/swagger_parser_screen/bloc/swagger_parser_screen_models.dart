import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'swagger_parser_screen_models.freezed.dart';

@freezed
sealed class SwaggerParserScreenEvent with _$SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEvent.init() = SwaggerParserScreenEventInit;

  const factory SwaggerParserScreenEvent.parse({
    required String url,
    bool? overwrite,
  }) = SwaggerParserScreenEventParse;

  const factory SwaggerParserScreenEvent.onCancel() =
      SwaggerParserScreenEventOnCancel;
}

@freezed
sealed class SwaggerParserScreenSR with _$SwaggerParserScreenSR {
  const factory SwaggerParserScreenSR.init() = _Init;
  const factory SwaggerParserScreenSR.onContinue() = _OnContinue;
}

@freezed
sealed class SwaggerParserScreenState with _$SwaggerParserScreenState {
  const factory SwaggerParserScreenState.data({
    required Config config,
    required Components componentsBeforeParsing,
  }) = SwaggerParserScreenStateData;
}
