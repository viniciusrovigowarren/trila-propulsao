import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/util.dart';
import '../model/wallet_view_data.dart';
import '../provider/provider.dart';

class CoinPercentage extends HookConsumerWidget {
  final WalletViewData model;

  const CoinPercentage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);

    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Util.getContainerValueColor(viewWalletValue.state),
      ),
      width: size.width * .20,
      height: size.height * .023,
      child: Visibility(
        visible: (viewWalletValue.state),
        child: AutoSizeText(
          maxLines: 1,
          "${model.percent.toStringAsFixed(2)} ${model.coin.symbol}",
          style: const TextStyle(
            color: Color.fromARGB(255, 117, 118, 128),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
