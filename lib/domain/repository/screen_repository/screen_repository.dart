import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';

abstract class ScreenRepository {
  Set<Screen> get screens;

  void addScreen(Screen screen);

  void addAll(Set<Screen> screens);

  void removeScreen(Screen screen);

  void modifyScreen(Screen screen, String oldName);

  void empty();

  bool containsNewComponents();
}
