import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String category;
  final int amount;
  final DateTime date;

  TransactionCard({
    @required this.name,
    @required this.category,
    @required this.amount,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blueAccent,
                ),
              ),
              child: Text(
                'Rp.${amount.toString()}',
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
                Text(DateFormat.yMMMd().format(date)),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
