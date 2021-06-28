import 'package:shoppingapp/models/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Orderdetails {
  int id;
  int orderId;
  int productId;
  int quanity;

  Orderdetails({this.id, this.orderId, this.productId, this.quanity});

  factory Orderdetails.fromJson(Map<String, dynamic> json) {
    return Orderdetails(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      quanity: json['quanity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['quanity'] = this.quanity;
    return data;
  }
}

Future<Orderdetails> createOrderdetails(
    int id, int orderId, int productId, int quanity) async {
  final response = await http.post(Uri.parse(ORDERDETAILS),
      //headers: <String, String>{
      //   'Content-Type': 'application/x-www-form-urlencoded',
      // },
      body: //jsonEncode(
          {
        'id': id.toString(),
        'order_id': orderId.toString(),
        'product_id': productId.toString(),
        'quanity': quanity.toString(),
      }
      //),
      );
  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Orderdetails.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create .');
  }
}
