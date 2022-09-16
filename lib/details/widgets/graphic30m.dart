import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graphic30m extends StatelessWidget {
  const Graphic30m({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.18,
      width: size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 15,
          minY: 0,
          maxY: 9.5,
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
                const FlSpot(12, 7.3),
                const FlSpot(12.5, 8),
                const FlSpot(13, 9.1),
                const FlSpot(13.5, 9),
                const FlSpot(14, 9.5),
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
