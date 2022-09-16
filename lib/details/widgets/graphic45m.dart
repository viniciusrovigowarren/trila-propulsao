import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graphic45m extends StatelessWidget {
  const Graphic45m({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.18,
      width: size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 22,
          minY: 0,
          maxY: 11,
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(0.5, 0.5),
                const FlSpot(1, 1),
                const FlSpot(1.5, 0.8),
                const FlSpot(2, 1.8),
                const FlSpot(2.5, 2),
                const FlSpot(3, 2.5),
                const FlSpot(3.5, 3),
                const FlSpot(4, 2.8),
                const FlSpot(4.2, 3),
                const FlSpot(4.5, 3.2),
                const FlSpot(5, 4.2),
                const FlSpot(5.5, 3),
                const FlSpot(6, 3.2),
                const FlSpot(6.5, 4.2),
                const FlSpot(7, 4.6),
                const FlSpot(7.5, 5),
                const FlSpot(8, 5.2),
                const FlSpot(8.5, 5.8),
                const FlSpot(9, 5.5),
                const FlSpot(9.5, 6),
                const FlSpot(10, 6.2),
                const FlSpot(10.5, 7),
                const FlSpot(11, 6.5),
                const FlSpot(11.5, 6.7),
                const FlSpot(12, 8),
                const FlSpot(12.5, 7.3),
                const FlSpot(13, 8.5),
                const FlSpot(13.5, 9),
                const FlSpot(14, 10.6),
                const FlSpot(14.5, 9.1),
                const FlSpot(15, 5),
                const FlSpot(15.5, 5),
                const FlSpot(16, 5.2),
                const FlSpot(16.5, 5.8),
                const FlSpot(17, 5.5),
                const FlSpot(17.5, 6),
                const FlSpot(18, 6.2),
                const FlSpot(18.5, 7),
                const FlSpot(19, 6.5),
                const FlSpot(19.5, 6.7),
                const FlSpot(20, 7.3),
                const FlSpot(20.5, 8),
                const FlSpot(21, 9),
                const FlSpot(21.5, 8.5),
                const FlSpot(22, 9.1),
              ],
              barWidth: 3,
              dotData: FlDotData(show: false),
              color: const Color.fromARGB(255, 224, 43, 87),
            ),
          ],
        ),
      ),
    );
  }
}
