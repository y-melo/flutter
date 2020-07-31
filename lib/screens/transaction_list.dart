import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.deepPurpleAccent,
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 0.2),
                    ),
                    child: Text(
                      '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                      Container(
                          child: Text(
                        DateFormat.yMMMd().format(transactions[index].dateTime),
                        style: TextStyle(color: Colors.blueGrey),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
