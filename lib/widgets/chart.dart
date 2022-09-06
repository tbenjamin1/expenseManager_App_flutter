import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String,Object>> get groupedTransactionValues{

    return List.generate(7,(index){


      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
       var totalsum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalsum = totalsum + recentTransactions[i].amount;
        }
      }
      return {'day':DateFormat.E().format(weekDay).substring(0, 1),'amount':90.89};
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),

    );
  }
}