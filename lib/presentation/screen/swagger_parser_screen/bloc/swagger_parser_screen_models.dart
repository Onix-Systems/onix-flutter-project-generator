import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

part 'swagger_parser_screen_models.freezed.dart';

@freezed
class SwaggerParserScreenEvent with _$SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEvent.init({
    required Config config,
  }) = SwaggerParserScreenEventInit;

  const factory SwaggerParserScreenEvent.onUrlChanged({
    required String url,
  }) = SwaggerParserScreenEventOnUrlChanged;

  const factory SwaggerParserScreenEvent.onReplace() =
      SwaggerParserScreenEventOnReplace;

  const factory SwaggerParserScreenEvent.onIgnore() =
      SwaggerParserScreenEventOnIgnore;

  const factory SwaggerParserScreenEvent.parse({
    required String url,
  }) = SwaggerParserScreenEventParse;
}

@freezed
class SwaggerParserScreenSR with _$SwaggerParserScreenSR {
  const factory SwaggerParserScreenSR.onError({
    required String message,
  }) = _OnError;

  const factory SwaggerParserScreenSR.onConflicting() = _OnConflicting;

  const factory SwaggerParserScreenSR.onContinue() = _OnContinue;
}

@freezed
class SwaggerParserScreenState with _$SwaggerParserScreenState {
  const factory SwaggerParserScreenState.data({
    required Config config,
    @Default({}) Set<Source> alreadyParsedSources,
    @Default({}) Set<DataComponent> alreadyParsedComponents,
  }) = SwaggerParserScreenStateData;
}
