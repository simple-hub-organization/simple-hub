import 'package:cybear_jinni_site/injection.dart';
import 'package:cybear_jinni_site/my_singleton.dart';
import 'package:cybear_jinni_site/presentation/about_page/about_page.dart';
import 'package:cybear_jinni_site/presentation/faq_page/faq_page.dart';
import 'package:cybear_jinni_site/presentation/home_page/home_page.dart';
import 'package:cybear_jinni_site/presentation/integrations_page/integrations_page.dart';
import 'package:cybear_jinni_site/presentation/landing_page/landing_page.dart';
import 'package:cybear_jinni_site/presentation/route_names.dart';
import 'package:cybear_jinni_site/presentation/set_up_page/set_up_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  configureDependencies(Env.prod);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    /// Use https://lingohub.com/developers/supported-locales/language-designators-with-regions
    /// Or https://www.contentstack.com/docs/developers/multilingual-content/list-of-supported-languages/
    /// To find your language letters, and add the file letters below
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
      ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData(
    primarySwatch: Colors.deepPurple,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
      ),
      bodyMedium:TextStyle(
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    // fontFamily: 'gidole_regular',
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      //   // This makes the visual density adapt to the platform that you run
      //   // the app on. For desktop platforms, the controls will be smaller and
      //   // closer together (more dense) than on mobile platforms.
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),

      title: 'CyBear Jinni Smart Home',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.indigo,
        ),
      ),

      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          MySingleton.setCurrentPageName('landingPage');
          return LandingPage();
        },
        '/home': (BuildContext context) {
          MySingleton.setCurrentPageName(homeRoute);
          return LandingPage();
        },
        //        '/home_settings': (BuildContext context) => SettingsPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name!.split('/');
        if (pathElements[0] == homeRoute) {
          MySingleton.setCurrentPageName(homeRoute);
          return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
            settings: settings,
          );
        } else if (pathElements[0] == aboutRoute) {
          MySingleton.setCurrentPageName(aboutRoute);
          return MaterialPageRoute(
            builder: (BuildContext context) => AboutPage(),
            settings: settings,
          );
        } else if (pathElements[0] == faqRoute) {
          MySingleton.setCurrentPageName(faqRoute);
          return MaterialPageRoute(
            builder: (BuildContext context) => FaqPage(),
            settings: settings,
          );
        } else if (pathElements[0] == integrationsRoute) {
          MySingleton.setCurrentPageName(integrationsRoute);
          return MaterialPageRoute(
            builder: (BuildContext context) => IntegrationsPage(),
            settings: settings,
          );
        } else if (pathElements[0] == setUpRoute) {
          MySingleton.setCurrentPageName(setUpRoute);
          return MaterialPageRoute(
            builder: (BuildContext context) => SetUpPage(),
            settings: settings,
          );
        } else {
          MySingleton.setCurrentPageName(homeRoute);
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
