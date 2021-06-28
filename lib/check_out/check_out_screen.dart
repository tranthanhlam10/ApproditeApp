import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/cart/components/cart.dart';
import 'package:shoppingapp/check_out/order.dart';
import 'package:shoppingapp/check_out/orderdetails.dart';
import 'package:shoppingapp/models/product_detail.dart';
//import 'package:http/http.dart' as http;
//import 'package:shoppingapp/models/product_detail.dart';

class CreateAddressScreen extends StatefulWidget {
  static String routeName = "Check Out Screen";
  final Product items;

  const CreateAddressScreen({Key key, this.items}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LunchState(items);
  }
}

class LunchState extends State<CreateAddressScreen> {
  //Future<Product> futureProduct;
  Future<Order> futureOrder;
  Future<Orderdetails> futureOrderdetail;
  final Product item;

  LunchState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Information",
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

  FutureBuilder<Order> buildFutureBuilder() {
    return FutureBuilder<Order>(
      future: futureOrder,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.id.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }

  Widget initScreen() {
    final cart = Provider.of<Cart>(context);
    final TextEditingController controllerAddress = TextEditingController();
    final TextEditingController controllerPhone = TextEditingController();
    final TextEditingController controllerName = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: controllerAddress,
            //  obscureText: true,
            decoration: InputDecoration(
              labelText: "Address", // Set text upper animation
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
            controller: controllerPhone,
            // obscureText: false,
            decoration: InputDecoration(
                labelText: "Phone Numbers", border: OutlineInputBorder()),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: controllerName,
            // obscureText: false,
            decoration: InputDecoration(
              labelText: "Recipient's name", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(text: "Time Order:\n", children: [
                  TextSpan(
                      text: DateTime.now().toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ]),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(text: "Total:\n", children: [
                  TextSpan(
                      text: cart.totalAmount.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ]),
              )
            ],
          ),
        ),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      futureOrder = createOrder(
                          2,
                          DateTime.now().toString(),
                          controllerAddress.text,
                          'pending',
                          cart.totalAmount); // thêm đơn đặt hàng

                      //   futureOrderdetail = createOrderdetails(13, 2, ,
                      //    cart.itemCount); // thêm chi tiết đơn đặt hàng (mã chi tiết đơn đặt hàng, mã đơn hàng, mã sản phẩm , số lượng)
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(
                            seconds:
                                3), //Hiển thị thông báo khi thêm sản phẩm vào giỏ hàng
                        content: Text('Order Completed')));
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
                        'Order',
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
