import 'package:bloc_connectivity/logic/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(
              'App ${state.appNotifications.toString().toUpperCase()}, Email ${state.emailNotifications.toString().toUpperCase()}',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              children: [
                SwitchListTile(
                  value: state.appNotifications,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.white,
                  onChanged: (newValue) {
                    context.read<SettingsBloc>().add(ToggleAppNotificationEvent());
                  },
                  title: const Text('App Notifications'),
                ),
                SwitchListTile(
                  value: state.emailNotifications,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.white,
                  onChanged: (newValue) {
                    context.read<SettingsBloc>().add(ToggleEmailNotificationEvent());
                  },
                  title: const Text('Email Notifications'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
