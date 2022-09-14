import 'package:flutter/material.dart';
import 'package:trilha_propulsao/shared/utils/assets.dart';

import 'coin_item.dart';
import 'header_portifolio.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          HeaderPortifolio(
            totalBalance: 14798,
          ),
          CoinItem(
            currentPrice: 6557,
            initialsCoin: 'BTC',
            nameCoin: 'Bitcoin',
            variation: 0.65,
            iconCoin: imgBitcoin,
            iconCoinColor: colorBitcoin,
            sizeIcon: 25,
          ),
          CoinItem(
            currentPrice: 7996,
            initialsCoin: 'ETH',
            nameCoin: 'Ethereum',
            variation: 0.94,
            iconCoin: imgEthereum,
            iconCoinColor: colorEthereum,
            sizeIcon: 40,
          ),
          CoinItem(
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
