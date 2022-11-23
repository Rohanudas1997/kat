import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kat_game/feature/home/controller/home_controller.dart';
import 'package:kat_game/feature/login/controller/login_controller.dart';
import 'package:kat_game/feature/login/ui/screen/forgot.dart';
import 'package:kat_game/feature/login/ui/screen/login.dart';
import 'package:kat_game/feature/login/ui/screen/register.dart';
import 'package:kat_game/feature/splash/ui/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toast/toast.dart';
import 'firebase_options.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "katgame-2129d",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    LoginController loginuser = Get.put(LoginController());
    HomeController homeController = Get.put(HomeController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFf88f00),
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
