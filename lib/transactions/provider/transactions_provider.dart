import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/transactions_controler.dart';
import '../repository/transactions_repository.dart';

final transactionsControllerProvider = ChangeNotifierProvider(
  (ref) => TransactionsControler(
    TransactionsRepository(),
  ),
);
