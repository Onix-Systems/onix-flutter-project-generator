import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';

abstract class ScreenRepository {
  Screen get homeScreen;

  Set<Screen> get screens;

  bool exists({required String screenName});

  void addScreen({required Screen screen});

  void addAll({required Set<Screen> screens});

  void removeScreen({required String screenName});

  void modifyScreen(Screen screen, String oldName);

  void empty();

  bool containsNewComponents();
}
