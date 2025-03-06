import 'package:auto_route/auto_route.dart';
import 'package:cybearjinni/infrastructure/core/injection.dart';
import 'package:cybearjinni/presentation/core/color_schemes.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  PageTransitionsTheme pageTransitionsTheme() {
    const PageTransitionsBuilder transition = ZoomPageTransitionsBuilder();

    return const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: transition,
        TargetPlatform.iOS: transition,
        TargetPlatform.fuchsia: transition,
        TargetPlatform.linux: transition,
        TargetPlatform.macOS: transition,
        TargetPlatform.windows: transition,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/cbj_logo.png'), context);
    final rootRouter = getIt<AppRouter>();

    return MaterialApp.router(
      routerConfig: rootRouter.config(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        pageTransitionsTheme: pageTransitionsTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        pageTransitionsTheme: pageTransitionsTheme(),
      ),
      title: 'CyBear Jinni App',
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
