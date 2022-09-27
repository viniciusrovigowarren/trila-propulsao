import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../portifolio/model/wallet_view_data.dart';
import '../../shared/utils/util.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.model,
  }) : super(key: key);

  final WalletViewData model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: size.width * .05),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinTitleDetail(
              coinIcon: model.coin.image!.small,
              coinName: model.coin.name,
            ),
            CoinTicker(coinTicker: model.coin.symbol),
            CoinPrice(
              coinPrice:
                  pD(model.coin.marketData!.current_price.usd.toString()),
            ),
          ]),
    );
  }
}

class CoinTitleDetail extends StatelessWidget {
  const CoinTitleDetail({
    Key? key,
    required this.coinName,
    required this.coinIcon,
  }) : super(key: key);

  final String coinName;
  final String coinIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(coinName,
            style: TextStyle(
              fontFamily: "Mansny regular",
              fontWeight: FontWeight.bold,
              fontSize: size.height * .040,
            )),
        Container(
          width: size.height * .06,
          height: size.height * .06,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(coinIcon))),
        ),
      ],
    );
  }
}

class CoinTicker extends StatelessWidget {
  const CoinTicker({
    Key? key,
    required this.coinTicker,
  }) : super(key: key);

  final String coinTicker;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(coinTicker,
        style: TextStyle(
          fontFamily: "Mansny regular",
          fontWeight: FontWeight.normal,
          fontSize: size.height * .02,
        ));
  }
}

class CoinPrice extends StatelessWidget {
  const CoinPrice({
    Key? key,
    required this.coinPrice,
  }) : super(key: key);

  final Decimal coinPrice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 09),
      child: AutoSizeText(
        maxLines: 1,
        NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
            .format(pS(coinPrice)),
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Montserrat",
          fontSize: size.height * .040,
        ),
      ),
    );
  }
}
