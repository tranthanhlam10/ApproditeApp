import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/components/default_button.dart';
import 'package:shoppingapp/models/global.dart';
import 'package:shoppingapp/size_config.dart';
// thêm sản phẩm vào cart
import 'package:shoppingapp/cart/components/cart.dart';
import 'package:shoppingapp/models/product_detail.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  static String routeName = "ProductAll";
  ProductPage({Key key, this.item, this.details}) : super(key: key);
  List<Product> product;
  final Productdetails details;
  final Product item;
  @override
  Widget build(BuildContext context) {
    //final productId = ModalRoute.of(context).settings.arguments as String;
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: 2,
                      child: Image.network(
                        'https://aphrodite-ecom.herokuapp.com/routes/${this.item.id}.jpg',
                        width: getProportionateScreenWidth(238),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Price:${this.item.price.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)),
                      Text(this.item.description),
                      DefaultButton(
                        text: "Add To Cart",
                        press: () {
                          cart.addItem(this.item.id.toString(), this.item.name,
                              this.item.price);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(
                                  seconds:
                                      3), //Hiển thị thông báo khi thêm sản phẩm vào giỏ hàng  còn bị lỗi
                              content: Text('Item Added to Cart')));
                        },
                      )
                    ],
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
