import 'package:flutter/material.dart';
//import 'package:shoppingapp/Product/product_item.dart';
import 'package:shoppingapp/cart/cart_screen.dart';
import 'package:shoppingapp/components/product_card.dart';
import 'package:shoppingapp/constants.dart';
import 'package:shoppingapp/detailScreen/detailScreen.dart';
import 'package:shoppingapp/home/components/icon_btn_with_couter.dart';
import 'package:shoppingapp/home/components/search_field.dart';
import 'package:shoppingapp/models/product_detail.dart';
import 'package:shoppingapp/size_config.dart';

class Body1 extends StatelessWidget {
  final List<Product> items;
  final Product item;

  const Body1({Key key, this.items, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children:
          //<Widget>
          [
        /*Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Product",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),*/

        Padding(
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
                press: () {},
              ),
            ],
          ),
        ),
        //  Categories(),
        Expanded(
          child: Padding(
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
        ),
      ],
    );
    //));
  }
}
