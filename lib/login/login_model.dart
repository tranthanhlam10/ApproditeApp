class LoginResponseModel {
  final String result;
  final String error;

  LoginResponseModel({this.result, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        result: json["result"] != null ? json["result"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
