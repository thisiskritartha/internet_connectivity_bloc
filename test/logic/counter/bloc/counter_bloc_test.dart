import 'package:bloc_connectivity/logic/counter/bloc/counter_bloc.dart';
import 'package:bloc_connectivity/logic/internet/bloc/internet_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CounterBloc', () {
    late CounterBloc counterBloc;
    late InternetBloc internetBloc;

    setUp(() {
      internetBloc = InternetBloc(connectivity: Connectivity());
      counterBloc = CounterBloc(internetBloc: internetBloc);
    });

    tearDown(() {
      counterBloc.close();
      internetBloc.close();
    });

    test("The initial state for the counter bloc is counterState(count:0)", () {
      expect(counterBloc.state, const CounterState(count: 0));
    });

    blocTest<CounterBloc, CounterState>(
      'Emits [CounterState(count: 1, isIncremented: true] when connected to wifi.',
      build: () => counterBloc,
      act: (bloc) {
        internetBloc.add(InternetConnectedWifiEvent());
      },
      expect: () => <CounterState>[
        const CounterState(count: 1, isIncremented: true),
      ],
    );

    blocTest(
      "Emit [CounterState(count: -1, isIncremented: false) when connected to mobile",
      build: () => counterBloc,
      act: (bloc) {
        internetBloc.add(InternetConnectedMobileEvent());
      },
      expect: () => <CounterState>[const CounterState(count: -1, isIncremented: false)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits no states when InternetBloc emits InternetDisconnected',
      build: () => counterBloc,
      act: (bloc) => internetBloc.add(InternetDisconnectedEvent()),
      expect: () => [],
    );

    blocTest(
      "Emit [CounterState(count: 1, isIncremented: true)] when pressed",
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(CounterIncrement());
      },
      expect: () => [CounterState(count: 1, isIncremented: true)],
    );
  });
}
