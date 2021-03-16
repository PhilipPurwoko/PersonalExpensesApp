import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 100,
      color: Colors.grey[300],
      child: Center(
        child: Text('Chart'),
      ),
    );
  }
}
