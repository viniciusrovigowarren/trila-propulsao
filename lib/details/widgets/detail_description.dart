import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trilha_propulsao/details/widgets/button_convert_coin.dart';
import '../../portifolio/model/coin_view_data.dart';
import '../../portifolio/model/wallet_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/util.dart';

class DetailDescription extends HookConsumerWidget {
  final WalletViewData model;
  final List<CoinValueResponse> data;
  const DetailDescription({
    super.key,
    required this.model,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DetailCoinValue(
            description: 'Preço atual',
            value: NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
                .format((model.coin.marketData!.current_price.usd)),
          ),
          CurrencyVariationValue(
            description: 'Variação 24H',
            value:
                '${(model.coin.marketData!.price_change_percentage_24h.toStringAsFixed(2)).toString()}%',
          ),
          DetailCoinValue(
            description: 'Quantidade',
            value: "${model.percent.toStringAsFixed(2)} ${model.coin.symbol}",
          ),
          DetailCoinValue(
            description: 'Valor',
            value: NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
                .format(DecimalIntl(
                    Decimal.parse((model.userBalance.toDouble()).toString()))),
          ),
          ButtonConvertCoin(
            data: data,
            coin: model.coin,
          ),
        ],
      ),
    );
  }
}

class BottomLine extends StatelessWidget {
  const BottomLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      height: size.height * 0.009,
      width: size.width * .36,
    );
  }
}

class ConvertButton extends StatelessWidget {
  final CoinViewData coin;
  final List<CoinValueResponse> data;

  const ConvertButton({
    Key? key,
    required this.coin,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        minWidth: size.width,
        color: const Color.fromARGB(255, 224, 43, 87),
        height: size.height * 0.08,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Converter moeda',
          style: TextStyle(
            fontFamily: "Mansny regular",
            color: Colors.white,
            fontSize: size.height * 0.023,
          ),
        ),
      ),
    );
  }
}

class DetailCoinValue extends StatelessWidget {
  const DetailCoinValue({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 1,
          ),
        ),
      ),
      margin: EdgeInsets.only(left: size.width * 0.05),
      height: size.height * .08,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              description,
              style: TextStyle(
                fontFamily: "Mansny-regular",
                color: const Color.fromARGB(255, 117, 118, 128),
                fontSize: size.height * .021,
              ),
            ),
            AutoSizeText(
                maxLines: 1,
                value,
                style: TextStyle(
                  fontFamily: "Mansny-regular",
                  color: Colors.black,
                  fontSize: size.height * .020,
                ))
          ],
        ),
      ),
    );
  }
}

class CurrencyVariationValue extends StatelessWidget {
  const CurrencyVariationValue({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 1,
          ),
        ),
      ),
      margin: EdgeInsets.only(left: size.width * 0.05),
      height: size.height * .07,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              description,
              style: TextStyle(
                fontFamily: "Mansny-regular",
                color: const Color.fromARGB(255, 117, 118, 128),
                fontSize: size.height * .021,
              ),
            ),
            AutoSizeText(
                maxLines: 1,
                value,
                style: TextStyle(
                  fontFamily: "Mansny-regular",
                  color: Util.getVariationColor(value),
                  fontSize: size.height * .020,
                ))
          ],
        ),
      ),
    );
  }
}
