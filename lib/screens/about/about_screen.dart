import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/custom_scaffold.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Text("About"),
    );
  }
}
