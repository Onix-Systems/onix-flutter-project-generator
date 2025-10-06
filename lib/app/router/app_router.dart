//@formatter:off
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/data_components_screen_v2.dart';
import 'package:onix_flutter_bricks/presentation/screen/edit_project_screen/edit_project_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/figma_styles_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/generation_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/platforms_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/procedure_selection_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/project_name_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/project_settings_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/screens_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/splash_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/summary_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/swagger_parser_screen.dart';
//{imports end}

// ignore_for_file: cast_nullable_to_non_nullable
class AppRouter {
  static const _initialLocation = '/';
  static const _splashScreen = '/';
  static const _projectNameScreen = '/project_name';
  static const _procedureSelectionScreen = '/procedure_selection';
  static const _platformsScreen = '/platforms';
  static const _projectSettingsScreen = '/project_settings';
  static const _screensScreen = '/screens';
  static const _stylesScreen = '/styles';
  static const _dataComponentsScreen = '/data_components';
  static const _swaggerParserScreen = '/swagger_parser';
  static const _summaryScreen = '/summary';
  static const _generationScreen = '/generation';
  static const _editProjectScreen = '/edit_project';
  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splashScreen;
  static String get projectNameScreen => _projectNameScreen;
  static String get procedureSelectionScreen => _procedureSelectionScreen;
  static String get platformsScreen => _platformsScreen;
  static String get projectSettingsScreen => _projectSettingsScreen;
  static String get screensScreen => _screensScreen;
  static String get stylesScreen => _stylesScreen;
  static String get dataComponentsScreen => _dataComponentsScreen;
  static String get swaggerParserScreen => _swaggerParserScreen;
  static String get summaryScreen => _summaryScreen;
  static String get generationScreen => _generationScreen;
  static String get editProjectScreen => _editProjectScreen;

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
          builder: (context, state) => const ProjectNameScreen(),
        ),
        GoRoute(
          path: _procedureSelectionScreen,
          name: 'ProcedureSelectionScreen',
          builder: (context, state) => const ProcedureSelectionScreen(),
        ),
        GoRoute(
          path: _platformsScreen,
          name: 'PlatformsScreen',
          builder: (context, state) => const PlatformsScreen(),
        ),
        GoRoute(
          path: _projectSettingsScreen,
          name: 'ProjectSettingsScreen',
          builder: (context, state) => const ProjectSettingsScreen(),
        ),
        GoRoute(
          path: _screensScreen,
          name: 'ScreensScreen',
          builder: (context, state) => const ScreensScreen(),
        ),
        GoRoute(
          path: _stylesScreen,
          name: 'StylesScreen',
          builder: (context, state) => const FigmaStylesScreen(),
        ),
        GoRoute(
          path: _dataComponentsScreen,
          name: 'DataComponentsScreen',
          builder: (context, state) => const DataComponentsScreenV2(),
        ),
        GoRoute(
          path: _swaggerParserScreen,
          name: 'SwaggerParserScreen',
          builder: (context, state) => const SwaggerParserScreen(),
        ),
        GoRoute(
          path: _summaryScreen,
          name: 'SummaryScreen',
          builder: (context, state) => const SummaryScreen(),
        ),
        GoRoute(
          path: _generationScreen,
          name: 'GenerationScreen',
          builder: (context, state) => const GenerationScreen(),
        ),
        GoRoute(
          path: _editProjectScreen,
          name: 'EditProjectScreen',
          builder: (context, state) => const EditProjectScreen(),
        ),
        //{routes end}
      ],
    );
  }
}
