import 'dart:collection';

import 'package:changenotifier/model/item.dart';
import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [
    Item("1", "Orange"),
    Item("2", "Apple"),
    Item("3", "Banana"),
  ];

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  bool deleteItem(String id) {
    if (id.isNotEmpty) {
      _items.removeWhere((i) => i.id == id);
      notifyListeners();
      return true;
    }
    return false;
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
