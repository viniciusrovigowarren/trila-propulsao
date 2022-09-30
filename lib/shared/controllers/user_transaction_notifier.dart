import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../movements/model/movements_model.dart';

class UserTransactionsState extends StateNotifier<List<MovementsModel>> {
  UserTransactionsState() : super(const []);

  static final movementsprovider =
      StateNotifierProvider<UserTransactionsState, List<MovementsModel>>(
    (ref) => UserTransactionsState(),
  );

  void addNewTransaction(MovementsModel newTransaction) {
    state = [...state, newTransaction];
  }
}
