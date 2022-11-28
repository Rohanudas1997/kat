import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/common/http/firebase_provider.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';
import 'package:kat_game/feature/home/resource/home_repository.dart';

class MultiRepositoryWrapper extends StatelessWidget {
  final Widget child;
  const MultiRepositoryWrapper({required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FirebaseProvider>(
          create: (context) => FirebaseProvider(),
          lazy: true,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
              firebaseProvider:
                  RepositoryProvider.of<FirebaseProvider>(context))
            ..initialState(),
          lazy: true,
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(
              firebaseProvider:
                  RepositoryProvider.of<FirebaseProvider>(context)),
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
