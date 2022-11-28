import 'package:flutter/material.dart';
import 'package:kat_game/app/theme.dart';
import 'package:kat_game/common/constant/strings.dart';
import 'package:kat_game/common/constant/utils/multi_bloc_wrapper.dart';
import 'package:kat_game/common/constant/utils/multi_repository.dart';
import 'package:kat_game/common/navigation/navigation_service.dart';
import 'package:kat_game/feature/splash/ui/screen/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryWrapper(
      child: MultiBlocWrapper(
        child: MaterialApp(
          navigatorKey: NavigationService.navKey,
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          title: Strings.APP_TITLE,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
