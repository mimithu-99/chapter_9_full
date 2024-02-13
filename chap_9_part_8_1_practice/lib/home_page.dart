import 'dart:convert';

import 'package:chap_9_part_8_practice/models/model_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Flutter Rest Api'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getPost(),
          builder: ((context, AsyncSnapshot<List<PostModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title ?? ''),
                      subtitle: Text(snapshot.data![index].body ?? ''),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }

  Future<List<PostModel>> getPost() async {
    List<PostModel> posts = [];
    var result =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(result.body);

    if (result.statusCode == 200) {
      for (Map i in data) {
        posts.add(PostModel.fromJson(i));
      }
      return posts;
    } else {
      return posts;
    }
  }
}

/*

https://jsonplaceholder.typicode.com/posts
*/
