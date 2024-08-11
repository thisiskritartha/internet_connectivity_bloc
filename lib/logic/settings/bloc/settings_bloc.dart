import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(appNotifications: false, emailNotifications: false)) {
    on<ToggleAppNotificationEvent>(
        (event, emit) => emit(state.copyWith(appNotifications: !state.appNotifications)));

    on<ToggleEmailNotificationEvent>(
        (event, emit) => emit(state.copyWith(emailNotifications: !state.emailNotifications)));
  }
}
