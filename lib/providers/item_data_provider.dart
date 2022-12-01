import 'package:flutter/material.dart';

class ItemDataProvider extends ChangeNotifier {
  List<String> cartList = [];

  // List of all items
  List<String> allItems = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
  ];

  // Getter which return the list of allItems
  List<String> get getAllItemList => allItems;

// Getter which return the list of cartList
  List<String> get getAllCartItemList => cartList;

  /// to add item in cart
  addItemToCart(var item) {
    cartList.add(item);

    /// to listen if there is any change in state
    notifyListeners();
  }

  /// to remove item from cart
  removeItemFromCart(var item) {
    cartList.remove(item);
    notifyListeners();
  }

  /// to clear cart list
  clearCartList() {
    cartList.clear();
    notifyListeners();
  }
}
