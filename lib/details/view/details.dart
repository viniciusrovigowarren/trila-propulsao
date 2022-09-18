import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:trilha_propulsao/portifolio/model/coin_model.dart';
import 'package:trilha_propulsao/portifolio/view/portifolio.dart';

import '../widgets/button_convert_coin.dart';
import '../widgets/graphic.dart';
import '../widgets/header_details.dart';
import '../widgets/price_currency.dart';
import '../widgets/qtd_currency.dart';
import '../widgets/time_frame.dart';
import '../widgets/value_coin.dart';
import '../widgets/variation_currency.dart';

class DetailsPage extends HookConsumerWidget {
  final CoinModel model;
  const DetailsPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  static const routeName = '/details-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, PortifolioPage.routeName);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Detalhes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              HeaderDetails(
                nameCoin: model.nameCoin,
                imgIcon: model.iconCoin,
                ticker: model.ticker,
                currentPrice: model.currentPrice.toDouble(),
              ),
              //TODO: IMPLEMENTAR GRÁFICO
              Graphic(model: model),
              const TimeFrame(),
              Column(
                children: [
                  PriceCurrency(priceCUrrency: pS(model.currentPrice)),
                  VariationCurrency(variationCurrency: model.variation),
                  QtdCoin(
                      initialsCoin: model.ticker,
                      priceCUrrency: pS(model.currentPrice)),
                  ValueCoin(priceCurrency: pS(model.currentPrice)),
                ],
              ),
              const ButtonConvertCoin()
            ],
          ),
        ),
      ),
    ));
  }
}
