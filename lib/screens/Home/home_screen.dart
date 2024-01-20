import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final _auth = FirebaseAuth.instance
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(children: [
        Image.asset('assets/images/image1.jpg'),
        TextButton(onPressed: () {}, child: const Text('texti'))
      ]),
    );
  }
}
