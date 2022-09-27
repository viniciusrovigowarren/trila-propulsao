import 'package:decimal/decimal.dart';

import 'coin_view_data.dart';

class WalletViewData {
  Decimal userBalance;
  late double percent;
  CoinViewData coin;

  WalletViewData({
    required this.userBalance,
    required this.coin,
  }) {
    percent = getPercentCoin();
  }

  double getPercentCoin() {
    return (userBalance.toDouble() * 100) /
        coin.marketData!.current_price.usd /
        100;
  }
}
