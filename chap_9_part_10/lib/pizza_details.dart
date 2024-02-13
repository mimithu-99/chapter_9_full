import 'package:chap_9_part_10/http_helper.dart';
import 'package:chap_9_part_10/pizza_10.dart';

import 'package:flutter/material.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  PizzaDetailScreen(pizza: Pizza(), isNew: true,),
    );
  }
}

class PizzaDetailScreen extends StatefulWidget {
  
final Pizza pizza;
 final bool isNew;
 const PizzaDetailScreen({super.key,  required this.pizza, required this.isNew});

//const PizzaDetailScreen({Key? key, required this.pizza, required this.isNew}) : super(key: key);

  
  //const PizzaDetailScreen({super.key});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String operationResult = '';

  Future postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text)!;
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text)!;
    pizza.imageUrl = txtImageUrl.text;
    String result = await helper.postPizza(pizza);
    setState(() {
      operationResult = result;
    });
  }

@override
 void initState() {
 if (!widget.isNew) {
 txtId.text = widget.pizza.id.toString();
 txtName.text = widget.pizza.pizzaName!;
 txtDescription.text = widget.pizza.description!;
 txtPrice.text = widget.pizza.price.toString();
 txtImageUrl.text = widget.pizza.imageUrl!;
 }
 super.initState();
 }





  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                    backgroundColor: Colors.green[200], color: Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtName,
                decoration:
                    const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtDescription,
                decoration:
                    const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(
                height: 48,
              ),
              ElevatedButton(
                child: const Text('Send Post'),
                onPressed: () {
                  postPizza();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  PizzaDetailScreen(
                    pizza: Pizza(),
                    isNew: true,
                  )),
            );
          }),
    );
  }
}









// import 'package:chap_9_part_10/http_helper.dart';
// import 'package:chap_9_part_10/pizza_10.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home:  PizzaDetailScreen(
//         pizza: Pizza(),
//         isNew: true,
//       ),
//     );
//   }
// }

// class PizzaDetailScreen extends StatefulWidget {
//   final Pizza pizza;
//   final bool isNew;

//   const PizzaDetailScreen({
//     Key? key,
//     required this.pizza,
//     required this.isNew,
//   }) : super(key: key);

//   @override
//   State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
// }

// class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
//   final TextEditingController txtId = TextEditingController();
//   final TextEditingController txtName = TextEditingController();
//   final TextEditingController txtDescription = TextEditingController();
//   final TextEditingController txtPrice = TextEditingController();
//   final TextEditingController txtImageUrl = TextEditingController();
//   String operationResult = '';

//   @override
//   void initState() {
//     if (!widget.isNew) {
//       txtId.text = widget.pizza.id.toString();
//       txtName.text = widget.pizza.pizzaName!;
//       txtDescription.text = widget.pizza.description!;
//       txtPrice.text = widget.pizza.price.toString();
//       txtImageUrl.text = widget.pizza.imageUrl!;
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     txtId.dispose();
//     txtName.dispose();
//     txtDescription.dispose();
//     txtPrice.dispose();
//     txtImageUrl.dispose();
//     super.dispose();
//   }

//   Future<void> postPizza() async {
//     final HttpHelper helper = HttpHelper();
//     final Pizza pizza = Pizza(
//       id: int.tryParse(txtId.text)!,
//       pizzaName: txtName.text,
//       description: txtDescription.text,
//       price: double.tryParse(txtPrice.text)!,
//       imageUrl: txtImageUrl.text,
//     );
//     final String result = await helper.postPizza(pizza);
//     setState(() {
//       operationResult = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pizza Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 operationResult,
//                 style: const TextStyle(
//                   backgroundColor: Colors.greenAccent,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtId,
//                 decoration: const InputDecoration(hintText: 'Insert ID'),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtName,
//                 decoration:
//                     const InputDecoration(hintText: 'Insert Pizza Name'),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtDescription,
//                 decoration:
//                     const InputDecoration(hintText: 'Insert Description'),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtPrice,
//                 decoration: const InputDecoration(hintText: 'Insert Price'),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtImageUrl,
//                 decoration:
//                     const InputDecoration(hintText: 'Insert Image Url'),
//               ),
//               const SizedBox(height: 48),
//               ElevatedButton(
//                 onPressed: postPizza,
//                 child: const Text('Send Post'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PizzaDetailScreen(
//                 pizza: Pizza(),
//                 isNew: true,
//               ),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
