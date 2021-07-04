import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/admin/add_product.dart';
import 'package:shoppingapp/admin/edit/admin_product.dart';
import 'package:shoppingapp/admin/order/orders_grid_admin.dart';
import 'package:shoppingapp/check_out/order.dart';
import 'package:http/http.dart' as http;

class AdminOdersScren extends StatelessWidget {
  static String routeName = "Admin";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("User's Orders"),
            backgroundColor: Colors.deepOrange,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.store),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  Navigator.pushNamed(context, ManageProduct.routeName);
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text(
                    'Admin Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add_circle_outline),
                  title: Text('Add Product'),
                  enabled: true,
                  onTap: () {
                    Navigator.pushNamed(context, ManageProduct.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete_outline_outlined),
                  title: Text('Delete Product'),
                  enabled: true,
                  onTap: () {
                    Navigator.pushNamed(context, AdminProduct.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit_outlined),
                  title: Text('Edit Product'),
                  enabled: true,
                  onTap: () {
                    Navigator.pushNamed(context, AdminProduct.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.analytics_outlined),
                  title: const Text('Confirm Order'),
                  enabled: true,
                  onTap: () {
                    Navigator.pushNamed(context, AdminOdersScren.routeName);
                  },
                ),
              ],
            ),
          ),
          body: FutureBuilder(
              future: fetchOrder(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? OrdersList(
                        items: snapshot.data,
                      )
                    : Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
