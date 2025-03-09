import 'package:site/presentation/route_names.dart';

/// Singleton for all the site
class MySingleton {
  /// Factory method of the singleton
  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal();

  static final MySingleton _singleton = MySingleton._internal();

  /// Saves the current page name
  static String? _currentPageName;

  /// Getting the current page name
  static String get getCurrentPageName => _currentPageName ??= homeRoute;

  /// Set the current page name
  static Set<String>? setCurrentPageName(String currentPageName) {
    _currentPageName = currentPageName;
    return null;
  }
}
