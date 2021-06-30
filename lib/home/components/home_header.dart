import 'package:flutter/material.dart';
import 'package:shoppingapp/admin/orders_admin.dart';
import 'package:shoppingapp/cart/cart_screen.dart';
import 'package:shoppingapp/home/components/icon_btn_with_couter.dart';

import 'package:shoppingapp/constants.dart';
import 'package:shoppingapp/size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () =>
                Navigator.pushNamed(context, AdminOdersScren.routeName),
          ),
        ],
      ),
    );
  }
}
