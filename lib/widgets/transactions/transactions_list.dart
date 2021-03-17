import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import './transaction_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionsList({
    @required this.transactions,
    @required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.length > 0
        ? Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${transactions.length.toString()} items',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 360,
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (ctx, index) {
                      return TransactionCard(
                        name: transactions[index].name,
                        category: transactions[index].category,
                        amount: transactions[index].amount,
                        date: transactions[index].date,
                        transactionIndex: index,
                        deleteController: deleteTransaction,
                      );
                    },
                  ),
                )
              ],
            ),
          )
        : Container(
          margin: EdgeInsets.all(20),
            child: Center(
              child: Text('No transactions yet. Try add something'),
            ),
          );
  }
}
