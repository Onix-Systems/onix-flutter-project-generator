//@formatter:off
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
{{^web_only}}import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';{{/web_only}}
import 'package:{{project_name}}/core/arch/bloc/base_block_state.dart';
import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';
import 'package:{{project_name}}/presentation/style/theme/theme_imports.dart';
{{#isGoRouter}}import 'package:{{project_name}}/core/router/app_router.dart';{{/isGoRouter}}
{{^isGoRouter}}import 'package:{{project_name}}/core/di/app.dart';{{/isGoRouter}}
{{^handLocalization}}import 'package:flutter_localizations/flutter_localizations.dart';{{/handLocalization}}
{{#handLocalization}}import 'package:{{project_name}}/app/localization/common_app_localization_ext.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';{{/handLocalization}}
{{#flavorizr}}import 'package:{{project_name}}/core/arch/widget/common/flavor_banner.dart';{{/flavorizr}}
{{^handLocalization}}import 'package:{{project_name}}/app/localization/generated/l10n.dart';{{/handLocalization}}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<AppScreenState, AppBloc, AppSR, App> {
  Locale? locale;


  @override
  Widget buildWidget(BuildContext context) {
    {{#isGoRouter}}AppRouter.init();{{/isGoRouter}}
    return {{^web_only}}GlobalLoaderOverlay(
      useDefaultLoading: true,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
        return{{/web_only}} blocConsumer(
          stateListener: (state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
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
            title: '',
            theme: createLightTheme(),
            darkTheme: createDarkTheme(),
            themeMode: state.themeMode,
            {{#isGoRouter}}routeInformationProvider: AppRouter.router.routeInformationProvider,{{/isGoRouter}}
            routeInformationParser: {{#isGoRouter}}AppRouter.router.routeInformationParser,{{/isGoRouter}}
            {{^isGoRouter}}appRouter().defaultRouteParser(),{{/isGoRouter}}
            routerDelegate: {{#isGoRouter}}AppRouter.router.routerDelegate,{{/isGoRouter}}
            {{^isGoRouter}}appRouter().delegate(),{{/isGoRouter}}
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
              locale ??=
              Locale(AppLocalizations.supportedLocales.last.languageCode);
              return locale;
            },
            onGenerateTitle: (context) => context.str.title,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            {{/handLocalization}}
          );
          },
          {{^web_only}}
        );
        },
      ),{{/web_only}}
    );
  }
}