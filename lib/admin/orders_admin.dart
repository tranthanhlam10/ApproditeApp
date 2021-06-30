import 'package:flutter/material.dart';
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
