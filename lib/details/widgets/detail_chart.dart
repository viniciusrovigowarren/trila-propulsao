import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/wallet_view_data.dart';
import 'graphic.dart';
import 'period_button.dart';

class DetailChart extends HookConsumerWidget {
  final WalletViewData model;
  const DetailChart({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        children: [
          const CoinChart(),
          Row(
            children: const [
              PeriodButton(period: 5),
              PeriodButton(
                period: 15,
              ),
              PeriodButton(period: 30),
              PeriodButton(period: 45),
              PeriodButton(
                period: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
