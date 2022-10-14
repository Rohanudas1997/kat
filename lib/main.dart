import 'package:flutter/material.dart';
import 'package:kat_game/feature/splash/ui/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFf88f00),
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
