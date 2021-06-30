import 'package:flutter/material.dart';
import 'package:shoppingapp/check_out/order.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppingapp/constants.dart';
import 'package:shoppingapp/models/global.dart';
import 'package:shoppingapp/models/product_detail.dart';
import 'package:shoppingapp/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    this.product,
    this.press,
    this.order,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final GestureTapCallback press;
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          //  onTap: () => Navigator.pushNamed(
          //    context,
          //   DetailsScreen.routeName,
          // arguments: ProductDetailsArguments(product: product),
          //),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Hero(
                  // tag: product.id.toString(),
                  //  child: Image.network(
                  //  'https://aphrodite-ecom.herokuapp.com/routes/${this.product.imageId}.jpg',
                  //width: 150,
                  // ),
                ),
              ),
              //  ),
              const SizedBox(height: 10),
              Text(
                this.order.id.toString(),
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${this.order.status}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  /* InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
