import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function addTransaction;

  TransactionForm(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    String name;
    String category;
    String amount;

    return Column(
      children: <Widget>[
        TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(labelText: 'Product Name'),
          onChanged: (value){
            name = value;
          },
        ),
        TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(labelText: 'Product Category'),
          onChanged: (value){
            category = value;
          },
        ),
        TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(labelText: 'Amount (Rp)'),
          onChanged: (value){
            amount = value;
          },
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              addTransaction(DateTime.now().toString(), name, category, int.parse(amount));
            },
            child: Text('Add Transaction'),
          ),
        ),
      ],
    );
  }
}
