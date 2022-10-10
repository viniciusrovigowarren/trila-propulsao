import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../details/provider/provider.dart';
import '../../details/view/details.dart';
import '../model/wallet_view_data.dart';
import '../provider/provider.dart';
import 'coin_balance_detail.dart';
import 'coin_image.dart';

class CoinItem extends HookConsumerWidget {
  final WalletViewData model;

  const CoinItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailController = ref.watch(detailControllerProvider);
    final walletController = ref.watch(walletControllerProvider);

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        walletController.selectedWalletCoin = model;
        detailController.coin = model.coin;

        Navigator.pushNamed(context, DetailsPage.routeName, arguments: model);
      },
      child: Container(
        height: size.height * .12,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 227, 228, 235),
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoinImage(image: model.coin.image!.large),
              CoinBalanceDetail(model: model),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * .009, left: size.width * .04),
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
