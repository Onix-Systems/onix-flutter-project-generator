//@formatter:off
{{^isGoRouter}}import 'package:auto_route/auto_route.dart';{{/isGoRouter}}
{{#isGoRouter}}import 'package:{{project_name}}/app/router/app_route.dart';{{/isGoRouter}}
{{#isGoRouter}}import 'package:go_router/go_router.dart';{{/isGoRouter}}
{{#isGoRouter}}import 'package:{{project_name}}/core/di/services.dart';{{/isGoRouter}}
{{#isGoRouter}}{{#sentry}}import 'package:sentry_flutter/sentry_flutter.dart';{{/sentry}}{{/isGoRouter}}
//{imports end}

{{^isGoRouter}}
part 'app_router.gr.dart';

@AutoRouterConfig(){{/isGoRouter}}
class AppRouter {{^isGoRouter}}extends RootStackRouter{{/isGoRouter}}{
  {{#isGoRouter}}static const _initialLocation = '/';

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize({String initialLocation = _initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,
    refreshListenable: sessionService(),
    redirect: (context,state){
        return null;
    },
      routes: <GoRoute>[
        //{routes end}
      ],
    observers: [
      SentryNavigatorObserver(),
    ],
    );
  }{{/isGoRouter}}

  {{^isGoRouter}}@override
  final List<AutoRoute> routes = [
      //{routes end}
  ];

  @override
  late final List<AutoRouteGuard> guards;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  AppRouter({
    required List<AutoRouteGuard> globalGuards,
  }) : guards = globalGuards;{{/isGoRouter}}
}