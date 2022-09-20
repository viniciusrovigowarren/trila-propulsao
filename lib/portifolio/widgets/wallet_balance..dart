import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider/provider.dart';
import '../controller/wallet_controller.dart';

class WalletBalance extends HookConsumerWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    final walletController = ref.watch(walletControllerProvider);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              WalletController.getContainerValueColor(viewWalletValue.state)),
      width: size.width * 0.55,
      height: size.height * .050,
      child: Visibility(
        visible: (viewWalletValue.state),
        child: AutoSizeText(
          'US ${NumberFormat.simpleCurrency(locale: 'en_US', decimalDigits: 2).format((walletController.getTotalBalance()))}',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontSize: size.height * .045,
          ),
        ),
      ),
    );
  }
}
