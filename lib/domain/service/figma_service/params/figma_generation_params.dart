import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class FigmaGenerationParams implements BaseGenerationParams {
  final String figmaId;
  final String token;

  FigmaGenerationParams({
    required this.figmaId,
    required this.token,
  });
}
