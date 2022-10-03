import 'package:flutter/material.dart';
import 'package:trilha_propulsao/transactions/wigdet/value_down.dart';

import '../../shared/utils/util.dart';
import '../model/transactions_model.dart';
import 'converted_crypto.dart';
import 'converted_dollar.dart';
import 'date_box.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem({
    Key? key,
    required this.transactions,
    required this.index,
  }) : super(key: key);

  final List<TransactionsModel> transactions;
  late int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 202, 202, 202),
            width: 1,
          ),
        ),
      ),
      height: size.height * 0.095,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueDown(transactions: transactions, index: index),
                SizedBox(height: size.height * 0.01),
                DateBox(transactions: transactions, index: index),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConvertedCrypto(
                  cryptovalue: Util.getFormatedEntryValue(
                    transactions[index],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                ConvertedDollar(
                  convertedValue: transactions[index].dolarConverted,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
