import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/coin_model.dart';

final timeFrameProvider = StateProvider<int>(
  (ref) => 5,
);

var graphAxisProvider = StateProvider((ref) => 1);

final detailsAssetProvider =
    StateNotifierProvider<DetailsAssetNotifier, CoinModel>(
  (ref) => DetailsAssetNotifier(),
);

class DetailsAssetNotifier extends StateNotifier<CoinModel> {
  DetailsAssetNotifier()
      : super(
          CoinModel(
            coinBalance: Decimal.parse('1'),
            currentPrice: Decimal.parse('1'),
            iconCoin: '',
            nameCoin: '',
            prices: [],
            ticker: '',
            variation: 1.2,
            // dayPrices: [],
          ),
        );

  // void changeVariation(int time) {
  //   time = time == 1 ? 2 : time;
  //   state.variation = (pD(state.prices.first) /  pD(state.prices.elementAt(time - 1)) -
  //           1) *
  //       100;
  // }
}
