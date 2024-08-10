part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;
  final bool? isIncremented;
  const CounterState({required this.count, this.isIncremented});

  @override
  List<Object?> get props => [count, isIncremented];
}
