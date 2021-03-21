import 'package:flutter/material.dart';

class TransactionSummary extends StatefulWidget {
  final int max;
  final int min;
  final double mean;

  TransactionSummary({
    @required this.max,
    @required this.min,
    @required this.mean,
  });

  @override
  _TransactionSummaryState createState() => _TransactionSummaryState();
}

class _TransactionSummaryState extends State<TransactionSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Expenses Summary',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Highest',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Rp. ' + widget.max.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lowest',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Rp. ' + widget.min.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Average',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Rp. ' + widget.mean.toInt().toString()),
          ],
        ),
      ],
    );
  }
}
