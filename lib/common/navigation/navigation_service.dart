import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationService {
  static GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navKey => _navKey;

  static BuildContext get context => _navKey.currentState!.overlay!.context;

  static Future<T?> pushNamed<T extends Object?>(String route,
      [Object? args]) async {
    return await _navKey.currentState!.pushNamed(route, arguments: args);
  }

  static Future<T?> pushReplacementNamed<T extends Object?>(
      String route) async {
    return await _navKey.currentState!.pushReplacementNamed(route);
  }

  static Future<T?> push<T extends Object?>(Widget widget,
      {String? routeName}) async {
    return await _navKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  static Future<T?> pushAndRemoveUntil<T extends Object?>(Widget route,
      {String? routeName}) async {
    return await _navKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => route,
          settings: RouteSettings(name: routeName),
        ),
        (Route<dynamic> route) => false);
  }

  static Future<T?> pushReplacement<T extends Object?>(Widget widget,
      {String? routeName}) async {
    return await _navKey.currentState!.pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String routeName) async {
    return await _navKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  static void popUntilFirstPage() {
    return _navKey.currentState!.popUntil((route) => route.isFirst);
  }

  static void pop() {
    _navKey.currentState!.pop();
  }
}
