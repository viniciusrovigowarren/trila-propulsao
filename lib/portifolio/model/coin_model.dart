import 'package:decimal/decimal.dart';

class CoinModel {
  String ticker;
  String nameCoin;
  Decimal currentPrice;
  double variation;
  Decimal coinBalance;
  String iconCoin;
  List<Decimal> prices;
  late double? percent;

  CoinModel({
    required this.ticker,
    required this.nameCoin,
    required this.currentPrice,
    required this.variation,
    required this.coinBalance,
    required this.iconCoin,
    required this.prices,
    this.percent,
  }) {
    percent = _getPercentageCoin();
  }

  double _getPercentageCoin() {
    return (variation.toDouble() * 100) / currentPrice.toDouble() / 100;
  }
}
