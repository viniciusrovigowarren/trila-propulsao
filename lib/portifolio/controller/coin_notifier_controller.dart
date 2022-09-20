import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/coin_model.dart';
import '../repository/coin_repository.dart';

class CoinNotifier extends StateNotifier<List<CoinModel>> {
  CoinNotifier() : super([]) {
    getAllCoins();
  }
  final _repository = CoinRepository();

  getAllCoins() async {
    state = await _repository.getAllCoins();
  }
}
