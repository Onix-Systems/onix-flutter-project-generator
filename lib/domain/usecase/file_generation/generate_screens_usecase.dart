import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateScreensUseCase {
  final OutputService _outputService;
  final ScreenRepository _screenRepository;

  const GenerateScreensUseCase(
    this._outputService,
    this._screenRepository,
  );

  Future<void> call({
    required Config config,
  }) =>
      config.stateManager.strategy.generate(
        config: config,
        screenRepository: _screenRepository,
        outputService: _outputService,
      );
}
