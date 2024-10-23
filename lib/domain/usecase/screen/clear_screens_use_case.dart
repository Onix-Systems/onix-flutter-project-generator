import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';

class ClearScreensUseCase {
  final ScreenRepository _screenRepository;

  ClearScreensUseCase(this._screenRepository);

  void call() => _screenRepository.empty();
}
