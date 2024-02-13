

import 'package:chap_9_part_8_2_practice/screens/products_details.dart';
import 'package:chap_9_part_8_2_practice/services/product_service.dart';
import 'package:flutter/material.dart';


class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Store'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future:  ProdutService().getProduct(),
        builder: (BuildContext contex, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Card(
              elevation: 4,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (contex, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(contex).push(MaterialPageRoute(
                          builder: (contex) => ProductsDetails(id: snapshot.data[index] ['id'],),
                        ));
                      },
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            snapshot.data[index]['image'],
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          )),
                      title: Text(snapshot.data[index]['title']),
                    );
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


/*

http status code.
*/