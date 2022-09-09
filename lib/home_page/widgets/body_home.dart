import 'package:flutter/material.dart';

import 'delails_coins.dart';
import 'top_page_wallet_eye.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          TopPageWalletEye(
            totalBalance: 1000,
          ),
          DetailsCoins(
            currentPrice: 0.00,
            initialsCoin: 'ETH',
            nameCoin: 'Ethereum',
            variation: 75,
          ),
          DetailsCoins(
            currentPrice: 1000,
            initialsCoin: 'BTC',
            nameCoin: 'Bitcoin',
            variation: 75,
          ),
          DetailsCoins(
            currentPrice: 0.00,
            initialsCoin: 'LTC',
            nameCoin: 'Litecoin',
            variation: -0.7,
          ),
        ],
      ),
    );
  }
}
