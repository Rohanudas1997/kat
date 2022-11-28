import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/feature/authentication/cubit/authentication_cubit.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';
import 'package:kat_game/feature/settings/ui/widget/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.onLogoutTap,
  });
  final Function() onLogoutTap;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: const SettingsWidget(),
    );
  }
}
