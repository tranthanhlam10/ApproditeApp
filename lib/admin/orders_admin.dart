import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/admin/manage_product.dart';
import 'package:shoppingapp/admin/orders_grid_admin.dart';
import 'package:shoppingapp/check_out/order.dart';
import 'package:http/http.dart' as http;

class AdminOdersScren extends StatelessWidget {
  static String routeName = "test";

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
              children: const <Widget>[
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
                  leading: Icon(Icons.message),
                  title: Text('Manage Product'),
                  enabled: true,
                  // onTap: _tapCallback,
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: const Text('Manage Order'),
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

  void _tapCallback() {
    BuildContext context;
    Navigator.pushNamed(context, ManageProduct.routeName);
  }
}

void managescreen() {
  BuildContext context;
  Navigator.pushNamed(context, ManageProduct.routeName);
}
