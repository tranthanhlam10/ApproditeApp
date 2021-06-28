import 'package:flutter/material.dart';
//import 'package:shoppingapp/models/product_P.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/Product/product_list.dart';
import 'package:shoppingapp/models/product_detail.dart';

// hiển thị các sản phẩm
class ProductAll extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;
  final Future<List<Productdetails>> productdetails;
  static String routeName = "ProductAll";
  ProductAll({Key key, this.title, this.products, this.productdetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("All Product"),
      ),
      body: FutureBuilder(
          future: fetchProduct(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? ProductList(
                    items: snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
