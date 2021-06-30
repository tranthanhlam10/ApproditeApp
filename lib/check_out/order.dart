import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shoppingapp/models/global.dart';

Order dataModelfromJson(String str) => Order.fromJson(json.decode(str));

String dataModeltoJson(Order data) => json.encode(data.toJson());

class Order {
  int id;
  int userId;
  String time;
  String address;
  String status;
  int totalPrice;

  Order(
      {this.id,
      this.userId,
      this.time,
      this.address,
      this.status,
      this.totalPrice});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      time: json['time'],
      address: json['address'],
      status: json['status'],
      totalPrice: json['total_price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['time'] = this.time;
    data['address'] = this.address;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

Future<List<Order>> fetchOrder(
  http.Client client,
) async {
  final response = await client.get(Uri.parse(ORDERS)); // link ở postman
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "oke") {
      final productp = mapResponse["data"].cast<Map<String, dynamic>>();
      final listofproduct = await productp.map<Order>((json) {
        return Order.fromJson(json);
      }).toList();
      return listofproduct;
    }
  } else {
    throw Exception('Fail to Load');
  }
}

Future<Order> createOrder(
    int userId, String time, String address, String status, int total) async {
  final response = await http.post(
    Uri.parse(CREATEORDER),
    //headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },
    body: {
      //'id': id.toString(),
      'time': time,
      'address': address,
      'user_id': userId.toString(),
      'total_price': total.toString(),
      'status': status,
    },
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Order.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create .');
  }
}
