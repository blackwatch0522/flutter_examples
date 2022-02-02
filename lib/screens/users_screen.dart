import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  bool loading = false;
  String? error;
  List<User> data = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final response = await dio.get("users");
      setState(() {
        data = List<Map<String, dynamic>>.from(response.data)
            .map((json) => User.fromJson(json))
            .toList();
      });
    } catch (errors) {
      setState(() {
        error = errors.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("유저 목록"),
      ),
      body: loading
          ? const Center(
              child: Text("로딩중..."),
            )
          : error != null
              ? Center(
                  child: Text(error.toString()),
                )
              : ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index].name ?? "John Doe"),
                      subtitle: Text(data[index].email ?? "이메일 없음"),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2.0,
                    );
                  },
                ),
    );
  }
}
