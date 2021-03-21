import 'package:flutter/material.dart';
import 'dart:math';
import './widgets/transactions/transactions_list.dart';
import './widgets/form/transaction_form.dart';
import './models/transaction.dart';
import './widgets/chart/chart.dart';
import './widgets/chart/empty_chart.dart';
import './widgets/transactions/transaction_summary.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<MyHomePage> {
  static final Map<String, List<String>> generator = <String, List<String>>{
    'jenis': <String>['Soto', 'Bakso', 'Sop', 'Sate'],
    'bahan': <String>['Ayam', 'Kambing', 'Sapi', 'Bebek'],
  };
  static final _random = new Random();
  final List<Transaction> transactions = <Transaction>[
    for (var i = 0; i < 31; i++)
      Transaction(
        id: '0',
        name: generator['jenis'][_random.nextInt(generator['jenis'].length)] +
            ' ' +
            generator['bahan'][_random.nextInt(generator['jenis'].length)],
        category: 'Food',
        amount: new Random().nextInt(100000),
        date: new DateTime(2021, 3, DateTime.now().day - i),
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

  int getMaxMinValue({List<int> transactions, max = false, min = false}) {
    if (max) {
      return transactions.reduce((curr, next) => curr > next ? curr : next);
    } else if (min) {
      return transactions.reduce((curr, next) => curr < next ? curr : next);
    } else {
      return transactions.reduce((curr, next) => curr < next ? curr : next);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> weeklyTransactions = getWeeklyTransactions();

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final AppBar appBar = AppBar(
      title: Text('Smone'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            showForm(context, TransactionForm(addTransaction));
          },
        ),
      ],
    );

    final double appHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    Container Function(double) chart = (double heightPercent) {
      return transactions.length >= 7
          ? Container(
              height: appHeight * heightPercent,
              child: Chart(
                transactions: weeklyTransactions,
                // Jangan dihapus dulu, biarakan saja nanti tinggal uncomment kalau perlu
                // minExpenses:
                //     getMaxMinValue(transaction: transactions, min: true),
                maxExpenses:
                    getMaxMinValue(transactions: weeklyTransactions, max: true),
              ),
            )
          : Container(
              height: appHeight * heightPercent,
              child: EmptyChart(),
            );
    };

    transactions
        .sort((Transaction b, Transaction a) => a.date.compareTo(b.date));

    final Container Function(double) transactionCount = (double heightPercent) {
      return Container(
        height: appHeight * heightPercent,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: TransactionSummary(transactions.length.toString()),
      );
    };

    final Container Function(double) transactionList = (double heightPercent) {
      return Container(
        height: appHeight * heightPercent,
        child: TransactionsList(
          transactions: transactions,
          deleteTransaction: deleteTransaction,
        ),
      );
    };

    return Scaffold(
      appBar: appBar,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: isPortrait
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  chart(0.3),
                  transactionCount(0.1),
                  transactionList(0.6),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4 - 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [chart(0.6)],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width * 0.6 - 40,
                    child: Column(
                      children: [
                        transactionCount(0.2),
                        transactionList(0.8),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
