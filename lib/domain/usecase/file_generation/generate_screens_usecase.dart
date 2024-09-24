import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';

class GenerateScreensUseCase {
  final OutputService _outputService;
  final ScreenRepository _screenRepository;

  const GenerateScreensUseCase(
    this._outputService,
    this._screenRepository,
  );

  Future<void> call({
    required Config config,
  }) async {
    await config.stateManager.strategy.generate(
        config: config,
        screenRepository: _screenRepository,
        outputService: _outputService);

    _outputService.add(
      'Screens generated!'.toInfoMessage(),
    );
  }
}
