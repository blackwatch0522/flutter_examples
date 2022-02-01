import 'package:flutter/material.dart';
import 'package:flutter_examples/screens/my_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Example")),
      body: Container(
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyScreen()),
            );
          },
          icon: const Icon(Icons.person),
        ),
      ),
    );
  }
}
