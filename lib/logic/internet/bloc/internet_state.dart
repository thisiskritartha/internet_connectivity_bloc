part of 'internet_bloc.dart';

sealed class InternetState extends Equatable {}

final class InternetLoading extends InternetState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'InternetLoading{}';
  }
}

final class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});

  @override
  List<Object?> get props => [connectionType];

  @override
  String toString() {
    return 'InternetConnected{connectionType: $connectionType}';
  }
}

final class InternetDisconnected extends InternetState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'InternetDisconnected{}';
  }
}
