import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/service/figma_service/figma_service.dart';
import 'package:onix_flutter_bricks/domain/service/figma_service/params/figma_generation_params.dart';

class GetFigmaStylesUseCase {
  final FigmaService _figmaService;

  const GetFigmaStylesUseCase(
    this._figmaService,
  );

  Future<List<AppStyle>> call({
    required String figmaId,
    required String token,
  }) async =>
      _figmaService.getStylesFromFigma(
        FigmaGenerationParams(
          figmaId: figmaId,
          token: token,
        ),
      );
}
