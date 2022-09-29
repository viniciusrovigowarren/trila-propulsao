import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trilha_propulsao/convert/view/conversion_page.dart';

import '../../convert/provider/convert_provider.dart';
import '../../portifolio/model/coin_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/assets.dart';

class ButtonConversionDone extends HookConsumerWidget {
  // final CoinViewData coin;
  // final List<CoinValueResponse> data;

  const ButtonConversionDone({
    Key? key,
    // required this.coin,
    // required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertController = ref.watch(convertControllerProvider);
    final size = MediaQuery.of(context).size;

    return MaterialButton(
      color: colorMagenta,
      minWidth: size.width * 0.9,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: () {},
      child: const Text(
        'Concluir conversão',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
