import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:trilha_propulsao/details/controller/detail_controller.dart';
import 'package:trilha_propulsao/portifolio/model/coin_view_data.dart';
import 'package:trilha_propulsao/portifolio/model/wallet_view_data.dart';
import 'package:trilha_propulsao/shared/api/models/coin/coin_result_image_response.dart';
import 'package:trilha_propulsao/shared/api/models/coin/coin_result_market_data_current_price.dart';
import 'package:trilha_propulsao/shared/api/models/coin/coin_result_market_data_response.dart';
import 'package:trilha_propulsao/transactions/model/transactions_model.dart';

class DataFake {
  List<TransactionsModel> getMovementList() {
    return [
      TransactionsModel(
        cryptoUp: getCoinData(),
        cryptoDown: getCoinData(),
        transactionsUp: Decimal.parse('12'),
        transactionsDown: Decimal.parse('23'),
        dateNow: '2022/12/22',
        dolarConverted: faker.lorem.toString(),
      ),
      TransactionsModel(
        cryptoUp: getCoinData(),
        cryptoDown: getCoinData(),
        transactionsUp: Decimal.parse('122'),
        transactionsDown: Decimal.parse('22'),
        dateNow: '2022/12/22',
        dolarConverted: faker.lorem.toString(),
      ),
    ];
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

  CoinViewData getCoinData() {
    return CoinViewData(
      id: faker.guid.guid(),
      symbol: faker.guid.guid(),
      name: faker.guid.guid(),
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
}
