import 'package:decimal/decimal.dart';

import '../../portifolio/model/coin_view_data.dart';

class TransactionsModel {
  String dateNow;
  CoinViewData cryptoDown;
  Decimal transactionsUp;
  Decimal transactionsDown;
  CoinViewData cryptoUp;
  String dolarConverted;

  TransactionsModel({
    required this.cryptoUp,
    required this.cryptoDown,
    required this.transactionsUp,
    required this.transactionsDown,
    required this.dateNow,
    required this.dolarConverted,
  });
}
