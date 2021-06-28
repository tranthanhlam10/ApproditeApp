import 'package:flutter/material.dart';
//import 'package:shoppingapp/cart/components/body.dart';
import 'package:shoppingapp/components/custom_bottom_nav_bar.dart';

import 'package:shoppingapp/enums.dart';

import 'package:shoppingapp/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: ProductScreen(),
      body: Body(),
      //body: PopularProducts(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
