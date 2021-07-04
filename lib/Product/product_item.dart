import 'package:flutter/material.dart';
import 'package:shoppingapp/models/product_detail.dart';
import 'package:http/http.dart' as http;

class ProductCard extends StatelessWidget {
  ProductCard({this.item, this.productdetails, this.press});

  final Product item;
  final Productdetails productdetails;
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
                Image.network(
                  'https://aphrodite-ecom.herokuapp.com/routes/${this.item.id}.jpg', // lấy hình ảnh từ id
                  width: 150,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              "Price: ${this.item.price.toString()}",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            Text("Brand: ${this.item.brand.name}"),
                          ],
                        )))
              ]),
        ));
  }
}

int detail() {
  // ignore: unused_local_variable
  Productdetails detail;
  fetchProductdetails(http.Client());
  return detail.price;
}
