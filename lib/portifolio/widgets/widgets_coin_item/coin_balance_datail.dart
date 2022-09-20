import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../model/coin_model.dart';
import 'coin percentage.dart';
import 'coin_balance.dart';

class CoinBalanceDetail extends StatelessWidget {
  const CoinBalanceDetail({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CoinModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: AutoSizeText(
                    maxLines: 1,
                    model.nameCoin,
                    style: const TextStyle(fontSize: 21)),
              ),
              CoinBalance(model: model),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.ticker,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 117, 118, 128)),
              ),
              CoinPercentage(coin: model),
            ],
          ),
        ],
      ),
    );
  }
}
