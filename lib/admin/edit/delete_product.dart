import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/models/product_detail.dart';

class DeleteProduct extends StatefulWidget {
  static String routeName = "Delete Product";
  final Product item;

  const DeleteProduct({Key key, this.item}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DeleteState(item);
  }
}

class DeleteState extends State<DeleteProduct> {
  Future<Product> deleteData(
    int id, //String name
  ) async {
    var response = await http.delete(
        Uri.parse(
            'https://aphrodite-ecom.herokuapp.com/products/${this.item.id}'),
        body: {
          'id': id.toString(),
          // 'name': name.toString(),
        });

    var data = response.body;
    print(data);

    if (response.statusCode == 200) {
      String responseString = response.body;
      productfromJson(responseString);
    } else
      return null;
  }

  final Product item;
  Product product;
  DeleteState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Delete Product ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
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
    final TextEditingController controllerId = TextEditingController();
    final TextEditingController controllerName = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: TextFormField(
            controller: controllerId,
            decoration: InputDecoration(
              labelText: "${this.item.id}", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
                labelText: "${this.item.name}", border: OutlineInputBorder()),
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
                    Product data = await deleteData(
                      this.item.id,
                      //controllerName.text,
                    );
                    setState(() {
                      product = data;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Delete Product Completed')));
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
                        'Delete Product',
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
