import 'package:flutter/material.dart';
import 'package:flutter_examples/screens/my_screen.dart';
import 'package:flutter_examples/screens/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Example")),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyScreen()),
                  );
                },
                icon: const Icon(Icons.person),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersScreen()),
                  );
                },
                child: const Text("유져 목록"),
              ),
            ],
          )),
    );
  }
}
