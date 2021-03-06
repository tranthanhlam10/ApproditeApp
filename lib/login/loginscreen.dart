import 'package:flutter/material.dart';
import 'package:shoppingapp/admin/order/orders_admin.dart';

import 'package:shoppingapp/home/home_screen.dart';
import 'package:shoppingapp/login/login.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static String routeName = "Login";
  final User user;

  const LoginPage({Key key, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LoginState(user);
  }
}

// ignore: missing_return
Future<User> submitData(String email, String password) async {
  var response = await http.post(
      Uri.parse('https://aphrodite-ecom.herokuapp.com/users/login'),
      body: {
        'email': email,
        'password': password,
      });

  var data = response.body;
  print(data);

  if (response.statusCode == 201) {
    String responseString = response.body;
    dataModelfromJson(responseString);
  } else
    return null;
}

class LoginState extends State<LoginPage> {
  Future<User> futureUser;
  User user;
  final User login;

  LoginState(this.login);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: initScreen(),
      ),
    );
  }

  Widget initScreen() {
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: controllerEmail,
            // obscureText: true,
            decoration: InputDecoration(
              labelText: "Enter your email", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: controllerPassword,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Password", border: OutlineInputBorder()),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () async {
                    String email = controllerEmail.text;
                    String password = controllerPassword.text;

                    User data = await submitData(email, password);
                    Navigator.pushNamed(context, HomeScreen.routeName);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Login Successed')));
                    setState(() {
                      user = data;

                      if (password == 'shop') {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 3),
                            content: Text('Login Successed')));
                      } else {
                        Navigator.pushNamed(context, AdminOdersScren.routeName);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 3),
                            content: Text('Login Successed')));
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              new Color(0xFFFF4848),
                              new Color(0xFFDBDEE4)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 300.0, minHeight: 40.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ))),
      ],
    );
  }
}
