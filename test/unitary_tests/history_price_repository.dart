import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trilha_propulsao/shared/repository/coin_prices_repository.dart';
import '../helpers/api_factory.dart';
import 'repository_all_coins.dart';

void main() {
  late CoinEndpointMock historyPriceCoinEndPoint;
  late CoinPricesRepository coinRepository;
  setUp(() {
    historyPriceCoinEndPoint = CoinEndpointMock();
    coinRepository =
        CoinPricesRepository(coinEndpoint: historyPriceCoinEndPoint);
  });
  test(
      'WHEN  CoinPricesRepository THEN getCoinHistoryPrices from historyPriceCoinEndPoint is called ',
      () async {
    when(
      (() => historyPriceCoinEndPoint.getCoinHistoryPrices(
            'etherium',
            '75698781323',
            '2354021823',
          )),
    ).thenAnswer(
      (_) async => Response(
        data: ApiFactory.getCoinHistoryPrices(),
        requestOptions: RequestOptions(
          path: faker.internet.httpUrl(),
        ),
      ),
    );
    await coinRepository.getCoinHistoryPrices(
      'etherium',
      '75698781323',
      '2354021823',
    );
    verify(
      () => historyPriceCoinEndPoint.getCoinHistoryPrices(
        'etherium',
        '75698781323',
        '2354021823',
      ),
    ).called(1);
  });
}
