import 'package:flutter/material.dart';
import 'package:flutter_learn/router/routes.dart';
import 'package:flutter_learn/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(AppRoutes.sigIn);
    });
    return const CustomScaffold(
      body: Center(
        child: Text(
          'We Chat',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
