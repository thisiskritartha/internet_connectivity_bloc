import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/enum.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetBloc({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult[0] == ConnectivityResult.mobile) {
        add(InternetConnectedMobileEvent());
      } else if (connectivityResult[0] == ConnectivityResult.wifi) {
        add(InternetConnectedWifiEvent());
      } else if (connectivityResult[0] == ConnectivityResult.none) {
        add(InternetDisconnectedEvent());
      }
    });

    on<InternetConnectedMobileEvent>((event, emit) {
      emit(InternetConnected(connectionType: ConnectionType.mobile));
    });

    on<InternetConnectedWifiEvent>((InternetEvent event, Emitter<InternetState> emit) {
      emit(InternetConnected(connectionType: ConnectionType.wifi));
    });

    on<InternetDisconnectedEvent>((event, emit) => emit(InternetDisconnected()));
  }

  @override
  Future<void> close() async {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
