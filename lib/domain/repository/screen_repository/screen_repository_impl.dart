import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository/screen_repository.dart';
import 'package:recase/recase.dart';

class ScreenRepositoryImpl implements ScreenRepository {
  final Set<Screen> _screens = {
    Screen(
      name: 'Home',
      exists: true,
    ),
  };

  @override
  Set<Screen> get screens => _screens.map((e) => Screen.copyOf(e)).toSet();

  @override
  void addScreen(Screen screen) {
    if (!_screens
        .any((element) => element.name.pascalCase == screen.name.pascalCase)) {
      _screens.add(screen);
    }
  }

  @override
  void addAll(Set<Screen> screens) {
    for (final screen in screens) {
      addScreen(screen);
    }
  }

  @override
  void modifyScreen(Screen screen, String oldName) {
    var modifiedScreen =
        _screens.firstWhere((element) => element.name == oldName);

    if (modifiedScreen.exists) {
      return;
    }

    _screens.remove(modifiedScreen);
    _screens.add(screen);
  }

  @override
  void removeScreen(Screen screen) {
    if (!screen.exists) {
      _screens.remove(screen);
    }
  }

  @override
  bool containsNewComponents() {
    return _screens.any((element) => !element.exists);
  }

  @override
  void empty() {
    _screens.clear();
    _screens.add(
      Screen(
        name: 'Home',
        exists: true,
      ),
    );
  }
}
