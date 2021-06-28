//import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final int price;

  CartItem({
    this.id,
    @required this.name,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> item = {};
  Map<String, CartItem> get items {
    return {...item};
  }

  int get itemCount {
    return item.length;
  }

  void addItem(String pdtid, String name, int price) {
    if (item.containsKey(pdtid)) {
      item.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      item.putIfAbsent(
          pdtid,
          () => CartItem(
                name: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    item.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!item.containsKey(id)) {
      return;
    }
    if (item[id].quantity > 1) {
      item.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  int get totalAmount {
    int total = 0;
    item.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    item = {};
    notifyListeners();
  }
}
