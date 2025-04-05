import 'package:flutter/material.dart';
import 'package:simple_hub/infrastructure/core/injection.dart';
import 'package:simple_hub/presentation/core/app_widget.dart';
import 'package:simple_hub/presentation/core/routes/app_router.dart';

Future<void> main({bool debugBanner = true}) async {
  configureDependencies(EnvApp.dev);

  WidgetsFlutterBinding.ensureInitialized();

  // await EasyLocalization.ensureInitialized();
  getIt.registerSingleton<AppRouter>(AppRouter());

  runApp(
    AppWidget(debugBanner: debugBanner),

    /// Use https://lingohub.com/developers/supported-locales/language-designators-with-regions
    /// Or https://www.contentstack.com/docs/developers/multilingual-content/list-of-supported-languages/
    /// To find your language letters, and add the file letters below
    // EasyLocalization(
    //   supportedLocales: const <Locale>[
    //     Locale('cs', 'CZ'),
    //     Locale('de', 'DE'),
    //     Locale('en', 'GB'),
    //     Locale('en', 'US'),
    //     Locale('es', 'CO'),
    //     Locale('es', 'MX'),
    //     Locale('fr', 'BE'),
    //     Locale('fr', 'CA'),
    //     Locale('fr', 'FR'),
    //     Locale('ge', 'GE'),
    //     Locale('he', 'IL'),
    //     Locale('hi', 'IN'),
    //     Locale('hr', 'HR'),
    //     Locale('id', 'ID'),
    //     Locale('it', 'IT'),
    //     Locale('ka', 'GE'),
    //     Locale('nb', 'NO'),
    //     Locale('pt', 'BR'),
    //     Locale('ru', 'RU'),
    //     Locale('te', 'IN'),
    //     Locale('th', 'TH'),
    //     Locale('zh', 'TW'),
    //   ],
    //   path: 'assets/translations',
    //   fallbackLocale: const Locale('en', 'US'),
    //   child: AppWidget(),
    // ),
  );
}
