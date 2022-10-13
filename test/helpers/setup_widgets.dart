import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trilha_propulsao/convert/controller/convert_controller.dart';
import 'package:trilha_propulsao/convert/provider/convert_provider.dart';
import 'package:trilha_propulsao/core/routes.dart';
import 'package:trilha_propulsao/convert/controller/allcoins_controller.dart';
import 'package:trilha_propulsao/portifolio/controller/wallet_controller.dart';
import 'package:trilha_propulsao/portifolio/provider/provider.dart';
import 'package:trilha_propulsao/shared/repository/coin_prices_repository_provider.dart';
import 'package:trilha_propulsao/transactions/controller/transactions_controler.dart';
import 'package:trilha_propulsao/transactions/provider/transactions_provider.dart';
import 'package:trilha_propulsao/transactions/repository/transactions_repository.dart';

import 'mock.dart';

Future<void> loadDataPage(WidgetTester tester, Widget widgetTest) async {
  var widget = SetupTeste(
    test: widgetTest,
  );
  await tester.pumpWidget(widget);
}

class SetupTeste extends StatelessWidget {
  const SetupTeste({
    Key? key,
    required this.test,
  }) : super(key: key);

  final Widget test;

  @override
  Widget build(BuildContext context) {
    DataFake mockData = DataFake();

    WalletController walletController = WalletController();
    ConvertController convertController = ConvertController();
    convertController.currentAssetPrice = 22;
    walletController.coins = [mockData.getWalletViewData()];
    walletController.selectedWalletCoin = mockData.getWalletViewData();
    final movementControllerProviderMock = ChangeNotifierProvider(
      (ref) => TransactionsControler(
        TransactionsRepository(),
      ),
    );
    final walletControllerProviderMock = ChangeNotifierProvider(
      (ref) => WalletController(),
    );
    final convertControllerProviderMock = ChangeNotifierProvider(
      (ref) => ConvertController(),
    );
    final coinPricesRepositoryProviderMock = ChangeNotifierProvider(
      (ref) => WalletController(),
    );
    final allCoinsControllerProviderMock = ChangeNotifierProvider(
      (ref) => AllCoinsController(),
    );

    return ProviderScope(
      overrides: [
        allCoinsControllerProvider
            .overrideWithProvider(allCoinsControllerProviderMock),
        convertControllerProvider
            .overrideWithProvider(convertControllerProviderMock),
        walletControllerProvider
            .overrideWithProvider(walletControllerProviderMock),
        transactionsControllerProvider
            .overrideWithProvider(movementControllerProviderMock),
      ],
      child: MaterialApp(
        routes: appRoutes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: test,
          ),
        ),
      ),
    );
  }
}
