import 'package:flutter/material.dart';
//import 'package:shoppingapp/models/product_P.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/Product/product_list.dart';
import 'package:shoppingapp/cart/cart_screen.dart';
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
              // handle the press
            },
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
