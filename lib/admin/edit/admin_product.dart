import 'package:flutter/material.dart';
//import 'package:shoppingapp/models/product_P.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/admin/edit/admin_product_list.dart';
import 'package:shoppingapp/models/product_detail.dart';

// hiển thị các sản phẩm
class AdminProduct extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;
  final Future<List<Productdetails>> productdetails;
  static String routeName = "AdminProduct";
  AdminProduct({Key key, this.title, this.products, this.productdetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Edit and Delete Product"),
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
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text(
            'Guide',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Tap to start updating product'),
            enabled: true),
        ListTile(
          leading: Icon(Icons.delete_outline_outlined),
          title: Text('Double tap to start deleting product'),
          enabled: true,
        )
      ])),
      body: FutureBuilder(
          future: fetchProduct(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? AdminProductList(
                    items: snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
