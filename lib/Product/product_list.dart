import 'package:flutter/material.dart';
import 'package:shoppingapp/Product/product_item.dart';
import 'package:shoppingapp/detailScreen/detailScreen.dart';
import 'package:shoppingapp/models/product_detail.dart';

class ProductList extends StatelessWidget {
  final List<Product> items;
  final List<Productdetails> detail;
  ProductList({Key key, this.items, this.detail});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductCard(
            item: items[index],
            //productdetails: detail[index],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(
                          item: items[index],
                        )));
          },
        );
      },
    );
  }
}
