import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/cart/components/cart.dart';
import 'package:shoppingapp/cart/components/cart_card.dart';
import 'package:shoppingapp/check_out/check_out_screen.dart';
import 'package:shoppingapp/components/default_button.dart';
import 'package:shoppingapp/size_config.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
          ),
          backgroundColor: Colors.orange,
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: cart.item.length,
                    itemBuilder: (ctx, i) => CartPdt(
                        cart.item.values.toList()[i].id,
                        cart.item.keys.toList()[i],
                        cart.item.values.toList()[i].price,
                        cart.item.values.toList()[i].quantity,
                        cart.item.values.toList()[i].name)),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: cart.totalAmount.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {
                        Navigator.pushNamed(
                            context, CreateAddressScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
