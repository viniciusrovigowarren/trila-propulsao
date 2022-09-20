import 'package:decimal/decimal.dart';

class CoinModel {
  String ticker;
  String nameCoin;
  double currentPrice; //TODO: DECIMAL
  double variation;
  double? coinBalance; //TODO: DECIMAL
  String iconCoin;
  List<Decimal>? prices;
  late double? percent = 0;

  CoinModel({
    required this.ticker,
    required this.nameCoin,
    required this.currentPrice,
    required this.variation,
    this.coinBalance,
    required this.iconCoin,
    this.prices,
  }) {
    percent = _getPercentageCoin();
  }

//TODO: ARRUMAR PORCENTAGEM
  double _getPercentageCoin() {
    return (variation * 100) / currentPrice.toDouble() / 100;
  }

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      ticker: map['symbol'] ?? '',
      nameCoin: map['name'] ?? '',
      currentPrice: map['current_price'] ?? '',
      variation: map['price_change_24h'] ?? '',
      //coinBalance: map['price_change_24h'] ?? '',
      iconCoin: map['image'] ?? '',
      //prices: map['code'] ?? '',
    );
  }
}
