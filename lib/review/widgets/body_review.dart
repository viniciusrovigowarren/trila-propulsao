import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:trilha_propulsao/review/widgets/title_conversion.dart';

import '../../convert/provider/convert_provider.dart';
import '../../portifolio/model/coin_view_data.dart';
import '../../portifolio/provider/provider.dart';
import 'button_conversion_done.dart';
import 'line_details_conversion.dart';
import 'line_details_exchange.dart';
import 'line_details_receive.dart';

class BodyReview extends StatefulHookConsumerWidget {
  const BodyReview({
    Key? key,
  }) : super(key: key);

  @override
  BodyReviewState createState() => BodyReviewState();
}

class BodyReviewState extends ConsumerState<BodyReview>
    with SingleTickerProviderStateMixin {
  TextEditingController convertValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CoinViewData coin =
        ModalRoute.of(context)!.settings.arguments as CoinViewData;
    final convertController = ref.watch(convertControllerProvider);
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    final walletController = ref.watch(walletControllerProvider);
    convertController.refresh(allCoinsController.coinToConvert, coin,
        walletController.selectedWalletCoin);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitleConversion(),
        SizedBox(
          child: Column(
            children: [
              LineDetailsConversion(
                label: 'Converter',
                walletController: walletController,
                coin: coin,
              ),
              LineDetailsReceive(
                label: 'Receber',
                coin: coin,
              ),
              LineDetailsExchange(
                label: 'Câmbio',
                coin: coin,
                walletController: walletController,
              ),
              const ButtonConversionDone(),
            ],
          ),
        ),
      ],
    );
  }
}
