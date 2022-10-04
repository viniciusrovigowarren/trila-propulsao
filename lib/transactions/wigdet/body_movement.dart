import 'package:auto_size_text/auto_size_text.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app.dart';
import '../model/transactions_model.dart';
import '../provider/transactions_provider.dart';
import 'listview_transactions.dart';

class MovementBody extends HookConsumerWidget {
  const MovementBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementControler = ref.watch(transactionsControllerProvider);
    List<TransactionsModel> transactions = movementControler.getAllMoviments();
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.05,
            ),
            child: AutoSizeText(
              CoreString.of(context)!.mov3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * .045,
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: transactions.isNotEmpty,
              replacement: Container(
                alignment: Alignment.center,
                child: EmptyWidget(
                  image: null,
                  packageImage: PackageImage.Image_1,
                  title: CoreString.of(context)!.mov2,
                  subTitle: CoreString.of(context)!.mov1,
                  titleTextStyle: const TextStyle(
                    fontSize: 22,
                    color: Color(0xff9da9c7),
                    fontWeight: FontWeight.w500,
                  ),
                  subtitleTextStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffabb8d6),
                  ),
                ),
              ),
              child: MovementsList(transactions: transactions),
            ),
          ),
        ],
      ),
    );
  }
}
