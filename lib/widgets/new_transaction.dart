import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountControllet = TextEditingController();

  final Function addNewTx;
  NewTransaction(this.addNewTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountControllet.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addNewTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountControllet,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
                onPressed: submitData,
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
