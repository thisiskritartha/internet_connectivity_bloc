import 'dart:async';
import 'dart:convert';

import 'package:bloc_connectivity/constants/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../internet/bloc/internet_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
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

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}
