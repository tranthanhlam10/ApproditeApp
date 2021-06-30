import 'dart:async';
import 'dart:convert';
import 'package:shoppingapp/models/global.dart';
import 'package:http/http.dart' as http;

User dataModelfromJson(String str) => User.fromJson(json.decode(str));

String dataModeltoJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String email;
  String phone;
  int roleId;
  String password;
  Null createdAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.roleId,
      this.password,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    roleId = json['role_id'];
    password = json['password'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role_id'] = this.roleId;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    return data;
  }
}

// lấy data từ sever

// ignore: missing_return
Future<List<User>> fetchLogin(http.Client client) async {
  final response =
      await client.get(Uri.parse(SERVER_NAME_USER)); // link ở postman
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "ok") {
      final user = mapResponse["data"].cast<Map<String, dynamic>>();
      final listofUser = await user.map<User>((json) {
        return User.fromJson(json);
      }).toList();
      return listofUser;
    }
  } else {
    throw Exception('Fail to Load ');
  }
}

// gửi data lên sever

Future<User> createUser(String email, String password) async {
  final response = await http.post(
    Uri.parse(SERVER_NAME_USER),
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create .');
  }
}

/*Future<User> fetchUser() async {
  final response = await http
      .get(Uri.parse('https://aphrodite-ecom.herokuapp.com/users/login'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/
