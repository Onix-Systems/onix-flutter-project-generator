//@formatter:off
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
{{^web_only}}import 'package:loader_overlay/loader_overlay.dart';{{/web_only}}
{{#screen_util}}import 'package:flutter_screenutil/flutter_screenutil.dart';{{/screen_util}}
import 'package:{{project_name}}/presentation/style/theme/theme_imports.dart';
import 'package:{{project_name}}/core/arch/widget/common/theme_switcher.dart';
{{#isGoRouter}}import 'package:{{project_name}}/app/router/app_router.dart';{{/isGoRouter}}
{{^isGoRouter}}import 'package:{{project_name}}/core/di/app.dart';{{/isGoRouter}}
{{^handLocalization}}import 'package:flutter_localizations/flutter_localizations.dart';{{/handLocalization}}
{{#handLocalization}}import 'package:{{project_name}}/app/localization/common_app_localization_ext.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';{{/handLocalization}}
{{#flavorizr}}import 'package:{{project_name}}/core/arch/widget/common/flavor_banner.dart';{{/flavorizr}}
{{^handLocalization}}import 'package:{{project_name}}/app/localization/generated/l10n.dart';{{/handLocalization}}
{{^isGoRouter}}{{#sentry}}import 'package:sentry_flutter/sentry_flutter.dart';{{/sentry}}{{/isGoRouter}}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? locale;

  @override
  Widget build(BuildContext context) {
    {{#isGoRouter}}AppRouter.init();{{/isGoRouter}}
    return {{^web_only}}GlobalLoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.5),
      child: {{/web_only}}
      {{#screen_util}}ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
        return{{/screen_util}}
          ThemeModeSwitcher(
              builder: (context, themeMode, _) {
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
            themeMode: themeMode,
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
    {{^web_only}}
        ),
       );
    {{/web_only}}
    {{/screen_util}}
  }
}