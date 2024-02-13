import 'dart:convert';
import 'package:http/http.dart' as http;

class ProdutService {
  Future getProduct() async {
    final productUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(productUrl);

    // print(response.statusCode);
    // print(response.body);

    return json.decode(response.body);
  }

  Future getSingleProduct(int id) async {
    final productUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(productUrl);

    // print(response.statusCode);
    // print(response.body);

    return json.decode(response.body);
  }
}
