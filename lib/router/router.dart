import 'package:flutter/material.dart';
import 'package:flutter_learn/router/routes.dart';
import 'package:flutter_learn/screens/Home/home_screen.dart';
import 'package:flutter_learn/screens/SignIn/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.sigIn,
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/home:title',
      name: AppRoutes.homeScreen,
      builder: (context, state) {
        final query = state.pathParameters['title'];
        return HomeScreen(
          title: query,
        );
      },
    )
  ]);
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
