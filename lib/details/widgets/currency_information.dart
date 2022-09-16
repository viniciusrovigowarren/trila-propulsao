import 'package:flutter/material.dart';

import 'price_currency.dart';
import 'qtd_currency.dart';
import 'value_coin.dart';
import 'variation_currency.dart';

class CurrencyInformation extends StatelessWidget {
  const CurrencyInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PriceCurrency(priceCUrrency: 100745),
        VariationCurrency(variationCurrency: -0.50),
        QtdCoin(priceCUrrency: 0.65554321, initialsCoin: 'BTC'),
        ValueCoin(priceCUrrency: 6557),
      ],
    );
  }
}
