import 'package:chap_9_part_11/http_helper.dart';
import 'package:chap_9_part_11/pizza_11.dart';
import 'package:chap_9_part_11/pizza_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PizzaDetailScreen(pizza: Pizza(), isNew: true,),
    );
  }
//   return ListView.builder(
//  itemCount: (pizzas.data == null) ? 0 : pizzas.data.length,
//  itemBuilder: (BuildContext context, int position) {
//  return Dismissible(
//  key: Key(position.toString()),
//  onDismissed: (item) {
// HttpHelper helper = HttpHelper();
//  pizzas.data!.removeWhere(
//  (element) => element.id == pizzas.
// data![position].id);
//  helper.deletePizza(pizzas.data![position].
// id!);
//  },
//  child: ListTile(..
}
