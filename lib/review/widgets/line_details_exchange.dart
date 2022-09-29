import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/convert_controller.dart';
import '../../convert/provider/convert_provider.dart';
import '../../portifolio/controller/wallet_controller.dart';
import '../../portifolio/model/coin_view_data.dart';

class LineDetailsExchange extends HookConsumerWidget {
  final String label;

  final WalletController walletController;
  final CoinViewData coin;

  const LineDetailsExchange({
    Key? key,
    required this.label,
    required this.walletController,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertController = ref.watch(convertControllerProvider);
    final size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      final double result =
          double.parse(convertController.getConvertValueWithoutSymbol()) /
              walletController.selectedWalletCoin.percent;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.08,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(255, 201, 202, 212),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(255, 117, 118, 128),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: AutoSizeText(
                  textAlign: TextAlign.end,
                  '1 ${coin.symbol} = $result ${convertController.coinToConvert.symbol}',
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 47, 47, 51),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
