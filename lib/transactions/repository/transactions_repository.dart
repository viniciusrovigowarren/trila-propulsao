import '../model/transactions_model.dart';

class TransactionsRepository {
  List<TransactionsModel> transitions = [];

  List<TransactionsModel> getAllTransitions() => transitions;

  void addMovement(TransactionsModel movement) {
    transitions.add(movement);
  }
}
