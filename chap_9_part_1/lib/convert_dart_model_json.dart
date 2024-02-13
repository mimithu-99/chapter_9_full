import 'dart:convert';

import 'package:chap_9_part_1/pizza_1.dart';
import 'package:flutter/material.dart';

class MyHomPage extends StatefulWidget {
  const MyHomPage({super.key});

  @override
  State<MyHomPage> createState() => _MyHomPageState();
}

class _MyHomPageState extends State<MyHomPage> {
  String pizzaString = '';

  List<Pizza> myPizzas = [];

  //Future readJsonFile() async {

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    return myPizzas;

    // setState(() {
    //   pizzaString = myString;
    // });
  }

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("JSON"),
        ),
        body: ListView.builder(
          itemCount: myPizzas.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myPizzas[index].pizzaName),
              subtitle: Text(myPizzas[index].description),
            );
          },
        ));
  }
  
}

/*

class MyHomPage extends StatefulWidget {
  const MyHomPage({super.key});

  @override
  State<MyHomPage> createState() => _MyHomPageState();
}

*/
/*
Flutter এ JSON (JavaScript Object Notation) হল একটি পোপুলার ডেটা ফরম্যাট, যা ডেটা সংগ্রহ এবং ডেটা পরিবর্তনের জন্য ব্যবহৃত হয়। এটি একটি লাইটওয়েট, স্ট্রিং-বেসড ডেটা ইন্টারছেঞ্জ ফরম্যাট, যা মানুষের জন্য একটি সহজ সম্প্রদায়ে পাঠ্য আবার মেশিনের জন্য অনুকূল ডেটা প্রতিষ্ঠানের মান সম্পর্কে কাজ করে।

Flutter এ, আপনি ডার্ট মডেল অবজেক্টগুলি থেকে JSON বস্তুগুলির তৈরি করতে পারেন এবং পরিসংখ্যান ডাটা থেকে ডার্ট অবজেক্টগুলি তৈরি করতে পারেন। এটি সাধারণত ডাটা সারির জন্য ব্যবহৃত হয় যেমন একটি API থেকে ডেটা পোস্ট করা বা ডেটা গ্রহণ করা।

একটি ডার্ট অবজেক্টের জন্য একটি JSON বস্তু তৈরি করার জন্য, ডার্ট অবজেক্টের toJson() মেথডটি ব্যবহার করা হয়। এই মেথড ডার্ট অবজেক্ট থেকে একটি JSON বস্তু তৈরি করে।

একটি JSON বস্তু থেকে ডার্ট অবজেক্ট তৈরি করার জন্য, আপনি ডার্টের json.decode() ফাংশন ব্যবহার করে JSON বস্তুকে ডার্ট মান তে পার্স করতে পারেন।

একটি উদাহরণ দেখা যাক:

ধরুন আপনি একটি ডার্ট ক্লাস আছে User নামে, যেখানে ইউজারের তথ্য সংরক্ষণ করা হয়েছে:

dart
Copy code
class User {
  final String name;
  final int age;
  final String email;

  User({required this.name, required this.age, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}
এখন, আপনি আপনার User অবজেক্ট থেকে JSON তৈরি করতে পারেন এবং ডাটা পোস্ট করতে পারেন API এবং সার্ভার প্রতি:

dart
Copy code
// একটি ইউজার অবজেক্ট তৈরি করা
User user = User(name: 'John Doe', age: 30, email: 'john@example.com');

// ডার্ট অবজেক্ট থেকে JSON তৈরি করা
Map<String, dynamic> userJson = user.toJson();
print(userJson);
// আউটপুট: {name: John Doe, age: 30, email: john@example.com}

// JSON থেকে ডার্ট অবজেক্ট তৈরি করা
String jsonStr = '{"name": "Jane Doe", "age": 25, "email": "jane@example.com"}';
Map<String, dynamic> jsonMap = json.decode(jsonStr);
User userFromJson = User.fromJson(jsonMap);
print(userFromJson.name); // Jane Doe
print(userFromJson.age); // 25
print(userFromJson.email); // jane@example.com
এই উদাহরণে, User ক্লাসে আমরা একটি কাস্টম ফ্যাক্টরি মেথড fromJson এবং toJson মেথড ব্যবহার করে ডার্ট অবজেক্ট থেকে JSON বস্তু তৈরি এবং ডার্ট অবজেক্ট থেকে JSON বস্তু তৈরি করতে দেখানো হয়েছে। এছাড়া, আমরা ডার্টের json.decode() ফাংশন ব্যবহার করে JSON স্ট্রিং থেকে ডার্ট মান তৈরি করার প্রক্রিয়ার উদাহরণ দেখানো হয়েছে।


*/