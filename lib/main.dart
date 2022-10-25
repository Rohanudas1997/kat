import 'package:flutter/material.dart';
import 'package:kat_game/feature/login/ui/screen/forgot.dart';
import 'package:kat_game/feature/login/ui/screen/login.dart';
import 'package:kat_game/feature/splash/ui/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class DefaultFirebaseOptions {}

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFf88f00),
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
