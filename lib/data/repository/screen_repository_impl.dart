import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:recase/recase.dart';

class ScreenRepositoryImpl implements ScreenRepository {
  final Set<Screen> _screens = {};

  @override
  Set<Screen> get screens => _screens.map(Screen.copyOf).toSet();

  @override
  bool exists({required String screenName}) =>
      _screens.any((element) => element.name == screenName);

  @override
  void addScreen({required Screen screen}) {
    if (!_screens
        .any((element) => element.name.pascalCase == screen.name.pascalCase)) {
      _screens.add(screen);
    }
  }

  @override
  void addAll({required Set<Screen> screens}) {
    for (final screen in screens) {
      addScreen(screen: screen);
    }
  }

  @override
  void modifyScreen(Screen screen, String oldName) {
    final modifiedScreen =
        _screens.firstWhere((element) => element.name == oldName);

    if (modifiedScreen.exists) {
      return;
    }

    _screens
      ..remove(modifiedScreen)
      ..add(screen);
  }

  @override
  void removeScreen({required String screenName}) {
    if (exists(screenName: screenName)) {
      _screens.removeWhere((screen) => screen.name == screenName);
    }
  }

  @override
  bool containsNewComponents() {
    return _screens.any((element) => !element.exists);
  }

  @override
  void empty() {
    _screens.clear();
  }
}
