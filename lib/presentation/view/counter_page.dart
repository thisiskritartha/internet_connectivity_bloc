import 'package:bloc_connectivity/constants/enum.dart';
import 'package:bloc_connectivity/logic/counter/bloc/counter_bloc.dart';
import 'package:bloc_connectivity/logic/internet/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> counterPageKey = GlobalKey<ScaffoldState>();

  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: counterPageKey,
      appBar: AppBar(
        title: const Text(
          'Counter using Bloc',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
            if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
              return const Text("Wifi");
            } else if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
              return const Text("Mobile");
            } else if (state is InternetDisconnected) {
              return const Text("Disconnected");
            }
            return const CircularProgressIndicator();
          }),
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.isIncremented!) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Counter Incremented Main"),
                    duration: Duration(milliseconds: 100),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Counter Decremented"),
                    duration: Duration(milliseconds: 100),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  "${state.count}",
                  style: const TextStyle(fontSize: 100.0),
                ),
              );
            },
          ),
          // MaterialButton(
          //   onPressed: () {
          //     Navigator.of(context).pushNamed("/second");
          //   },
          //   color: Colors.redAccent,
          //   child: const Text("Second screen"),
          // ),
          // const SizedBox(
          //   height: 24,
          // ),
          // MaterialButton(
          //   color: Colors.greenAccent,
          //   onPressed: () {
          //     Navigator.of(context).pushNamed("/third");
          //   },
          //   child: const Text('Third Screen'),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              heroTag: const Text("Counter first"),
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrement());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              heroTag: const Text("Counter second"),
              child: const Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrement());
              },
            ),
          ),
        ],
      ),
    );
  }
}
