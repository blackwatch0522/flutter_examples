import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/models/user.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  var dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  void initState() {
    super.initState();
    userFuture = fetch();
  }

  Future<User> fetch() async {
    final response = await dio
        .get("users/${widget.userId}")
        .then((response) => User.fromJson(response.data));
    return response;
  }

  Future<User>? userFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("유저 상세페이지"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<User>(
              future: userFuture,
              builder: (context, snapshot) {
                return snapshot.hasError
                    ? Center(
                        child: Text(snapshot.error.toString()),
                      )
                    : snapshot.hasData
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(snapshot.data?.name ?? ""),
                              Text(snapshot.data?.email ?? "")
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
              },
            )));
  }
}
