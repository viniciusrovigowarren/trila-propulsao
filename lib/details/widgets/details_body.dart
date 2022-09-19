import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/coin_model.dart';
import '../../portifolio/view/portifolio.dart';
import 'button_convert_coin.dart';
import 'graphic.dart';
import 'header_details.dart';
import 'price_currency.dart';
import 'qtd_currency.dart';
import 'time_frame.dart';
import 'value_coin.dart';
import 'variation_currency.dart';

class DatailsBody extends StatelessWidget {
  final CoinModel model;
  final StateController<int> timeFrame;

  const DatailsBody({
    Key? key,
    required this.model,
    required this.timeFrame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                PortifolioPage.routeName,
              );
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Detalhes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
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
                Graphic(model: model),
                const TimeFrame(),
                Column(
                  children: [
                    PriceCurrency(
                      priceCUrrency: pS(
                        model.prices[timeFrame.state - 1],
                      ),
                    ),
                    VariationCurrency(
                      variationCurrency: (-model.prices.first.toDouble() +
                          model.prices[timeFrame.state - 1].toDouble()),
                    ),
                    QtdCoin(
                      priceCUrrency: model.coinBalance.toDouble(),
                      initialsCoin: model.ticker,
                    ),
                    ValueCoin(
                        priceCurrency: pS(
                      model.prices[timeFrame.state - 1] * model.coinBalance,
                    )),
                  ],
                ),
                ButtonConvertCoin(onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
