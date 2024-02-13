class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json['id'].toString()) ?? 0,
        pizzaName = json['pizzaName'].toString(),
        description = json['description'].toString(),
        price = double.tryParse(json['price'].toString()) ?? 0,
        imageUrl = json['imageUrl'].toString();
}

            

// class Pizza {
//  int id;
//   String pizzaName;
//   String description;
//   double price;
//   String imageUrl;

// Pizza.fromJson(Map<String, dynamic> json, this.id, this.pizzaName, this.description, this.price, this.imageUrl) {
//  id = int.tryParse(json['id'].toString()) ?? 0;
//  pizzaName = json['pizzaName'] != null ? json['pizzaName'].
// toString() : 'No name';
//  description =
//  (json['description'] != null) ? json['description'].
// toString() : '';
//  price = double.tryParse(json['price'].toString()) ?? 0;
//  imageUrl = json['imageUrl'] ?? '';}



