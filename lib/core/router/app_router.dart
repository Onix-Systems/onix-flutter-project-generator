//@formatter:off
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/splash_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/project_name_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/procedure_selection_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/platforms_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/project_settings_screen.dart';
//{imports end}

class AppRouter {
  static const _initialLocation = '/';
  static const _splashScreen = '/';
  static const _projectNameScreen = '/project_name';
  static const _procedureSelectionScreen = '/procedure_selection';
  static const _platformsScreen = '/platforms';
  static const _projectSettings = '/project_settings';
  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splashScreen;
  static String get projectNameScreen => _projectNameScreen;
  static String get procedureSelectionScreen => _procedureSelectionScreen;
  static String get platformsScreen => _platformsScreen;
  static String get projectSettingsScreen => _projectSettings;
  //{getters end}

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize({String initialLocation = _initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        GoRoute(
          path: _splashScreen,
          name: 'SplashScreen',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: _projectNameScreen,
          name: 'ProjectNameScreen',
          builder: (context, state) => ProjectNameScreen(
            projectPath: state.extra as String,
          ),
        ),
        GoRoute(
          path: _procedureSelectionScreen,
          name: 'ProcedureSelectionScreen',
          builder: (context, state) => ProcedureSelectionScreen(
            projectPath: state.extra as String,
          ),
        ),
        GoRoute(
          path: _platformsScreen,
          name: 'PlatformsScreen',
          builder: (context, state) => PlatformsScreen(
            extra: state.extra as PlatformScreenExtra,
          ),
        ),
        GoRoute(
          path: _projectSettings,
          name: 'ProjectSettingsScreen',
          builder: (context, state) => ProjectSettingsScreen(
            extra: state.extra as ProjectSettingsScreenExtra,
          ),
        ),
        //{routes end}
      ],
    );
  }
}
