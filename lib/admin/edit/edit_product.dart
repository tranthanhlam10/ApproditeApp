import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/models/product_detail.dart';

class EditProduct extends StatefulWidget {
  static String routeName = "Edit Product";
  final Product item;

  const EditProduct({Key key, this.item}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EditState(item);
  }
}

class EditState extends State<EditProduct> {
  Future<Product> editData(String name, String des, int image, int price,
      int cost, int collect, int brand, int model) async {
    var response = await http.put(
        Uri.parse(
            'https://aphrodite-ecom.herokuapp.com/products/${this.item.id}'),
        body: {
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

    if (response.statusCode == 200) {
      String responseString = response.body;
      productfromJson(responseString);
    } else
      return null;
  }

  final Product item;
  Product product;
  EditState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Edit Product ",
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
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerDes = TextEditingController();
    final TextEditingController controllerImageid = TextEditingController();
    final TextEditingController controllerPrice = TextEditingController();
    final TextEditingController controllerCost = TextEditingController();
    String selectedValueCollect;
    String seletedValueBrand;
    String selectedValueModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
              labelText: "${this.item.name}", // Set text upper animation
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
                labelText: "${this.item.description}",
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
              labelText:
                  "${this.item.imageId.toString()}", // Set text upper animation
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
              labelText:
                  "${this.item.price.toString()}", // Set text upper animation
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
              labelText:
                  "${this.item.cost.toString()}", // Set text upper animation
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
              hint: Text('${this.item.collection.name}'),
              icon: Icon(Icons.arrow_circle_down),
              value: selectedValueCollect,
              items: ['Casual', 'Sport'].map((value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValueCollect = value;
                });
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: DropdownButtonFormField(
              hint: Text('${this.item.brand.name}'),
              icon: Icon(Icons.arrow_circle_down),
              value: seletedValueBrand,
              items: ['Nike', 'Adidas', 'Gucci'].map((value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  seletedValueBrand = value;
                });
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: DropdownButtonFormField(
              icon: Icon(Icons.arrow_circle_down),
              hint: Text('${this.item.model.name}'),
              value: selectedValueModel,
              items: ['Shirts', 'Jeans', 'Sneakers'].map((value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValueModel = value;
                });
              }),
        ),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () async {
                    Product data = await editData(
                        controllerName.text,
                        controllerDes.text,
                        1,
                        int.parse(controllerPrice.text),
                        int.parse(controllerCost.text),
                        null,
                        null,
                        null);
                    setState(() {
                      product = data;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Edit Product Completed')));
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
                        'Edit Product',
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
