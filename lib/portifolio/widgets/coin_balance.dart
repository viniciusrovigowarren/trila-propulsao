import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/util.dart';
import '../model/wallet_view_data.dart';
import '../provider/provider.dart';

class CoinBalance extends HookConsumerWidget {
  const CoinBalance({
    Key? key,
    required this.model,
  }) : super(key: key);

  final WalletViewData model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);

    return Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Util.getContainerValueColor(viewWalletValue.state)),
        width: size.width * .24,
        height: size.height * .026,
        child: Visibility(
            visible: (viewWalletValue.state),
            child: AutoSizeText(
                maxLines: 1,
                NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
                    .format(DecimalIntl(model.userBalance)),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ))));
  }
}
