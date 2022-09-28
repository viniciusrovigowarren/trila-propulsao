import 'package:flutter/material.dart';

import '../model/coin_view_data.dart';

class AllCoinsController extends ChangeNotifier {
  late List<CoinViewData> coins;
  late CoinViewData coinToConvert = coins[29];

  void setCoinToConvert(CoinViewData coin) {
    coinToConvert = coin;

    notifyListeners();
  }
}
