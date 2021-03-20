import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class Chart extends StatefulWidget {
  final List<int> transactions;
  // final int minExpenses;
  final int maxExpenses;

  Chart({
    @required this.transactions,
    // @required this.minExpenses,
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
    List<FlSpot> getSpots(List<int> transactions) {
      var spots = <FlSpot>[];
      for (int i = 0; i < 7; i++) {
        spots.add(FlSpot(
            i.toDouble(), double.parse(transactions[i].toString())));
      }
      return spots;
    }

    // Belum butuh tapi jangan dihapus
    // int getRound(int number) {
    //   return int.parse(number.toString()[0]) *
    //       pow(10, number.toString().length - 1);
    // }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black87,
      ),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: false,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: SideTitles(
                showTitles: false
              ),
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
                barWidth: 3,
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
