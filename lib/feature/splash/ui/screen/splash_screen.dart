import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';
import 'package:kat_game/feature/splash/cubit/startup_cubit.dart';
import 'package:kat_game/feature/splash/ui/widget/splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashWidget();
  }
}
