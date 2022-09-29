import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/coin_view_data.dart';
import '../../portifolio/provider/provider.dart';
import '../provider/convert_provider.dart';
import 'convert_row.dart';
import 'conversion_title.dart';
import 'form_field_coin.dart';
import 'total_convert.dart';
import 'user_coin_balance.dart';

class BodyConvert extends StatefulHookConsumerWidget {
  const BodyConvert({super.key});

  @override
  BodyConvertState createState() => BodyConvertState();
}

class BodyConvertState extends ConsumerState<BodyConvert>
    with SingleTickerProviderStateMixin {
  TextEditingController convertValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CoinViewData coin =
        ModalRoute.of(context)!.settings.arguments as CoinViewData;
    final convertController = ref.watch(convertControllerProvider);
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    final walletController = ref.watch(walletControllerProvider);
    convertController.refresh(allCoinsController.coinToConvert, coin,
        walletController.selectedWalletCoin);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserCoinBalance(model: coin),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.035,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ConversionTitle(),
              ConvertRow(coin: coin),
              FormFieldCoin(
                walletController: walletController,
                convertController: convertController,
                convertValueController: convertValueController,
                coin: coin,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TotalConvert(),
            ],
          ),
        ),
      ],
    );
  }
}
