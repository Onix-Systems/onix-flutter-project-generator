import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? locale;

  @override
  Widget build(BuildContext context) {
    AppRouter.init();
    return GlobalLoaderOverlay(
      useDefaultLoading: true,
      overlayColor: Colors.black.withOpacity(0.5),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: widget ?? const SizedBox(),
          );
        },
        scrollBehavior: const CupertinoScrollBehavior(),
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter.router,
        locale: locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (context) => S.of(context).title,
      ),
    );
  }
}
