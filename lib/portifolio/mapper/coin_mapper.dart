import '../model/coin_view_data.dart';
import '../../shared/api/models/coin/get_all_coins_response.dart';

extension CoinMapper on GetAllCoinsResponse {
  List<CoinViewData> toViewData() {
    return result
        .map(
          (result) => CoinViewData(
            id: result.id,
            symbol: result.symbol.toUpperCase(),
            name: result.name,
            image: result.image,
            marketData: result.market_data,
          ),
        )
        .toList();
  }
}
