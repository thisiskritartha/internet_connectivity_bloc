part of 'settings_bloc.dart';

sealed class SettingsEvent {}

final class ToggleAppNotificationEvent extends SettingsEvent {}

final class ToggleEmailNotificationEvent extends SettingsEvent {}
