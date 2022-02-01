import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Screen"),
        centerTitle: true,
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "프로필",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
