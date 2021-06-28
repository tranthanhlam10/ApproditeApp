import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shoppingapp/login/login_model.dart';

class APISERVICE {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "https://aphrodite-ecom.herokuapp.com/users/login";

    final response =
        await http.post(Uri.parse(url), body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to Load');
    }
  }
}
