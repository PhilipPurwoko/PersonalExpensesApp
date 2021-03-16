import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransaction;

  TransactionForm(this.addTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final nameController = TextEditingController();

  final categoryController = TextEditingController();

  final amountController = TextEditingController();

  void newTransaction() {
    widget.addTransaction(
      DateTime.now().toString(),
      nameController.text,
      categoryController.text,
      int.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
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
        ),
      ),
    );
  }
}
