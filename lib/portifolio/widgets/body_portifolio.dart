import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../details/provider/provider.dart';
import '../../details/view/details.dart';
import '../model/coin_model.dart';
import 'coin_item.dart';
import 'wallet_header.dart';

class BodyPortifolioPage extends HookConsumerWidget {
  const BodyPortifolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = ref.watch(coinProvider);
    mostrarDetalhes(CoinModel model) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailsPage(model: model),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          const WalletHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: coins.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => mostrarDetalhes(coins[index]),
                  child: CoinItem(
                    model: coins[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
