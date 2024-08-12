import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    //print(bloc);
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // print(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    print(change);
    super.onChange(bloc, change);
  }

  // @override
  // Future<void> onEvent(Bloc<dynamic, dynamic> bloc, Object event) {
  //   print(event);
  //   super.onEvent(bloc, event);
  // }
}
