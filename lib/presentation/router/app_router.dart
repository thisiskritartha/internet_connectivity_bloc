import 'package:flutter/material.dart';

import '../view/counter_page.dart';
import '../view/settings_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => CounterPage(),
        );

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );

      default:
        return null;
    }
  }
}
