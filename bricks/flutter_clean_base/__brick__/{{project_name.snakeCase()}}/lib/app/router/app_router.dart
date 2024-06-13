//@formatter:off
{{^isGoRouter}}import 'package:auto_route/auto_route.dart';{{/isGoRouter}}
{{#isGoRouter}}import 'package:{{project_name}}/app/router/app_route.dart';{{/isGoRouter}}
{{#isGoRouter}}import 'package:flutter_bloc/flutter_bloc.dart';{{/isGoRouter}}
import 'package:flutter/material.dart';
{{#isGoRouter}}import 'package:go_router/go_router.dart';{{/isGoRouter}}
{{#isGoRouter}}import 'package:{{project_name}}/core/di/services.dart';{{/isGoRouter}}
{{^isGoRouter}}import 'package:{{project_name}}/app/router/guard/init_guard.dart';{{/isGoRouter}}

//{imports end}

{{^isGoRouter}}
part 'app_router.gr.dart';

@AutoRouterConfig(){{/isGoRouter}}
class AppRouter {{^isGoRouter}}extends _$AppRouter{{/isGoRouter}}{
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
    );
  }{{/isGoRouter}}

  {{^isGoRouter}}@override
  final List<AutoRoute> routes = [
      //{routes end}
  ];

  final InitGuard init;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  AppRouter({
    required this.init,
  }) : super();{{/isGoRouter}}
}