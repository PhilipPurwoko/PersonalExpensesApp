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
        ? ListView.builder(
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
          )
        : Center(
            child: Text('No transactions yet. Try add something'),
          );
  }
}
