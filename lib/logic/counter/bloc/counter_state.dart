part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;
  final bool? isIncremented;

  @override
  List<Object?> get props => [count, isIncremented];

  const CounterState({
    required this.count,
    this.isIncremented,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'isIncremented': isIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      count: map['count'],
      isIncremented: map['isIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source));
}
