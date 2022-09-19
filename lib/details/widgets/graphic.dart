import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/coin_model.dart';
import '../provider/provider.dart';

Decimal pD(String source) => Decimal.parse(source);
double pS(Decimal source) => double.parse(source.toString());

class Graphic extends HookConsumerWidget {
  final CoinModel model;

  const Graphic({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeFrame = ref.watch(timeFrameProvider.state).state;
    final size = MediaQuery.of(context).size;

    List<FlSpot> generateList() {
      List<FlSpot> spotsList = [];
      for (var i = 0; i <= timeFrame; i++) {
        spotsList.add(FlSpot(i.toDouble(), pS(model.prices[i])));
      }
      return spotsList;
    }

    double getMinY() {
      double minY = 100000;
      for (var i = 0; i < timeFrame; i++) {
        if (model.prices[i].toDouble() < minY) {
          minY = model.prices[i].toDouble();
        }
      }
      return minY;
    }

    double getMaxY() {
      double maxX = 0;
      for (var i = 0; i < timeFrame; i++) {
        if (model.prices[i].toDouble() > maxX) {
          maxX = model.prices[i].toDouble();
        }
      }
      return maxX;
    }

    return SizedBox(
      height: size.height * 0.18,
      width: size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: timeFrame.toDouble(),
          minY: getMinY(),
          maxY: getMaxY(),
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: generateList(),
              barWidth: 3,
              dotData: FlDotData(show: false),
              color: const Color.fromARGB(255, 224, 43, 87),
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 450),
        swapAnimationCurve: Curves.decelerate,
      ),
    );
  }
}
