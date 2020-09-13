import 'package:changenotifier/model/item_provider.dart';
import 'package:changenotifier/pages/deleteItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context);
    return Container(
      child: ListView.builder(
          itemCount: items.items.length,
          itemBuilder: (context, index) {
            return Card(
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                confirmDismiss: (value) async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => DeleteItem(),
                  );

                  if (result) {
                    final isDeleted = items.deleteItem(items.items[index].id);
                    if (isDeleted) {
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  } else {}
                  return result;
                },
                background: Container(
                  padding: EdgeInsets.only(left: 20),
                  color: Colors.red[200],
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                onDismissed: (direction) {},
                child: ListTile(
                  leading: Icon(Icons.free_breakfast),
                  title: Text(items.items[index].name),
                ),
              ),
            );
          }),
    );
  }

  final snackBar = SnackBar(
    duration: Duration(milliseconds: 2000),
    content: Text(
      "Item was successfull deleted",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.red[400],
  );
}
