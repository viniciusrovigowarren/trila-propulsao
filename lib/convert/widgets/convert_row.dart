import 'package:flutter/material.dart';

import '../../portifolio/model/coin_view_data.dart';
import 'convert_coin_container.dart';
import 'current_coin.dart';

class ConvertRow extends StatelessWidget {
  const ConvertRow({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinViewData coin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CurrentCoin(model: coin),
          const Icon(
            Icons.swap_horiz_rounded,
            size: 25,
            color: Color.fromARGB(255, 244, 43, 87),
          ),
          const ConvertCoinContainer(),
        ],
      ),
    );
  }
}
