part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  const SettingsState({required this.appNotifications, required this.emailNotifications});

  SettingsState copyWith({bool? appNotifications, bool? emailNotifications}) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  List<Object> get props => [
        emailNotifications,
        appNotifications,
      ];
}
