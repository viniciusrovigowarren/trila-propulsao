import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../portifolio/model/coin_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/util.dart';

class DetailsController extends ChangeNotifier {
  late CoinViewData? coin;
  late String? firtDate;
  late String? lastDate;
  late List<CoinValueResponse> pricesHistoricList;
  late int timeFrame = 5;

  void setTimeFrame(time) {
    timeFrame = time;
    notifyListeners();
  }

  int _getInterval() {
    return timeFrame * 24;
  }

  double getLarger() {
    return pricesHistoricList.length.toDouble();
  }

  double getMinX() {
    return (getLarger() - _getInterval().toDouble());
  }

  DetailsController() {
    firtDate = Util.getAllDays();
    lastDate = Util.getDTToTimestamp();
  }

  void setCoinHistoryPriceValues(List<CoinValueResponse> prices) {
    pricesHistoricList = prices;
  }

  List<CoinValueResponse> getIntervalPrices() {
    if (pricesHistoricList.length <= 90) {
      return pricesHistoricList.sublist(getLarger().toInt() - timeFrame);
    } else {
      return pricesHistoricList.sublist(
          (getLarger().toInt()) - _getInterval(), getLarger().toInt());
    }
  }

  List<FlSpot> getCoinHistoryChartSpots() {
    List<FlSpot> chartSpots = [];
    List<CoinValueResponse> rangeValues = getIntervalPrices();
    int j = pricesHistoricList.length;

    for (var i = rangeValues.length - 1;
        i != rangeValues.length - (_getInterval());
        i--) {
      chartSpots.add(FlSpot(j.toDouble(), rangeValues[i].values[1]));
      j--;
    }

    return chartSpots;
  }
}
