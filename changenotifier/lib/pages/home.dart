import 'package:changenotifier/pages/item_list.dart';
import 'package:changenotifier/pages/newItem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        title: Text(
          "My Task ",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Container(
        child: ItemList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => NewItem());
        },
        child: Icon(Icons.fastfood),
      ),
    );
  }
}
