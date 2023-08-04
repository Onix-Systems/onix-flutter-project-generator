import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

part 'swagger_parser_screen_models.freezed.dart';

@freezed
class SwaggerParserScreenEvent with _$SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEvent.init({
    required String projectName,
  }) = SwaggerParserScreenEventInit;

  const factory SwaggerParserScreenEvent.parse({
    required String url,
  }) = SwaggerParserScreenEventParse;
}

@freezed
class SwaggerParserScreenSR with _$SwaggerParserScreenSR {
  const factory SwaggerParserScreenSR.onError({
    required String message,
  }) = _OnError;

  const factory SwaggerParserScreenSR.onContinue() = _OnContinue;
}

@freezed
class SwaggerParserScreenState with _$SwaggerParserScreenState {
  const factory SwaggerParserScreenState.data({
    @Default('') String projectName,
    @Default({}) Set<DataComponent> dataComponents,
    @Default({}) Set<Source> sources,
  }) = SwaggerParserScreenStateData;
}
