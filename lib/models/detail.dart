import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'package:shoppingapp/models/global.dart';
import 'package:http/http.dart' as http;

class Detail {
  int id;
  int productId;
  int price;
  int cost;
  String color;
  String gender;
  int sizeId;
  int imageId;
  int quanity;
  Size size;

  Detail(
      {this.id,
      this.productId,
      this.price,
      this.cost,
      this.color,
      this.gender,
      this.sizeId,
      this.imageId,
      this.quanity,
      this.size});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    cost = json['cost'];
    color = json['color'];
    gender = json['gender'];
    sizeId = json['size_id'];
    imageId = json['image_id'];
    quanity = json['quanity'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['cost'] = this.cost;
    data['color'] = this.color;
    data['gender'] = this.gender;
    data['size_id'] = this.sizeId;
    data['image_id'] = this.imageId;
    data['quanity'] = this.quanity;
    if (this.size != null) {
      data['size'] = this.size.toJson();
    }
    return data;
  }
}

class Size {
  int id;
  String name;

  Size({this.id, this.name});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

// ignore: missing_return
Future<List<Detail>> fetchDetail(http.Client client) async {
  final response =
      await client.get(Uri.parse(SERVER_NAME_DETAIl)); // link ở postman
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "oke") {
      final productdetail = mapResponse["data"].cast<Map<String, dynamic>>();
      final listofproductdetail = await productdetail.map<Detail>((json) {
        return Detail.fromJson(json);
      }).toList();
      return listofproductdetail;
    }
  } else {
    throw Exception('Fail to Load');
  }
}
