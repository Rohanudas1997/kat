import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/feature/authentication/cubit/authentication_cubit.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';
import 'package:kat_game/feature/authentication/ui/widget/register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: const RegisterWidget(),
    );
  }
}
