import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import './transaction_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.length > 0
        ? Container(
            height: 300,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return TransactionCard(
                  name: transactions[index].name,
                  category: transactions[index].category,
                  amount: transactions[index].amount,
                  date: transactions[index].date,
                );
              },
            ),
          )
        : Center(
            child: Text('No transactions yet. Try add something'),
          );
  }
}
