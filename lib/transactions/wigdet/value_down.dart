import 'package:flutter/material.dart';

import '../../shared/utils/util.dart';
import '../model/transactions_model.dart';

class ValueDown extends StatelessWidget {
  const ValueDown({
    Key? key,
    required this.transactions,
    required this.index,
  }) : super(key: key);

  final List<TransactionsModel> transactions;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Text(
        Util.getFormatedOutValue(transactions[index]),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(255, 117, 118, 128),
          fontSize: size.height * .022,
        ),
      ),
    );
  }
}
