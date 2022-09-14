class CoinModel {
  String nameCoin;
  String ticker;
  String iconCoin;
  double variation;
  double currentPrice;
  late double percent;

  CoinModel({
    required this.nameCoin,
    required this.ticker,
    required this.iconCoin,
    required this.variation,
    required this.currentPrice,
  }) {
    percent = getPercentageCoin();
  }

  double getPercentageCoin() {
    return (variation.toDouble() * 100) / currentPrice.toDouble() / 100;
  }
}
