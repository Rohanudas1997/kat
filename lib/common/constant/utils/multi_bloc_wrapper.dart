import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/common/http/firebase_provider.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';
import 'package:kat_game/feature/home/cubit/home_cubit.dart';
import 'package:kat_game/feature/splash/cubit/startup_cubit.dart';

class MultiBlocWrapper extends StatelessWidget {
  final Widget child;
  const MultiBlocWrapper({required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StartupCubit>(
          create: (context) => StartupCubit(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          )..fetchStartUpData(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            firebaseProvider: RepositoryProvider.of<FirebaseProvider>(context),
          )..fetchGames(),
        ),
      ],
      child: child,
    );
  }
}
