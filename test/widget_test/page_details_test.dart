import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:trilha_propulsao/details/view/details.dart';
import 'package:trilha_propulsao/details/widgets/detail_description.dart';
import 'package:trilha_propulsao/details/widgets/detail_header.dart';
import 'package:trilha_propulsao/details/widgets/period_button.dart';
import 'package:trilha_propulsao/l10n/app.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_balance_detail.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_image.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_item.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_list.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_title.dart';
import 'package:trilha_propulsao/portifolio/widgets/loading_wallet.dart';
import 'package:trilha_propulsao/portifolio/widgets/success_loading_body.dart';
import '../helpers/mock.dart';
import '../helpers/setup_widgets.dart';

void main() {
  DataFake data = DataFake();
  group('Details page tests', () {
    testWidgets(
      'WHEN details page started THEN build widgets title',
      (WidgetTester tester) async {
        mockNetworkImagesFor(
          () async {
            await loadDataPage(
              tester,
              DetailsHeader(
                model: data.getWalletViewData(),
              ),
            );
            expect(find.byType(CoinTitleDetail), findsOneWidget);
            expect(find.byType(CoinTicker), findsOneWidget);
            expect(find.byType(CoinPrice), findsOneWidget);
            expect(find.byIcon(Icons.visibility), findsNothing);
            expect(find.byType(Navigator), findsOneWidget);
            expect(find.byType(DetailsPage), findsNothing);
            expect(find.byType(CoinBalanceDetail), findsNothing);
            expect(find.byType(Padding), findsNWidgets(2));
            expect(find.byType(Icon), findsNothing);
            expect(find.byType(CoinList), findsNothing);
            expect(find.byType(CoinImage), findsNothing);
            expect(find.byType(CoinTitle), findsNothing);
            expect(find.byType(Container), findsOneWidget);
            expect(find.byType(SafeArea), findsNothing);
            expect(find.byType(Row), findsOneWidget);
            expect(find.byType(Column), findsOneWidget);
            expect(find.byType(Text), findsNWidgets(3));
            expect(find.byType(CoreString), findsNothing);
            expect(find.byType(CoinTicker), findsOneWidget);
            expect(find.byType(CoinPrice), findsOneWidget);
            expect(find.byType(NetworkImage), findsNothing);
            expect(find.byType(MediaQuery), findsNWidgets(2));
            expect(find.byType(NumberFormat), findsNothing);
          },
        );
      },
    );

    testWidgets(
      'WHEN started period button THEN build components ',
      (WidgetTester tester) async {
        mockNetworkImagesFor(
          () async {
            await loadDataPage(
              tester,
              const PeriodButton(
                period: 5,
              ),
            );
            expect(find.byType(CoinTitleDetail), findsNothing);
            expect(find.byType(NumberFormat), findsNothing);
            expect(find.byType(CoinTicker), findsNothing);
            expect(find.byType(CoinPrice), findsNothing);
            expect(find.byIcon(Icons.visibility), findsNothing);
            expect(find.byType(Navigator), findsOneWidget);
            expect(find.byType(CoinList), findsNothing);
            expect(find.byType(CoinBalanceDetail), findsNothing);
            expect(find.byType(Padding), findsNWidgets(2));
            expect(find.byType(Icon), findsNothing);
            expect(find.byType(SizedBox), findsOneWidget);
            expect(find.byType(CoinImage), findsNothing);
            expect(find.byType(CoinTitle), findsNothing);
            expect(find.byType(Container), findsOneWidget);
            expect(find.byType(SafeArea), findsNothing);
            expect(find.byType(Row), findsNothing);
            expect(find.byType(Column), findsNothing);
            expect(find.byType(Text), findsNWidgets(1));
            expect(find.byType(CoreString), findsNothing);
            expect(find.byType(CoinTicker), findsNothing);
            expect(find.byType(CoinPrice), findsNothing);
            expect(find.byType(NetworkImage), findsNothing);
            expect(find.byType(MediaQuery), findsNWidgets(2));
            expect(find.byType(DetailsPage), findsNothing);
            expect(find.byType(MaterialButton), findsOneWidget);
            expect(find.byType(Padding), findsWidgets);

            expect(find.byType(AutoSizeText), findsOneWidget);
            await tester.press(find.byType(MaterialButton));
            await tester.pumpAndSettle();
          },
        );
      },
    );
    testWidgets('WHEN intialize CoinList THEN build CoinList widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(tester, const CoinList());

        final coinItem = find.byType(CoinItem);
        final listview = find.byWidget(ListView());

        expect(coinItem, findsNothing);
        expect(listview, findsNothing);
        expect(find.byType(CoinTitleDetail), findsNothing);
        expect(find.byType(NumberFormat), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byIcon(Icons.visibility), findsNothing);
        expect(find.byType(Navigator), findsOneWidget);
        expect(find.byType(CoinList), findsNWidgets(1));
        expect(find.byType(CoinBalanceDetail), findsNothing);
        expect(find.byType(Padding), findsNWidgets(0));
        expect(find.byType(Icon), findsNothing);
        expect(find.byType(SizedBox), findsNWidgets(0));
        expect(find.byType(CoinImage), findsNothing);
        expect(find.byType(CoinTitle), findsNothing);
      });
    });
    testWidgets(
      'WHEN detail coin initialize THEN build texts ',
      (WidgetTester tester) async {
        mockNetworkImagesFor(
          () async {
            await loadDataPage(
              tester,
              DetailCoinValue(
                description: faker.lorem.toString(),
                value: faker.currency.toString(),
              ),
            );
            expect(
              find.byType(Text),
              findsAtLeastNWidgets(2),
            );
          },
        );
      },
    );
    testWidgets('WHEN visibility IconButton tap THEN wallet balance hide',
        (WidgetTester tester) async {
      await loadDataPage(tester, const SuccessLoadingBody());
      final totalBalance = find.byType(AutoSizeText);

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(totalBalance, findsNothing);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(totalBalance, findsOneWidget);
    });

    // testWidgets(
    //   'WHE title',
    //   (WidgetTester tester) async {
    //     mockNetworkImagesFor(
    //       () async {
    //         await loadDataPage(tester, const Loading());
    //         final totalBalance = find.byType(AutoSizeText);

    //         expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    //         expect(find.byType(IconButton), findsOneWidget);
    //         expect(totalBalance, findsNothing);
    //         //await tester.tap(find.byType(IconButton));
    //         //await tester.pumpAndSettle();
    //         expect(totalBalance, findsOneWidget);
    //       },
    //     );
    //   },
    // );
  });
}
