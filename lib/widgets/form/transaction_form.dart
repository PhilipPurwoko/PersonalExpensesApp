import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Product Name'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Product Category'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount (Rp)'),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Add Transaction'),
          ),
        ),
      ],
    );
  }
}
