import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:trilha_propulsao/details/view/details.dart';
import 'package:trilha_propulsao/details/widgets/detail_header.dart';
import 'package:trilha_propulsao/l10n/app.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_balance_detail.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_image.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_list.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_title.dart';
import 'package:trilha_propulsao/transactions/wigdet/listview_transactions.dart';
import 'package:trilha_propulsao/transactions/wigdet/transaction_item.dart';

import '../helpers/mock.dart';
import '../helpers/setup_widgets.dart';

void main() {
  DataFake data = DataFake();

  group(
    'Transactions page test',
    () {
      testWidgets(
        'WHEN  transactions seek two movements THEN two movement item  ',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadDataPage(
                tester,
                MovementsList(
                  transactions: data.getMovementList(),
                ),
              );
              expect(find.byType(TransactionItem), findsNothing);
              expect(find.byType(AutoSizeText), findsAtLeastNWidgets(0));
              expect(find.byType(CircleAvatar), findsNothing);
              expect(find.byType(Column), findsNothing);
              expect(find.byType(Icon), findsNothing);
              expect(find.byType(AutoSizeText), findsNothing);
              expect(find.byType(Container), findsAtLeastNWidgets(0));
              expect(find.byType(Row), findsNothing);
              expect(find.byType(BoxDecoration), findsNothing);
              expect(find.byType(CoinTitleDetail), findsNothing);
              expect(find.byType(CoinTicker), findsNothing);
              expect(find.byType(CoinPrice), findsNothing);
              expect(find.byIcon(Icons.visibility), findsNothing);
              expect(find.byType(Navigator), findsOneWidget);
              expect(find.byType(DetailsPage), findsNothing);
              expect(find.byType(CoinBalanceDetail), findsNothing);
              expect(find.byType(Padding), findsNWidgets(0));
              expect(find.byType(Icon), findsNWidgets(0));
              expect(find.byType(CoinList), findsNothing);
              expect(find.byType(CoinImage), findsNothing);
              expect(find.byType(CoinTitle), findsNothing);
              expect(find.byType(Container), findsNothing);
              expect(find.byType(SafeArea), findsNothing);
              expect(find.byType(Row), findsNothing);
              expect(find.byType(Column), findsNothing);
              expect(find.byType(CoreString), findsNothing);
              expect(find.byType(CoinTicker), findsNothing);
              expect(find.byType(CoinPrice), findsNothing);
              expect(find.byType(NetworkImage), findsNothing);
              expect(find.byType(MediaQuery), findsNWidgets(2));
              expect(find.byType(NumberFormat), findsNothing);
            },
          );
        },
      );
    },
  );
}
