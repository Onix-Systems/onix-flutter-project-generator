//@formatter:off
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/splash_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/project_name_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/procedure_selection_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/platforms_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/project_settings_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/screens_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/data_components_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/swagger_parser_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/summary_screen.dart';
//{imports end}

class AppRouter {
  static const _initialLocation = '/';
  static const _splashScreen = '/';
  static const _projectNameScreen = '/project_name';
  static const _procedureSelectionScreen = '/procedure_selection';
  static const _platformsScreen = '/platforms';
  static const _projectSettingsScreen = '/project_settings';
  static const _screensScreen = '/screens';
  static const _dataComponentsScreen = '/data_components';
  static const _swaggerParserScreen = '/swagger_parser';
  static const _summaryScreen = '/summary';
  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splashScreen;
  static String get projectNameScreen => _projectNameScreen;
  static String get procedureSelectionScreen => _procedureSelectionScreen;
  static String get platformsScreen => _platformsScreen;
  static String get projectSettingsScreen => _projectSettingsScreen;
  static String get screensScreen => _screensScreen;
  static String get dataComponentsScreen => _dataComponentsScreen;
  static String get swaggerParserScreen => _swaggerParserScreen;
  static String get summaryScreen => _summaryScreen;
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
          builder: (context, state) => SplashScreen(
            skipSplash: state.extra as bool? ?? false,
          ),
        ),
        GoRoute(
          path: _projectNameScreen,
          name: 'ProjectNameScreen',
          builder: (context, state) => ProjectNameScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _procedureSelectionScreen,
          name: 'ProcedureSelectionScreen',
          builder: (context, state) => ProcedureSelectionScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _platformsScreen,
          name: 'PlatformsScreen',
          builder: (context, state) => PlatformsScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _projectSettingsScreen,
          name: 'ProjectSettingsScreen',
          builder: (context, state) => ProjectSettingsScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _screensScreen,
          name: 'ScreensScreen',
          builder: (context, state) => ScreensScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _dataComponentsScreen,
          name: 'DataComponentsScreen',
          builder: (context, state) => DataComponentsScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _swaggerParserScreen,
          name: 'SwaggerParserScreen',
          builder: (context, state) => SwaggerParserScreen(
            config: state.extra as Config,
          ),
        ),
        GoRoute(
          path: _summaryScreen,
          name: 'SummaryScreen',
          builder: (context, state) => SummaryScreen(
            config: state.extra as Config,
          ),
        ),
        //{routes end}
      ],
    );
  }
}
