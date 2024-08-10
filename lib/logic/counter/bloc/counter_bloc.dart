import 'dart:async';

import 'package:bloc_connectivity/constants/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../internet/bloc/internet_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final InternetBloc internetBloc;
  StreamSubscription? internetStreamSubscription;

  CounterBloc({required this.internetBloc}) : super(const CounterState(count: 0)) {
    internetStreamSubscription = internetBloc.stream.listen((internetState) {
      if (internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi) {
        add(CounterIncrement());
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        add(CounterDecrement());
      }
    });

    on<CounterIncrement>((event, emit) => emit(CounterState(count: state.count + 1, isIncremented: true)));
    on<CounterDecrement>((event, emit) => emit(CounterState(count: state.count - 1, isIncremented: false)));
  }

  @override
  Future<void> close() async {
    internetStreamSubscription?.cancel();
    super.close();
  }
}
