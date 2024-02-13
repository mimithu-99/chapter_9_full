import 'dart:io';
import 'package:chap_9_part_10/pizza_10.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHelper {
  final String authority = '02z2g.mocklab.io';
  final String path = 'pizzalist';
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type error
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  postPizza(Pizza pizza) {
    
  }

  //postPizza(Pizza pizza) {}

  Future<String> putPizza(Pizza pizza) async {
 const putPath = '/pizza';
 String put = json.encode(pizza.toJson());
 Uri url = Uri.https(authority, putPath);
 http.Response r = await http.put(
 url,
 body: put,
 );
 return r.body;
 }
 }
