import 'dart:io'; 

import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'pizza_8.dart'; 






class HttpHelper {
final String authority = '02z2g.mocklab.io';
final String path = 'pizzalist';
 Future<List<Pizza>> getPizzaList() async {
 final Uri url = Uri.https(authority, path);
 final http.Response result = await http.get(url);
 if (result.statusCode == HttpStatus.ok) {
 final jsonResponse = json.decode(result.body);
 //provide a type argument to the map method to avoid type 
 //error
 List<Pizza> pizzas =
 jsonResponse.map<Pizza>((i) => 
 Pizza.fromJson(Pizza, 30, 'Small Pizza', 'Very tasty', 100.00, 'google.com/images')).toList();
 return pizzas;
 } else {
 return [];
 }
 
 }
