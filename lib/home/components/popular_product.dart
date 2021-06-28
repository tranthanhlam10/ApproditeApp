import 'package:flutter/material.dart';
//import 'package:shoppingapp/Product/product_list.dart';
//import 'package:shoppingapp/components/product_card.dart';
//import 'package:shoppingapp/detailScreen/detailScreen.dart';
import 'package:shoppingapp/models/product_detail.dart';
//import 'package:shoppingapp/size_config.dart';
//import 'section_title.dart';
import 'package:http/http.dart' as http;

class PopularProducts extends StatelessWidget {
  final List<Product> items;
  final Product item;
  const PopularProducts({Key key, this.items, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FutureBuilder(
              future: fetchProduct(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Text(this.item.name,
                        style: TextStyle(fontWeight: FontWeight.bold))
                    : Center(child: CircularProgressIndicator());
              }),
          Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold))
        ])
      ],
    );
  }
}
