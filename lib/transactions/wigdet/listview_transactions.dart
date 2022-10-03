import 'package:flutter/material.dart';
import 'package:trilha_propulsao/transactions/wigdet/transaction_item.dart';

import '../model/transactions_model.dart';

class MovementsList extends StatelessWidget {
  const MovementsList({
    super.key,
    required this.transactions,
  });

  final List<TransactionsModel> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return TransactionItem(
          transactions: transactions,
          index: index,
        );
      },
    );
  }
}
