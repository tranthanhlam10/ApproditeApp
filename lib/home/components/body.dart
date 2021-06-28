import 'package:flutter/material.dart';

import 'package:shoppingapp/home/components/categories.dart';
import 'package:shoppingapp/home/components/discount_banner.dart';
import 'package:shoppingapp/home/components/home_header.dart';
import 'package:shoppingapp/home/components/popular_product.dart';
import 'package:shoppingapp/home/components/special_offer.dart';
//import 'package:shoppingapp/models/product_detail.dart';
import 'package:shoppingapp/size_config.dart';

class Body extends StatelessWidget {
  get http => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(20)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(40)),
            //   PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
