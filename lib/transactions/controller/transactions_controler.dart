import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../convert/controller/convert_controller.dart';
import '../model/transactions_model.dart';
import '../repository/transactions_repository.dart';

class TransactionsControler extends ChangeNotifier {
  TransactionsRepository transactionsRepo;

  TransactionsControler(
    this.transactionsRepo,
  );

  List<TransactionsModel> getAllMoviments() =>
      transactionsRepo.getAllTransitions();

  void newTransation(ConvertController convertController) {
    transactionsRepo.addMovement(
      TransactionsModel(
        dateNow: DateFormat("dd/MM/yyyy").format(DateTime.now()),
        dolarConverted: convertController.moneyFormat(),
        cryptoUp: convertController.coinToConvert,
        cryptoDown: convertController.currentCoin,
        transactionsUp: convertController.ReceiveFormat(),
        transactionsDown: convertController.DecimalMoney(),
      ),
    );
  }
}
