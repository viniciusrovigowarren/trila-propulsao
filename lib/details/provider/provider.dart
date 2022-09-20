import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/controller/coin_notifier_controller.dart';
import '../../portifolio/model/coin_model.dart';

final timeFrameProvider = StateProvider<int>(
  (ref) => 5,
);

final coinProvider = StateNotifierProvider<CoinNotifier, List<CoinModel>>(
  (ref) => CoinNotifier(),
);
