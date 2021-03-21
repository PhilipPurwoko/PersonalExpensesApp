import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime dateTransaction = DateTime.now();

  void newTransaction() {
    widget.addTransaction(
      id: dateTransaction.toString(),
      name: nameController.text,
      category: categoryController.text,
      amount: int.parse(amountController.text),
      date: dateTransaction,
    );
    Navigator.of(context).pop();
  }

  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now(),
    ).then((DateTime date) {
      if (date == null) {
        return;
      }
      setState(() {
        dateTransaction = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Wrap(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dateTransaction != null
                    ? Text('Date Occured : ' + DateFormat.yMMMd().format(dateTransaction))
                    : Text('No Date Choosen!'),
                TextButton(
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: pickDate,
                ),
              ],
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product or Service'),
              textInputAction: TextInputAction.next,
              onEditingComplete: () => node.nextFocus(),
              onSubmitted: (_) => newTransaction,
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Transaction Category'),
              textInputAction: TextInputAction.next,
              onEditingComplete: () => node.nextFocus(),
              onSubmitted: (_) => newTransaction,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount (Rp)'),
              textInputAction: TextInputAction.done,
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
