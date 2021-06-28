import 'package:flutter/material.dart';
import 'package:shoppingapp/models/product_detail.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    //final ProductDetailsArguments agrs =
    //  ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      //  appBar: CustomAppBar(rating: agrs.product.rating),
      //body: Body(product: agrs.product),
      //body: Body(product: ,),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments({@required this.product});
}
