import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trilha_propulsao/portifolio/widgets/success_loading_body.dart';
import 'package:trilha_propulsao/shared/utils/assets.dart';

import '../../convert/provider/convert_provider.dart';
import '../provider/provider.dart';
import '../repository/wallet_repository.dart';
import 'loading_wallet.dart';

class BodyPortfolio extends HookConsumerWidget {
  const BodyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllCoinsProvider = ref.watch(allCoinsProvider);
    final walletController = ref.watch(walletControllerProvider);
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    return SafeArea(
      child: getAllCoinsProvider.when(
        data: (data) {
          walletController.coins =
              WalletRepository(allCoins: data).getAllUserCoin();

          allCoinsController.coins = data;
          return const SuccessLoadingBody();
        },
        error: (error, stackTrace) => EmptyWidget(
          image: imgLogoWarrenGray,
          packageImage: PackageImage.Image_1,
        ),
        loading: () => const Loading(),
      ),
    );
  }
}
