import 'package:flutter/material.dart';
import 'package:trilha_propulsao/portifolio/widgets/wallet_header.dart';

import 'coin_list.dart';

class SuccessLoadingBody extends StatelessWidget {
  const SuccessLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [WalletHeader(), Expanded(child: CoinList())],
    );
  }
}
