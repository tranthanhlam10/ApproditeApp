/*import 'package:flutter/material.dart';
import 'package:shoppingapp/home/home_screen.dart';
import 'package:shoppingapp/login/login.dart';
import 'package:http/http.dart' as http;
//import 'package:shoppingapp/login/login_model.dart';
//import 'package:shoppingapp/models/user.dart';

class LoginPage extends StatelessWidget {
  static String routeName = 'login-page';
  final Color backgroundColor1 = Colors.orange;
  final Color backgroundColor2 = Colors.white;
  final Color highlightColor = Color(0xfff65aa3);
  final Color foregroundColor = Colors.blue;
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final User login;
  Future<User> futureLogin;
  LoginPage({Key key, this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: FutureBuilder<User>(
      future: futureLogin,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.email);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    )
     body: SingleChildScrollView(
        child: initScreen(),);
  }

  @override
  Widget Bui{
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0),
          // 10% of the width, so there are ten blinds.
          colors: [this.backgroundColor1, this.backgroundColor2],
          // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
            child: Center(
              child: new Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    child: new Hero(
                      tag: 'hero',
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 48.0,
                        //   child: Image.asset('assets/Logo2.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: this.foregroundColor,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.only(top: 20.0, bottom: 10.0, right: 00.0),
                  child: Icon(
                    Icons.alternate_email,
                    color: this.foregroundColor,
                  ),
                ),
                new Expanded(
                  child: TextFormField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    // onSaved: (input) =>
                    //   requestModel.email = input, // nhập email
                    style: new TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email...',
                      hintStyle: TextStyle(color: this.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: this.foregroundColor,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                  child: Icon(
                    Icons.lock_open,
                    color: this.foregroundColor,
                  ),
                ),
                new Expanded(
                  child: TextFormField(
                    controller: controllerPassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    // onSaved: (input) => requestModel.password = input,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password...', // nhập password
                      hintStyle: TextStyle(color: this.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  // ignore: deprecated_member_use
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.lightBlue,
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: this.foregroundColor),
                    ),
                    onPressed: () {
                      if (this.login.email == controllerEmail.text &&
                          this.login.password == controllerPassword.text) {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(
                                seconds:
                                    5), //Hiển thị thông báo khi dăng nhập thành công
                            content: Text('Login Completed'))); // đăng nhập
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  // ignore: deprecated_member_use
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: this.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
                left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  // ignore: deprecated_member_use
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(color: this.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  static String routeName = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  Future<User> futureLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: futureLogin,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.email);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}*/
