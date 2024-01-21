import 'package:flutter/material.dart';
import 'package:flutter_learn/components/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final String? title;
  const HomeScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    // final _auth = FirebaseAuth.instance
    return CustomScaffold(
      appBar: AppBar(
        title: const Text("Home screen",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(children: [
        Image.asset('assets/images/image1.jpg'),
        TextButton(
            onPressed: () {
              print(title!);
            },
            child: const Text('texti'))
      ]),
    );
  }
}
