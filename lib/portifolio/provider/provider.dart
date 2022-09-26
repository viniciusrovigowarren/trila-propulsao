import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/repository/coin_repository_provider.dart';
import '../controller/wallet_controller.dart';
import '../model/coin_view_data.dart';
import '../usecase/get_all_coin_use_case.dart';

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => true,
);
final getAllCoinUseCase = Provider((ref) {
  return GetAllCoinUseCase(repository: ref.read(coinRepositoryProvider));
});

final allCoinsProvider = FutureProvider<List<CoinViewData>>((ref) async {
  return ref.read(getAllCoinUseCase).execute();
});

final walletControllerProvider =
    ChangeNotifierProvider((ref) => WalletController());
