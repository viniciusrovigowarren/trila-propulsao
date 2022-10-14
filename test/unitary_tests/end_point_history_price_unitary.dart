import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trilha_propulsao/shared/api/coin_prices_endpoint.dart';
import '../helpers/api_factory.dart';
import 'end_point_all_coins_unitary.dart';

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late CoinEndpoint historyPriceCoinEndPoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    historyPriceCoinEndPoint = CoinEndpoint(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getCoinHistoryPrices(), 200);
  });
  test('WHEN getAllCoins is requested THEN code 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await historyPriceCoinEndPoint.getCoinHistoryPrices(
      'etherium',
      '75698781323',
      '2354021823',
    );
    expect(result.statusCode, equals(200));
  }));
}
