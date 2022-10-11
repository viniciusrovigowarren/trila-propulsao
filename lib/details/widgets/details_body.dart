import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/wallet_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../provider/provider.dart';
import 'detail_chart.dart';
import 'detail_description.dart';
import 'detail_header.dart';
import 'loading_details.dart';

class DatailsBody extends StatefulHookConsumerWidget {
  final WalletViewData model;

  const DatailsBody({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  BodyDetailState createState() => BodyDetailState();
}

class BodyDetailState extends ConsumerState<DatailsBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final coinHistoryPriceProvider = ref.read(coinHistoryPricesProvider);
    final detailController = ref.watch(detailControllerProvider);
    return coinHistoryPriceProvider.when(data: (data) {
      detailController
          .setCoinHistoryPriceValues(data as List<CoinValueResponse>);
      return Column(
        children: [
          DetailsHeader(model: widget.model),
          DetailChart(model: widget.model),
          DetailDescription(data: data, model: widget.model)
        ],
      );
    }, error: (error, stackTrace) {
      return Center(
        child: AutoSizeText(
          maxLines: 1,
          'Ops, algo aconteceu! Tente novamente mais tarde ',
          style: TextStyle(
            fontFamily: "Mansny regular",
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.040,
          ),
        ),
      );
    }, loading: () {
      Timer(const Duration(seconds: 1), () {
        setState(() {});
      });
      return const LoadingDetails();
    });
  }
}
