import '../../shared/utils/assets.dart';
import '../model/coin_model.dart';

class CoinRepository {
  List<CoinModel> getAllUserCoin() {
    List<CoinModel> coins = [
      CoinModel(
          nameCoin: 'Bitcoin',
          ticker: 'BTC',
          iconCoin: imgBitcoin,
          variation: 602.26,
          currentPrice: 114471.34),
      CoinModel(
          nameCoin: 'Ethereum',
          ticker: 'ETH',
          iconCoin: imgEthereum,
          variation: 9202.25,
          currentPrice: 7996),
      CoinModel(
          nameCoin: 'Litecoin',
          ticker: 'LTC',
          iconCoin: imgLitecoin,
          variation: 0.82,
          currentPrice: 245)
    ];
    return coins;
  }
}
