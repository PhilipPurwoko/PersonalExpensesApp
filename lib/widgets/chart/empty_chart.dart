import 'package:flutter/material.dart';

class EmptyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black87,
      ),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      height: 150,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Center(
          child: Text(
            'Need minimum 1 full week data in order to display a chart',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
