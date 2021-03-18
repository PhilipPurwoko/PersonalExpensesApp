import 'package:flutter/material.dart';
import 'dart:math';
import './widgets/transactions/transactions_list.dart';
import './widgets/form/transaction_form.dart';
import './models/transaction.dart';
import './widgets/chart/chart.dart';
import './widgets/chart/empty_chart.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<MyHomePage> {
  final transactions = <Transaction>[
    for (var i = 0; i < 7; i++)
      Transaction(
        id: '0',
        name: 'Soto Ayam',
        category: 'Food',
        amount: new Random().nextInt(100000),
        date: new DateTime(2021, 3, 17 - i),
      )
  ];

  List<int> getWeeklyTransactions() {
    Map<int, int> weekData = {for (int i = 1; i < 8; i++) i: 0};

    for (Transaction transaction in transactions) {
      weekData[transaction.date.weekday] += transaction.amount;
    }
    // Get Map values only
    return [for (MapEntry<int, int> entry in weekData.entries) entry.value];
  }

  void addTransaction({
    @required String id,
    @required String name,
    @required String category,
    @required int amount,
    @required DateTime date,
  }) {
    final transaction = new Transaction(
      id: id,
      name: name,
      category: category,
      amount: amount,
      date: date,
    );

    setState(() {
      transactions.add(transaction);
    });
  }

  void deleteTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  void showForm(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return widget;
      },
    );
  }

  int getMaxMinValue(
      {List<Transaction> transaction, max = false, min = false}) {
    return transactions
        .map((transaction) => transaction.amount)
        .toList()
        .reduce((curr, next) {
      if (max) {
        return curr > next ? curr : next;
      } else if (min) {
        return curr < next ? curr : next;
      } else {
        return curr > next ? curr : next;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    transactions
        .sort((Transaction a, Transaction b) => a.date.compareTo(b.date));
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showForm(context, TransactionForm(addTransaction));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transactions.length >= 7
                    ? Chart(
                        transactions: getWeeklyTransactions(),
                        minExpenses: getMaxMinValue(
                            transaction: transactions, min: true),
                        maxExpenses: getMaxMinValue(
                            transaction: transactions, max: true),
                      )
                    : EmptyChart(),
                TransactionsList(
                  transactions: transactions,
                  deleteTransaction: deleteTransaction,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
