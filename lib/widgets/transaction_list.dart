import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('No transaction added yet !',
                    style: Theme.of(context).textTheme.headline6),
                    Image.asset('assets/image/pay.jpeg',fit: BoxFit.cover,),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                 decoration: BoxDecoration(
                  color:Colors.blueGrey,
                  shape: BoxShape.circle,

                 ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(child: Text('\$${transaction[index].amount.toStringAsFixed(2)}')),
                  ),
                ),
                title: Text(transaction[index].title,style: Theme.of(context).textTheme.headline6,),
                subtitle: Text(DateFormat.yMMMd().format(transaction[index].date),),
                ); 
                
              },
              itemCount: transaction.length,
            ),
    );
  }
}
