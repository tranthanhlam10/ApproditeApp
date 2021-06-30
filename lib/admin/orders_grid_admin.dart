import 'package:flutter/material.dart';
import 'package:shoppingapp/admin/orders_admin_update.dart';
import 'package:shoppingapp/check_out/order.dart';
import 'package:http/http.dart' as http;

class OrdersList extends StatelessWidget {
  final List<Order> items;
  final Order order;

  Future<Order> updateData(String state, String url) async {
    var response =
        await http.put(Uri.parse(url), body: {'state': state.toString()});

    var data = response.body;
    print(data);

    if (response.statusCode == 200) {
      String responseString = response.body;
      dataModelfromJson(responseString);
    } else
      return null;
  }

  OrdersList({Key key, @required this.items, this.order});
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: OrderCard(
            order: items[index],
            //productdetails: detail[index],
          ),
          onTap: () async {
            String url =
                'https://aphrodite-ecom.herokuapp.com/orders/${this.items[index].id.toString()} ';
            final OrderState state = await _asyncSimpleDialog(context);
            print("Selected state is $state");
            Order data = await updateData(state.toString(), url);
          },
        );
      },
    );
  }
}

enum OrderState { Pending, Shipping, Cancelled }
Future<OrderState> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<OrderState>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select State '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, OrderState.Pending);
              },
              child: const Text('Change ordering state to Pending'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, OrderState.Shipping);
              },
              child: const Text('Change ordering state to Shipping'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, OrderState.Cancelled);
              },
              child: const Text('Change ordering state to Cancelled'),
            ),
          ],
        );
      });
}
