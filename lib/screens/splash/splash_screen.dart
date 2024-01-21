import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/custom_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Center(
        child: Text('We Chat'),
      ),
    );
  }
}
