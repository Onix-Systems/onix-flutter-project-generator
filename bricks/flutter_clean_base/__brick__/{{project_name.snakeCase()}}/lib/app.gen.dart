//@formatter:off
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
{{^web_only}}import 'package:loader_overlay/loader_overlay.dart';{{/web_only}}
{{#screen_util}}import 'package:flutter_screenutil/flutter_screenutil.dart';{{/screen_util}}
{{#isBloc}}import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';{{/isBloc}}
{{^isBase}}import 'package:get_it/get_it.dart';{{/isBase}}
{{#isProvider}}import 'package:onix_flutter_provider/onix_flutter_provider.dart';
import 'package:{{project_name}}/app/provider/app_provider.dart';{{/isProvider}}
{{#isRiverpod}} import 'package:flutter_riverpod/flutter_riverpod.dart';{{/isRiverpod}}
import 'package:{{project_name}}/presentation/style/theme/theme_imports.dart';
{{#isBase}}import 'package:{{project_name}}/core/arch/widget/common/theme_switcher.dart';{{/isBase}}
{{#isGoRouter}}import 'package:{{project_name}}/app/router/app_router.dart';{{/isGoRouter}}
{{^isGoRouter}}import 'package:{{project_name}}/core/di/app.dart';{{/isGoRouter}}
{{^handLocalization}}import 'package:flutter_localizations/flutter_localizations.dart';{{/handLocalization}}
{{#handLocalization}}import 'package:{{project_name}}/app/localization/common_app_localization_ext.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';{{/handLocalization}}
{{#flavorizr}}import 'package:{{project_name}}/core/arch/widget/common/flavor_banner.dart';{{/flavorizr}}
{{^handLocalization}}import 'package:{{project_name}}/app/localization/generated/l10n.dart';{{/handLocalization}}
{{^isGoRouter}}{{#sentry}}import 'package:sentry_flutter/sentry_flutter.dart';{{/sentry}}{{/isGoRouter}}

class App extends {{#isRiverpod}}Consumer{{/isRiverpod}}StatefulWidget {
  const App({super.key});

  @override
{{#isRiverpod}}Consumer{{/isRiverpod}}State<App> createState() => _AppState();
}
{{#isBloc}}
class _AppState extends BaseState<AppScreenState, AppBloc, AppSR, App>
{{/isBloc}}
{{#isProvider}}
class _AppState extends BaseProviderState<AppProvider, App>
{{/isProvider}}
{{#isRiverpod}}
class _AppState extends ConsumerState<App>
{{/isRiverpod}}
{{#isBase}}
class _AppState extends State<App>
{{/isBase}} {
  Locale? locale;
  {{#isBloc}}
  @override
  AppBloc createBloc() => GetIt.I.get<AppBloc>();
  {{/isBloc}}
  {{#isProvider}}
  @override
  AppProvider createProvider() => GetIt.I.get<AppProvider>();
  {{/isProvider}}

  @override
  Widget
  {{#isBase}}build{{/isBase}}
  {{#isRiverpod}}build{{/isRiverpod}}
  {{#isBloc}}buildWidget{{/isBloc}}
  {{#isProvider}}buildWidget{{/isProvider}}
  (BuildContext context) {
    {{#isGoRouter}}AppRouter.init();{{/isGoRouter}}
    return {{^web_only}}GlobalLoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.5),
      child: {{/web_only}}
      {{#screen_util}}ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
        {{/screen_util}}{{^isRiverpod}}return{{/isRiverpod}}
        {{#isBloc}}blocBuilder(
              builder: (context, state){{/isBloc}}
        {{#isProvider}}providerConsumer(
              stateListener: (provider){{/isProvider}}
        {{#isBase}}ThemeModeSwitcher(
              builder: (context, themeMode, _) {{/isBase}}
          {{^isRiverpod}}
          {
          {{/isRiverpod}}
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
                {{#flavorizr}}
                child: FlavorBanner(
                  child: widget ?? const SizedBox(),
                ),
                {{/flavorizr}}
                {{^flavorizr}}
                child: widget ?? const SizedBox(),
                {{/flavorizr}}
              );
            },
            scrollBehavior: const CupertinoScrollBehavior(),
            theme: createLightTheme(),
            darkTheme: createDarkTheme(),
            themeMode: {{#isBase}}themeMode{{/isBase}}{{#isBloc}}state.themeMode{{/isBloc}}{{#isProvider}}provider.themeMode{{/isProvider}}{{#isRiverpod}}ref.watch(appProvider).themeMode{{/isRiverpod}},
            {{^isGoRouter}}
            {{^sentry}}routerConfig: appRouter().config(),{{/sentry}}
            {{#sentry}}routerConfig: appRouter().config(
              navigatorObservers: () => [
                 SentryNavigatorObserver(),
              ],
            ),
            {{/sentry}}
            {{/isGoRouter}}
            {{#isGoRouter}}routerConfig: AppRouter.router,{{/isGoRouter}}
            locale: locale,
            {{^handLocalization}}
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateTitle: (context) => S.of(context).title,
            {{/handLocalization}}

            {{#handLocalization}}
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              return locale ??=
              Locale(AppLocalizations.supportedLocales.last.languageCode);
            },
            onGenerateTitle: (context) => context.str.title,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            {{/handLocalization}}
          );
          },
     {{#screen_util}}
            );
          },
     {{#web_only}}
        );
    {{/web_only}}
    {{^web_only}}
          ),
        );
    {{/web_only}}
    {{/screen_util}}
    {{^screen_util}}
    {{#web_only}}
        );
    {{/web_only}}
    {{^web_only}}{{^isRiverpod}}
          );
        ),{{/isRiverpod}}
       );
    {{/web_only}}
    {{/screen_util}}
  }
}