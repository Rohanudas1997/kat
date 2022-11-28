import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/constant/utils/size_utils.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/common/navigation/navigation_service.dart';
import 'package:kat_game/feature/authentication/ui/screen/login_screen.dart';
import 'package:kat_game/feature/authentication/ui/screen/register_screen.dart';
import 'package:kat_game/feature/home/controller/home_controller.dart';
import 'package:kat_game/feature/home/ui/screen/home_page.dart';
import 'package:kat_game/feature/authentication/ui/widget/login.dart';
import 'package:kat_game/feature/authentication/ui/widget/register.dart';
import 'package:kat_game/feature/splash/cubit/startup_cubit.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context: context);

    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocListener<StartupCubit, StartupState>(
      listener: (context, state) {
        if (state is StartupSuccess) {
          if (state.isAppOpenFirstTime) {
            NavigationService.pushAndRemoveUntil(
              const RegisterPage(),
            );
          } else if (state.isLoggedIn) {
            NavigationService.pushAndRemoveUntil(
              const HomePage(),
            );
          } else {
            NavigationService.pushAndRemoveUntil(
              const LoginPage(),
            );
          }
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Images.logo,
                  height: 100,
                ),
                const SizedBox(
                  height: 64,
                ),
                CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(theme.backgroundColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
