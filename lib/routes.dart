import 'package:flutter/widgets.dart';
import 'package:shoppingapp/cart/cart_screen.dart';
import 'package:shoppingapp/check_out/check_out_screen.dart';
//import 'package:shoppingapp/detailScreen/detailScreen.dart';
import 'package:shoppingapp/details/detail_screen.dart';
import 'package:shoppingapp/home/home_screen.dart';
import 'package:shoppingapp/login/loginscreen.dart';
//import 'package:shoppingapp/login/loginpage.dart';
import 'package:shoppingapp/profile/profile_screen.dart';
import 'package:shoppingapp/Product/product_screen.dart';
// ignore: unused_import
import 'package:shoppingapp/screens/splash/components/splash_contents.dart';
import 'package:shoppingapp/screens/splash/splash_screens.dart';
// ignore: duplicate_import
import 'package:shoppingapp/details/detail_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProductAll.routeName: (context) => ProductAll(),
  // ProductPage.routeName: (context) => ProductPage(),
  CreateAddressScreen.routeName: (context) =>
      CreateAddressScreen(), // màn hình check out
};
