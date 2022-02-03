import 'package:flutter/material.dart';
import 'package:flutter_examples/screens/home_screen.dart';
import 'package:flutter_examples/screens/user_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) {
          final args = routeSettings.arguments as Map<String, String>;

          return routeSettings.name == "users/detail"
              ? UserDetailScreen(userId: int.parse(args["id"]!))
              : const HomeScreen();
        });
      },
    );
  }
}
