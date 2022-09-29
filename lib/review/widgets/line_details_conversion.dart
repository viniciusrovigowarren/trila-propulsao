import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../convert/controller/convert_controller.dart';
import '../../convert/widgets/form_field_coin.dart';
import '../../portifolio/controller/wallet_controller.dart';
import '../../portifolio/model/coin_view_data.dart';

class LineDetailsConversion extends StatelessWidget {
  final String label;

  final WalletController walletController;
  final ConvertController convertController;
  final TextEditingController convertValueController;

  final CoinViewData coin;

  const LineDetailsConversion({
    Key? key,
    required this.label,
    required this.walletController,
    required this.convertController,
    required this.convertValueController,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.08,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(255, 201, 202, 212),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(255, 117, 118, 128),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: AutoSizeText(
                  textAlign: TextAlign.end,
                  '${walletController.selectedWalletCoin.percent.toString()} ${coin.symbol}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 47, 47, 51),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
