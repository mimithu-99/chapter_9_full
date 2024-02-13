import 'dart:convert';

import 'package:chap_9_part_3/pizza_3.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];

  //Future readJsonFile() async {
  Future<List<Pizza>> readJsonFile() async {
    String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzlist.json');
    List pizzaMapList = jsonDecode(myString);

    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(
          pizza, 30, 'Small Pizza', 'Very tasty', 100.00, 'google.com/images');
      myPizzas.add(myPizza);
    }
    // setState(() {
    //   pizzaString = myString;
    // });
    return myPizzas;
  }

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JSON'),
        ),
        body: ListView.builder(
          itemCount: myPizzas.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myPizzas[index].pizzaName),
              //subtitle: Text(myPizzas[index].id.toString()),
              subtitle: Text(myPizzas[index].description),
            );
          },
        ));
  }
}
