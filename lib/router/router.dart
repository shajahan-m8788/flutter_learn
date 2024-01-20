import 'package:flutter/material.dart';
import 'package:flutter_learn/router/routes.dart';
import 'package:flutter_learn/screens/Home/home_screen.dart';
import 'package:flutter_learn/screens/SignIn/sign_in_screen.dart';

class AppRouter {
  static String currentRoute = '/';
  static RouteArguments? routeArgs;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    var uri = Uri.parse(settings.name ?? '/');
    currentRoute = uri.path;
    try {
      if (settings.arguments != null) {
        routeArgs = settings.arguments as RouteArguments;
      }
      switch (uri.path) {
        case '/':
        case AppRoutes.homeScreen:
          page = const HomeScreen();
        default:
          page = const SignInScreen();
      }
    } catch (e) {
      currentRoute = AppRoutes.sigIn;
      page = const SignInScreen();
    }
    return PageRouteBuilder(
      settings: RouteSettings(name: currentRoute),
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(seconds: 0),
      reverseTransitionDuration: const Duration(seconds: 0),
    );
  }
}

class RouteArguments {
  int? id;
  String? name;
  String? url;

  RouteArguments({
    this.id,
    this.name,
    this.url,
  });

  factory RouteArguments.fromJson(Map<String, dynamic> json) => RouteArguments(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
