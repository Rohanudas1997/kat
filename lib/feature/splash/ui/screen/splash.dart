import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/feature/login/ui/screen/login.dart';
import 'package:kat_game/feature/login/ui/screen/register.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Timer timer ;
  bool firstTimeLogin = true;

  _getFirstTimeLogin()async{
    firstTimeLogin = await SharedPref().getFirstTimeLogin();
  }

  @override
  void initState() {
    _getFirstTimeLogin();
    timer = Timer.periodic(
      const Duration(seconds: 2), 
      (_){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return  firstTimeLogin ? const Register(): const Login();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                valueColor: AlwaysStoppedAnimation<Color>(theme.backgroundColor)
              ),
          ],
          ),
        ),
      ),
    );
  }
}
