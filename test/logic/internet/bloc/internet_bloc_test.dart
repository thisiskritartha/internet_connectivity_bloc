import 'package:bloc_connectivity/constants/enum.dart';
import 'package:bloc_connectivity/logic/internet/bloc/internet_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Internet Bloc", () {
    late Connectivity connectivity;
    late InternetBloc internetBloc;
    setUp(() {
      connectivity = Connectivity();
      internetBloc = InternetBloc(connectivity: connectivity);
    });

    tearDown(() {
      internetBloc.close();
    });

    blocTest<InternetBloc, InternetState>(
      "Emit [InternetConnected(connectionType: ConnectionType.mobile)] when connected to mobile",
      build: () => internetBloc,
      act: (bloc) => bloc.add(InternetConnectedMobileEvent()),
      expect: () => [InternetConnected(connectionType: ConnectionType.mobile)],
    );

    blocTest<InternetBloc, InternetState>(
      "Emit [InternetConnected(connectionType: ConnectionType.wifi)] when connected to wifi",
      build: () => internetBloc,
      act: (bloc) => bloc.add(InternetConnectedWifiEvent()),
      expect: () => [InternetConnected(connectionType: ConnectionType.wifi)],
    );

    blocTest<InternetBloc, InternetState>(
      "Emit [InternetDisconnected()] when connected to none",
      build: () => internetBloc,
      act: (bloc) => bloc.add(InternetDisconnectedEvent()),
      expect: () => [InternetDisconnected()],
    );
  });
}
