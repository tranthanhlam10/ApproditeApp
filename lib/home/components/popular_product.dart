import 'package:flutter/material.dart';

import 'package:shoppingapp/constants.dart';
import 'package:shoppingapp/detailScreen/detailScreen.dart';

import 'package:shoppingapp/components/product_card.dart';

import 'package:shoppingapp/models/product_detail.dart';
import 'package:shoppingapp/size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;

class PopularProducts extends StatelessWidget {
  final List<Product> items;
  final Product item;
  const PopularProducts({Key key, this.items, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ProductCard(
                    product: items[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            item: items[index],
                          ),
                        )),
                  )),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox.shrink(), // here by default width and height is 0

              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
