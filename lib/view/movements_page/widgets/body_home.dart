import 'package:flutter/material.dart';
import 'package:trilha_propulsao/core/assets.dart';

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
            totalBalance: 14798,
          ),
          DetailsCoins(
            currentPrice: 6557,
            initialsCoin: 'BTC',
            nameCoin: 'Bitcoin',
            variation: 0.65,
            iconCoin: imgBitcoin,
            iconCoinColor: colorBitcoin,
            sizeIcon: 25,
          ),
          DetailsCoins(
            currentPrice: 7996,
            initialsCoin: 'ETH',
            nameCoin: 'Ethereum',
            variation: 0.94,
            iconCoin: imgEthereum,
            iconCoinColor: colorEthereum,
            sizeIcon: 40,
          ),
          DetailsCoins(
            currentPrice: 245,
            initialsCoin: 'LTC',
            nameCoin: 'Litecoin',
            variation: 0.82,
            iconCoin: imgLitecoin,
            iconCoinColor: colorLitecoin,
            sizeIcon: 40,
          ),
        ],
      ),
    );
  }
}
