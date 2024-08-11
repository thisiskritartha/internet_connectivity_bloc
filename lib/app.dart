import 'package:bloc_connectivity/logic/internet/bloc/internet_bloc.dart';
import 'package:bloc_connectivity/logic/settings/bloc/settings_bloc.dart';
import 'package:bloc_connectivity/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/counter/bloc/counter_bloc.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  App({required this.appRouter, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => CounterBloc(internetBloc: BlocProvider.of<InternetBloc>(context)),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
