import 'package:flutter/material.dart';
import '../model/coin_model.dart';
import 'widgets_coin_item/coin_balance_datail.dart';
import 'widgets_coin_item/coin_image.dart';

class CoinItem extends StatelessWidget {
  final CoinModel coin;
  const CoinItem({
    super.key,
    required this.coin,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: size.height * .12,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 227, 228, 235),
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CoinImage(image: coin.iconCoin),
            CoinBalanceDetail(coin: coin),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * .009, left: size.width * .04),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 14,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
