// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'pizza_9.dart';

// class HttpHelper {
//   final String authority = '02z2g.mocklab.io';
//   final String path = 'pizzalist';
//   Future<List<PizzaList_9>> getPizzaList() async {
//     final Uri url = Uri.https(authority, path);
//     final http.Response result = await http.get(url);
//     if (result.statusCode == HttpStatus.ok) {
//       final jsonResponse = json.decode(result.body);
//       //provide a type argument to the map method to avoid type
//       //error

//       Future<String> postPizza(PizzaList_9 pizza) async {
//         const postPath = '/pizza';
//         String post = json.encode(pizza.toJson());
//         Uri url = Uri.https(authority, postPath);
//         http.Response r = await http.post(
//           url,
//           body: post,
//         );
//         return r.body;
//       }

//       List<PizzaList_9> pizzas = jsonResponse
//           .map<PizzaList_9>((i) => PizzaList_9.fromJson(pizza, 30,
//               'Small Pizza', 'Very tasty', 100.00, 'google.com/images'))
//           .toList();
//       return pizzas;
//     } else {
//       return [];
//     }
//   }

//   postPizza(PizzaList_9 pizza) {
//     return PizzaList_9();
//   }
// }
