import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'package:shoppingapp/models/global.dart';
import 'package:http/http.dart' as http;

Product productfromJson(String str) => Product.fromJson(json.decode(str));

String producttoJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String name;
  String description;
  int price;
  int cost;
  Brand brand;
  Brand model;
  Brand collection;
  int imageId;
  //List<Productdetails> productdetails;
  Detail detail;
  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.cost,
      this.brand,
      this.model,
      this.collection,
      this.imageId,
      //this.productdetails,
      this.detail,
      Product item});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    cost = json['cost'];
    imageId = json['image_id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    model = json['model'] != null ? new Brand.fromJson(json['model']) : null;
    collection = json['collection'] != null
        ? new Brand.fromJson(json['collection'])
        : null;
    /* if (json['productdetails'] != null) {
      // ignore: deprecated_member_use
      productdetails = new List<Productdetails>();
      json['productdetails'].forEach((v) {
        productdetails.add(new Productdetails.fromJson(v));
      });
    }*/
    detail = json['detail'] != null ? new Detail.fromJson(json['model']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['cost'] = this.cost;
    data['image_id'] = this.imageId;
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    if (this.model != null) {
      data['model'] = this.model.toJson();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.toJson();
    }
    if (this.detail != null) {
      data['productdetails'] = this.detail.toJson();
    }
    return data;
  }
}

class Brand {
  int id;
  String name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
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

class Productdetails {
  int id;
  int productId;
  int price;
  int cost;
  String color;
  String gender;
  int sizeId;
  int imageId;
  int quanity;

  Productdetails(
      {this.id,
      this.productId,
      this.price,
      this.cost,
      this.color,
      this.gender,
      this.sizeId,
      this.imageId,
      this.quanity});

  Productdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    cost = json['cost'];
    color = json['color'];
    gender = json['gender'];
    sizeId = json['size_id'];
    imageId = json['image_id'];
    quanity = json['quanity'];
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
    return data;
  }
}

// ignore: missing_return
Future<List<Product>> fetchProduct(
  http.Client client,
) async {
  final response =
      await client.get(Uri.parse(SERVER_NAME_PRODUCT_DETAIL)); // link ở postman
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "oke") {
      final productp = mapResponse["data"].cast<Map<String, dynamic>>();
      final listofproduct = await productp.map<Product>((json) {
        return Product.fromJson(json);
      }).toList();
      return listofproduct;
    }
  } else {
    throw Exception('Fail to Load');
  }
}

// ignore: missing_return
Future<List<Productdetails>> fetchProductdetails(http.Client client) async {
  final response =
      await client.get(Uri.parse(SERVER_NAME_PRODUCT_DETAIL)); // link ở postman
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "oke") {
      final productdetail = mapResponse["data"].cast<Map<String, dynamic>>();
      final listofproductdetail =
          await productdetail.map<Productdetails>((json) {
        return Productdetails.fromJson(json);
      }).toList();
      return listofproductdetail;
    }
  } else {
    throw Exception('Fail to Load');
  }
}

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
