import 'package:flutter/material.dart';
import 'package:shoppingapp/Product/product_item.dart';
import 'package:shoppingapp/admin/edit/delete_product.dart';
import 'package:shoppingapp/admin/edit/edit_product.dart';
import 'package:shoppingapp/models/product_detail.dart';

class AdminProductList extends StatelessWidget {
  final List<Product> items;

  AdminProductList({Key key, this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductCard(
            item: items[index],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProduct(
                          item: items[index],
                        )));
          },
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DeleteProduct(
                          item: items[index],
                        )));
          },
        );
      },
    );
  }
}
