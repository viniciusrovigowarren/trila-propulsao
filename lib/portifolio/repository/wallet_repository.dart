import '../../shared/utils/util.dart';
import '../model/coin_view_data.dart';
import '../model/wallet_view_data.dart';

class WalletRepository {
  List<CoinViewData> allCoins = [];
  WalletRepository({
    required this.allCoins,
  });
  List<WalletViewData> getAllUserCoin() {
    List<WalletViewData> walletCoins = [
      WalletViewData(coin: allCoins[11], userBalance: pD('1500.24')),
      WalletViewData(coin: allCoins[8], userBalance: pD('5.20')),
      WalletViewData(coin: allCoins[2], userBalance: pD('1132.20')),
      WalletViewData(coin: allCoins[7], userBalance: pD('5870.20')),
      WalletViewData(coin: allCoins[0], userBalance: pD('329.25')),
      WalletViewData(coin: allCoins[5], userBalance: pD('1170.20')),
      WalletViewData(coin: allCoins[4], userBalance: pD('5.20')),
      WalletViewData(coin: allCoins[1], userBalance: pD('329.25')),
      WalletViewData(coin: allCoins[3], userBalance: pD('1500.24')),
      WalletViewData(coin: allCoins[6], userBalance: pD('1170.20')),
    ];

    return walletCoins;
  }
}
