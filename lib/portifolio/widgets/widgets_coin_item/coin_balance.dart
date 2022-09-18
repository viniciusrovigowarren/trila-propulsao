import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../controller/wallet_controller.dart';
import '../../model/coin_model.dart';
import '../../provider/provider.dart';

class CoinBalance extends HookConsumerWidget {
  const CoinBalance({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CoinModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              WalletController.getContainerValueColor(viewWalletValue.state)),
      width: size.width * .24,
      height: size.height * .026,
      child: Visibility(
        visible: (viewWalletValue.state),
        child: AutoSizeText(
          NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
              .format((model.currentPrice.toDouble())),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
