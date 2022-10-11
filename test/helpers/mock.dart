import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:trilha_propulsao/convert/controller/convert_controller.dart';
import 'package:trilha_propulsao/details/controller/detail_controller.dart';
import 'package:trilha_propulsao/portifolio/controller/allcoins_controller.dart';
import 'package:trilha_propulsao/portifolio/controller/wallet_controller.dart';
import 'package:trilha_propulsao/portifolio/model/coin_view_data.dart';
import 'package:trilha_propulsao/portifolio/model/wallet_view_data.dart';
import 'package:trilha_propulsao/shared/api/models/coin/coin_result_image_response.dart';
import 'package:trilha_propulsao/shared/api/models/coin/coin_result_market_data_current_price.dart';
import 'package:trilha_propulsao/shared/api/models/coin/coin_result_market_data_response.dart';
import 'package:trilha_propulsao/shared/api/models/coin_prices/coin_price_response.dart';
import 'package:trilha_propulsao/transactions/model/transactions_model.dart';

class DataFake {
  WalletController getWalletControllerInitialized() {
    WalletController walletController = WalletController();

    walletController.selectedWalletCoin = getWalletViewData();
    walletController.coins = [getWalletViewData()];
    walletController.selectedWalletCoin = getWalletViewData();
    return walletController;
  }

  ConvertController getConvertControllerInitialized() {
    ConvertController convertController = ConvertController();
    convertController.initValues(getCoinViewData());
    convertController.currentAssetPrice = 244;
    convertController.refresh(getCoinViewData(), getWalletViewData());
    convertController.setConvertValue('128102');
    convertController.setCoinPercent('11232');
    return convertController;
  }

  AllCoinsController getAllCoinControllerInitialized() {
    AllCoinsController allCoinsController = AllCoinsController();
    allCoinsController.coins = [getCoinViewData()];

    return allCoinsController;
  }

  WalletViewData getWalletViewData() {
    return WalletViewData(
      userBalance: Decimal.fromInt(6546545),
      coin: CoinViewData(
        id: faker.guid.guid(),
        symbol: faker.guid.guid(),
        name: faker.guid.guid(),
        image: CoinResultImageResponse('thumb', 'small', 'large'),
        marketData: CoinResultMarketDataResponse(
          CoinResultMarketDataCurrentPrice(123123),
          123123,
        ),
      ),
    );
  }

  List<TransactionsModel> getMovementList() {
    return [
      TransactionsModel(
        cryptoUp: getCoinViewData(),
        cryptoDown: getCoinViewData(),
        transactionsUp: Decimal.parse('12'),
        transactionsDown: Decimal.parse('23'),
        dateNow: '2022/12/22',
        dolarConverted: faker.lorem.toString(),
      ),
      TransactionsModel(
        cryptoUp: getCoinViewData(),
        cryptoDown: getCoinViewData(),
        transactionsUp: Decimal.parse('122'),
        transactionsDown: Decimal.parse('22'),
        dateNow: '2022/12/22',
        dolarConverted: faker.lorem.toString(),
      ),
    ];
  }

  TransactionsModel getMovementModel() {
    return TransactionsModel(
        cryptoUp: getCoinViewData(),
        cryptoDown: getCoinViewData(),
        transactionsUp: Decimal.parse('1231'),
        transactionsDown: Decimal.parse('123'),
        dateNow: faker.date.toString(),
        dolarConverted: faker.date.toString());
  }

  CoinViewData getCoinViewData() {
    return CoinViewData(
      id: 'bitcoin',
      symbol: 'BTC',
      name: 'Bitcoin',
      image: CoinResultImageResponse('thumb', 'small', 'large'),
      marketData: CoinResultMarketDataResponse(
        CoinResultMarketDataCurrentPrice(123123),
        123123,
      ),
    );
  }

  DetailsController getDetailsController() {
    return DetailsController();
  }

  static const int date = 1657594850324;
  static const double value = 19967.60020613295;

  List<CoinValueResponse> getCoinValueResponseList() {
    List<CoinValueResponse> coinValueResponseList = [];
    for (var i = 0; i < 2000; i++) {
      coinValueResponseList
          .add(CoinValueResponse(values: [1657594850324, 19967.60020613295]));
    }
    return coinValueResponseList;
  }
}
