import 'package:flutter/material.dart';
import './transaction_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Map<String, Object>> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return TransactionCard(
          name: transaction['name'],
          category: transaction['category'],
          amount: transaction['amount'],
        );
      }).toList(),
    );
  }
}
