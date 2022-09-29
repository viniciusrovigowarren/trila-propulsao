import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../portifolio/model/coin_view_data.dart';
import '../../portifolio/provider/provider.dart';
import '../../shared/utils/util.dart';

class UserCoinBalance extends HookConsumerWidget {
  const UserCoinBalance({
    super.key,
    required this.model,
  });

  final CoinViewData model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletController = ref.watch(walletControllerProvider);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
      ),
      color: const Color.fromARGB(255, 236, 238, 245),
      height: size.height * .08,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Saldo disponível',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 117, 118, 128),
            ),
          ),
          AutoSizeText(
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            Util.getFormatedPercentage(
              walletController.selectedWalletCoin.percent,
              model.symbol,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
