import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/transaction.dart';

class Chart extends StatefulWidget {
  final List<Transaction> transactions;
  final int minExpenses;
  final int maxExpenses;

  Chart({
    @required this.transactions,
    @required this.minExpenses,
    @required this.maxExpenses,
  });

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    List<FlSpot> getSpots(List<Transaction> transactions) {
      var spots = <FlSpot>[];
      for (int i = 0; i < 7; i++) {
        spots.add(FlSpot(
            i.toDouble(), double.parse(transactions[i].amount.toString())));
      }
      return spots;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black87,
      ),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      height: 150,
      child: Center(
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTextStyles: (value) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'MON';
                    case 1:
                      return 'TUE';
                    case 2:
                      return 'WED';
                    case 3:
                      return 'THU';
                    case 4:
                      return 'FRI';
                    case 5:
                      return 'SAT';
                    case 6:
                      return 'SUN';
                  }
                  return '';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  int getRound(number) {
                    return (value / 1000).round() * 1000;
                  }

                  print(getRound(value));
                  print(widget.maxExpenses);
                  print(widget.minExpenses);
                  print("");

                  if (value == 0) {
                    return widget.minExpenses.toString();
                  } else if (getRound(value) == getRound(widget.maxExpenses)) {
                    return getRound(widget.maxExpenses).toString();
                  } else {
                    return '';
                  }
                },
                reservedSize: 28,
                margin: 12,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color(0xff37434d),
                width: 1,
              ),
            ),
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: widget.maxExpenses.toDouble(),
            lineBarsData: [
              LineChartBarData(
                spots: getSpots(widget.transactions),
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
