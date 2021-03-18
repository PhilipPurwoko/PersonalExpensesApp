import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String category;
  final int amount;
  final DateTime date;
  final int transactionIndex;
  final Function deleteController;

  TransactionCard({
    @required this.name,
    @required this.category,
    @required this.amount,
    @required this.date,
    @required this.transactionIndex,
    @required this.deleteController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Text(
                      NumberFormat.compactCurrency(
                              locale: 'idn', decimalDigits: 0, symbol: 'Rp.')
                          .format(amount),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(DateFormat.EEEE().format(date)),
                      Text(DateFormat.yMMMd().format(date)),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {
                deleteController(transactionIndex);
              },
            )
          ],
        ),
      ),
    );
  }
}
