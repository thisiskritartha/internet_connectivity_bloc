import 'package:flutter/material.dart';

import '../view/counter_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => CounterPage(),
        );

      default:
        return null;
    }
  }
}
