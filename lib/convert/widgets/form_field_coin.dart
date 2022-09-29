import 'package:flutter/material.dart';
import 'package:trilha_propulsao/shared/utils/assets.dart';

import '../../portifolio/controller/wallet_controller.dart';
import '../../portifolio/model/coin_view_data.dart';
import '../../shared/utils/util.dart';
import '../controller/convert_controller.dart';

class FormFieldCoin extends StatelessWidget {
  const FormFieldCoin({
    Key? key,
    required this.walletController,
    required this.convertController,
    required this.convertValueController,
    required this.coin,
  }) : super(key: key);

  final WalletController walletController;
  final ConvertController convertController;
  final TextEditingController convertValueController;
  final CoinViewData coin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        Util.getTextInputFormatter(
          walletController.selectedWalletCoin.percent,
        )
      ],
      style: const TextStyle(
        fontSize: 30,
      ),
      onChanged: (value) {
        convertController.setConvertValue(value);
      },
      controller: convertValueController,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        prefixIconConstraints: BoxConstraints.loose(size),
        prefixIcon: Text(
          '${coin.symbol} ',
          style: TextStyle(
            fontSize: size.height * .04,
            color: convertValueController.text.isNotEmpty
                ? Colors.black
                : const Color.fromARGB(255, 150, 150, 150),
          ),
        ),
        hintStyle: TextStyle(
          fontSize: size.height * .04,
          color: const Color.fromARGB(255, 150, 150, 150),
        ),
        hintText: '0,00',
        helperText: convertController.isValidConversion
            ? convertController.getDolarFormatedValue()
            : convertController.helperMessage,
        helperStyle: TextStyle(
          fontSize: 15,
          color:
              convertController.isValidConversion ? Colors.grey : colorMagenta,
        ),
      ),
    );
  }
}
