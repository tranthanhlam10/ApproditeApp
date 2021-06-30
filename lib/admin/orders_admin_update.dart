import 'package:flutter/material.dart';
import 'package:shoppingapp/check_out/order.dart';

class OrderCard extends StatelessWidget {
  OrderCard({this.order, this.press});

  final Order order;

  final Function press;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Image.network(
                //'https://ibb.co/25S4brZ', // lấy hình ảnh từ id
                //width: 150,
                //),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.order.status,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              "OrderPrice: ${this.order.totalPrice.toString()}",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            Text("Address: ${this.order.address}"),
                          ],
                        )))
              ]),
        ));
  }
}
