import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../shared/controllers/user_transaction_notifier.dart';
import 'list_tile_transactions.dart';

class ListViewMovements extends ConsumerStatefulWidget {
  const ListViewMovements({super.key});

  @override
  ConsumerState<ListViewMovements> createState() => _ListViewMovementsState();
}

class _ListViewMovementsState extends ConsumerState<ListViewMovements> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userTransactions = ref.watch(UserTransactionsState.movementsprovider);
    return Expanded(
      child: ListView.separated(
        itemCount: userTransactions.length,
        itemBuilder: (BuildContext context, int index) {
          var userTransaction = userTransactions[index];
          String formattedDate =
              DateFormat.yMd('pt-br').format(userTransaction.date);

          return ListTileTransactions(
            userTransaction: userTransaction,
            formattedDate: formattedDate,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          height: 4,
          color: Color.fromARGB(255, 149, 153, 166),
        ),
      ),
    );
  }
}
