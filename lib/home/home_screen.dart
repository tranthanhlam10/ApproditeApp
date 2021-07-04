import 'package:flutter/material.dart';
import 'package:shoppingapp/components/custom_bottom_nav_bar.dart';
import 'package:shoppingapp/enums.dart';
import 'package:shoppingapp/home/components/body.dart';
import 'package:shoppingapp/models/product_detail.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  static String routeName = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchProduct(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? Body(
                    items: snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          }),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
