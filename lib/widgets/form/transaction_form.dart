import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function addTransaction;
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final amountController = TextEditingController();

  TransactionForm(this.addTransaction);

  void newTransaction() {
    addTransaction(
      DateTime.now().toString(),
      nameController.text,
      categoryController.text,
      int.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Product Name'),
          onSubmitted: (_) => newTransaction,
        ),
        TextField(
          controller: categoryController,
          decoration: InputDecoration(labelText: 'Product Category'),
          onSubmitted: (_) => newTransaction,
        ),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Amount (Rp)'),
          onSubmitted: (_) => newTransaction,
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: newTransaction,
            child: Text('Add Transaction'),
          ),
        ),
      ],
    );
  }
}
