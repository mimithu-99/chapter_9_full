import 'package:chap_9_part_8_2_practice/services/product_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductsDetails extends StatefulWidget {
  int id;
  ProductsDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  late Future singleProduct;

  @override
  void initState() {
    singleProduct = ProdutService().getSingleProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: singleProduct,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data['title']),
                  Image.network(snapshot.data['image']),
                ],
              );
            }
            return const Center(
              child: Text('No data available'),
            );
          },
        ),
      ),
    );
  }

  //   return Scaffold(

  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           Text(snapsoht.data['title']),
  //           FutureBuilder(
  //             future: singleProduct,
  //             builder: (context, AsyncSnapshot snapshot) {
  //               if (snapshot.hasData) {
  //                 return Image.network(snapshot.data['image']);
  //               }
  //               return const Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
