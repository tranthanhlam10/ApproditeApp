import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/cart/components/cart.dart';
import 'package:shoppingapp/constants.dart';
// ignore: unused_import
import 'package:shoppingapp/routes.dart';
import 'package:shoppingapp/screens/splash/splash_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Cart(),
          )
        ],

        
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aphrodite App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Muli",
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kTextColor),
              bodyText2: TextStyle(color: kTextColor),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}
