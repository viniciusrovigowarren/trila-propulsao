import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/wallet_controller.dart';
import '../repository/coin_repository.dart';

final pageIndexProvider = StateProvider<int>(
  ((ref) => 1),
);

final walletControllerProvider = ChangeNotifierProvider(
  (ref) => WalletController(CoinRepository()),
);

final testeControllerProvider = ChangeNotifierProvider(
  (ref) => WalletController(CoinRepository()),
);

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => true,
);
