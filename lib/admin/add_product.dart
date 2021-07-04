import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/models/global.dart';
import 'package:shoppingapp/models/product_detail.dart';

class ManageProduct extends StatefulWidget {
  static String routeName = "All New Product";
  final Product items;

  const ManageProduct({Key key, this.items}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ManageState(items);
  }
}

// ignore: missing_return
Future<Product> submitData(String name, String des, int image, int price,
    int cost, int collect, int brand, int model) async {
  var response = await http.post(Uri.parse(CREATEPRODUCT), body: {
    //'id': id,
    'name': name.toString(),
    'description': des.toString(),
    'image_id': image.toString(),
    'price': price.toString(),
    'cost': cost.toString(),
    'collection_id': collect.toString(),
    'brand_id': brand.toString(),
    'model_id': model.toString()
  });

  var data = response.body;
  print(data);

  if (response.statusCode == 201) {
    String responseString = response.body;
    productfromJson(responseString);
  } else
    return null;
}

class ManageState extends State<ManageProduct> {
  //Future<Product> futureProduct;

  final Product item;
  Product product;
  ManageState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Manage",
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
    // final cart = Provider.of<Cart>(context);
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerDes = TextEditingController();
    final TextEditingController controllerImageid = TextEditingController();
    final TextEditingController controllerPrice = TextEditingController();
    final TextEditingController controllerCost = TextEditingController();
    String _selectedValueCollect;
    String _seletedValueBrand;
    String _selectedValueModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
              labelText: "Name Of Product", // Set text upper animation
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
            controller: controllerDes,
            decoration: InputDecoration(
                labelText: "Description of Product",
                border: OutlineInputBorder()),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: TextFormField(
            controller: controllerImageid,
            decoration: InputDecoration(
              labelText: "Image", // Set text upper animation
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
            controller: controllerPrice,
            decoration: InputDecoration(
              labelText: "Price", // Set text upper animation
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
            controller: controllerCost,
            decoration: InputDecoration(
              labelText: "Cost", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: DropdownButtonFormField(
              hint: Text('Select Collection'),
              icon: Icon(Icons.arrow_circle_down),
              value: _selectedValueCollect,
              items: ['Casual', 'Sport'].map((value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValueCollect = value;
                });
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: DropdownButtonFormField(
              hint: Text('Select Brand'),
              icon: Icon(Icons.arrow_circle_down),
              value: _seletedValueBrand,
              items: ['Nike', 'Adidas', 'Gucci'].map((value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _seletedValueBrand = value;
                });
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: DropdownButtonFormField(
              icon: Icon(Icons.arrow_circle_down),
              hint: Text('Select Models'),
              value: _selectedValueModel,
              items: ['Shirts', 'Jeans', 'Sneakers'].map((value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValueModel = value;
                });
              }),
        ),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () async {
                    Product data1 = await submitData(
                        controllerName.text,
                        controllerDes.text,
                        1,
                        int.parse(controllerPrice.text),
                        int.parse(controllerCost.text),
                        2,
                        1,
                        3);
                    setState(() {
                      product = data1;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(
                            seconds:
                                3), //Hiển thị thông báo khi thêm sản phẩm vào giỏ hàng
                        content: Text('Add Product Completed')));
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
                        'Add Product',
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
