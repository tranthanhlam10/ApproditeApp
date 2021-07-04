import 'package:flutter/widgets.dart';
import 'package:shoppingapp/admin/add_product.dart';
import 'package:shoppingapp/admin/edit/admin_product.dart';
import 'package:shoppingapp/admin/order/orders_admin.dart';
import 'package:shoppingapp/cart/cart_screen.dart';
import 'package:shoppingapp/check_out/check_out_screen.dart';
import 'package:shoppingapp/home/home_screen.dart';
import 'package:shoppingapp/login/loginscreen.dart';
import 'package:shoppingapp/profile/profile_screen.dart';
import 'package:shoppingapp/Product/product_screen.dart';
import 'package:shoppingapp/screens/splash/splash_screens.dart';
// ignore: duplicate_import

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProductAll.routeName: (context) => ProductAll(),
  CreateAddressScreen.routeName: (context) =>
      CreateAddressScreen(), // màn hình check out
  AdminOdersScren.routeName: (context) => AdminOdersScren(),
  ManageProduct.routeName: (context) => ManageProduct(),
  AdminProduct.routeName: (context) => AdminProduct(),
};
