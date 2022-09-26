import 'package:trilha_propulsao/details/mapper/coin_price_mapper.dart';

import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/repository/coin_prices_repository.dart';
import '../controller/detail_controller.dart';

class GetCoinPricesUseCase {
  final CoinPricesRepository repository;
  GetCoinPricesUseCase({
    required this.repository,
  });
  Future<List<CoinValueResponse>?> execute(
      DetailsController coinDetails) async {
    if (coinDetails.coin != null &&
        coinDetails.firtDate != null &&
        coinDetails.lastDate != null) {
      final response = await repository.getCoinHistoryPrices(
          coinDetails.coin!.id, coinDetails.firtDate!, coinDetails.lastDate!);
      return response.toViewData();
    }
    return null;
  }
}
