import 'package:changenotifier/model/item.dart';
import 'package:changenotifier/model/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewItem extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final nameController = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Form(
        key: formState,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value.length < 4) {
                  return "Please Enter Real Name";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Enter Item",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                if (formState.currentState.validate()) {
                  formState.currentState.save();
                  var id = DateTime.now().toString();
                  itemProvider.addItem(new Item(id, nameController.text));
                  Navigator.of(context).pop();
                }
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
