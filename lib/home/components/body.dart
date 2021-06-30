import 'package:flutter/material.dart';
import 'package:shoppingapp/components/product_card.dart';
//import 'package:shoppingapp/Product/product_item.dart';
import 'package:shoppingapp/constants.dart';
import 'package:shoppingapp/detailScreen/detailScreen.dart';

import 'package:shoppingapp/home/components/categories.dart';
import 'package:shoppingapp/home/components/discount_banner.dart';
import 'package:shoppingapp/home/components/home_header.dart';
import 'package:shoppingapp/home/components/item.dart';
import 'package:shoppingapp/home/components/popular_product.dart';
import 'package:shoppingapp/home/components/special_offer.dart';
import 'package:shoppingapp/models/product_detail.dart';
//import 'package:shoppingapp/models/product_detail.dart';
import 'package:shoppingapp/size_config.dart';

class Body extends StatelessWidget {
  final List<Product> items;
  final Product item;

  const Body({Key key, this.items, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            //  SizedBox(height: getProportionateScreenWidth(20)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(20)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(40)),
            //  PopularProducts(
            //  items: items,
            //),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
