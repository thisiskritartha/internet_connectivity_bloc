part of 'internet_bloc.dart';

sealed class InternetEvent extends Equatable {
  const InternetEvent();
}

final class InternetConnectedWifiEvent extends InternetEvent {
  @override
  List<Object?> get props => [];
}

final class InternetConnectedMobileEvent extends InternetEvent {
  @override
  List<Object?> get props => [];
}

final class InternetDisconnectedEvent extends InternetEvent {
  @override
  List<Object?> get props => [];
}
