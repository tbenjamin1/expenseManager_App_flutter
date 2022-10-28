import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;
  TransactionList(this.transaction,this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return  transaction.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
            return   Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('No transaction added yet !',
                    style: Theme.of(context).textTheme.headline6),

                    Container(
                      height: constraints.maxHeight*0.6,
                      child: Image.asset('assets/image/pay.jpeg',fit: BoxFit.cover,)),
              ],
            );
          }))
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10
                  ),
                  child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                   decoration: BoxDecoration(
                    color:Colors.blueGrey,
                    shape: BoxShape.circle,
                   ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(child: Text('\$${transaction[index].amount.toStringAsFixed(2)}',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  title: Text(transaction[index].title,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                  subtitle: Text(DateFormat.yMMMd().format(transaction[index].date),),
                  trailing:IconButton(onPressed: ()=>deleteTransaction(transaction[index].id), icon:Icon(Icons.delete,color: Colors.blueGrey,)),
                  ),
                ); 
                
              },
              itemCount: transaction.length,
            );
    
  }
}
