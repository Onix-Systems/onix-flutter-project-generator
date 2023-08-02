//@formatter:off
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/splash_screen.dart';
//{imports end}

class AppRouter {
  static const _initialLocation = '/';
  static const _splash = '/';
  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splash;
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
          path: _splash,
          name: 'SplashScreen',
          builder: (context, state) => const SplashScreen(),
        ),
        //{routes end}
      ],
    );
  }
}
