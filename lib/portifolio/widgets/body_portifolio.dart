import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trilha_propulsao/portifolio/widgets/wallet_header.dart';

import '../provider/provider.dart';
import 'coin_item.dart';

class BodyHome extends HookConsumerWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletController = ref.watch(walletControllerProvider);

    return SafeArea(
      child: Column(
        children: [
          const WalletHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: walletController.coins.length,
              itemBuilder: (context, index) {
                return CoinItem(
                  coin: walletController.coins[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
