import 'package:bloc_connectivity/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  return runApp(App(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}
