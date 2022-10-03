import 'package:flutter/material.dart';

import '../model/transactions_model.dart';

class DateBox extends StatelessWidget {
  const DateBox({
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
        transactions[index].dateNow,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(255, 117, 118, 128),
          fontSize: size.height * .02,
        ),
      ),
    );
  }
}
