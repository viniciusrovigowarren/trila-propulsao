import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/provider.dart';
import '../repository/wallet_repository.dart';
import 'coin_list.dart';
import 'wallet_header.dart';

import 'loading_wallet.dart';

class BodyPortfolio extends HookConsumerWidget {
  const BodyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllCoinsProvider = ref.watch(allCoinsProvider);

    return SafeArea(
      child: getAllCoinsProvider.when(
        data: (data) {
          final walletController = ref.watch(walletControllerProvider);
          walletController.coins =
              WalletRepository(allCoins: data).getAllUserCoin();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WalletHeader(),
              CoinList(),
            ],
          );
        },
        error: (error, stackTrace) => const AutoSizeText(
          maxLines: 1,
          'Algo deu errado!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        loading: () => const Loading(),
      ),
    );
  }
}
