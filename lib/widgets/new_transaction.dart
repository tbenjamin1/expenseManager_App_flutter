import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountControllet = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountControllet.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                Text('No Date Chosen !'),
                FlatButton(onPressed: null, child:Text('choose date ',style:TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold)   ,))
                ],
              ),
            ),
            RaisedButton(
                onPressed: submitData,
                color:Colors.purple,
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
