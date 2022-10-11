import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:trilha_propulsao/convert/controller/convert_controller.dart';
import 'package:trilha_propulsao/convert/view/conversion_page.dart';
import 'package:trilha_propulsao/convert/widgets/current_coin.dart';
import 'package:trilha_propulsao/details/view/details.dart';
import 'package:trilha_propulsao/details/widgets/detail_description.dart';
import 'package:trilha_propulsao/details/widgets/detail_header.dart';
import 'package:trilha_propulsao/l10n/app.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_balance_detail.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_image.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_list.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_title.dart';

import '../helpers/mock.dart';
import '../helpers/setup_widgets.dart';

void main() {
  DataFake data = DataFake();
  group('Convert page tests', () {
    testWidgets('WHEN started current coin THEN build layout crypto ',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(
          tester,
          CurrentCoin(model: data.getCoinViewData()),
        );

        expect(find.byType(AutoSizeText), findsOneWidget);
        expect(find.byType(Container), findsAtLeastNWidgets(2));
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(BoxDecoration), findsNothing);
        expect(find.byType(CoinTitleDetail), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byIcon(Icons.visibility), findsNothing);
        expect(find.byType(Navigator), findsOneWidget);
        expect(find.byType(DetailsPage), findsNothing);
        expect(find.byType(CoinBalanceDetail), findsNothing);
        expect(find.byType(Padding), findsNWidgets(1));
        expect(find.byType(Icon), findsOneWidget);
        expect(find.byType(CoinList), findsNothing);
        expect(find.byType(CoinImage), findsNothing);
        expect(find.byType(CoinTitle), findsNothing);
        expect(find.byType(Container), findsNWidgets(2));
        expect(find.byType(SafeArea), findsNothing);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(Column), findsNothing);
        expect(find.byType(Text), findsOneWidget);
        expect(find.byType(CoreString), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byType(NetworkImage), findsNothing);
        expect(find.byType(MediaQuery), findsNWidgets(2));
        expect(find.byType(NumberFormat), findsNothing);
      });
    });

    testWidgets(
        'WHEN  currency variation value initialize THEN build convert button components',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(
            tester,
            CurrencyVariationValue(
              description: faker.lorem.toString(),
              value: faker.lorem.toString(),
            ));
        expect(find.byType(AutoSizeText), findsWidgets);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(BoxDecoration), findsNothing);
        expect(find.byType(CoinTitleDetail), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byIcon(Icons.visibility), findsNothing);
        expect(find.byType(Navigator), findsOneWidget);
        expect(find.byType(DetailsPage), findsNothing);
        expect(find.byType(CoinBalanceDetail), findsNothing);
        expect(find.byType(Padding), findsNWidgets(3));
        expect(find.byType(Icon), findsNWidgets(0));
        expect(find.byType(CoinList), findsNothing);
        expect(find.byType(CoinImage), findsNothing);
        expect(find.byType(CoinTitle), findsNothing);
        expect(find.byType(Container), findsNWidgets(1));
        expect(find.byType(SafeArea), findsNothing);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(Column), findsNothing);
        expect(find.byType(Text), findsNWidgets(2));
        expect(find.byType(CoreString), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byType(NetworkImage), findsNothing);
        expect(find.byType(MediaQuery), findsNWidgets(2));
        expect(find.byType(NumberFormat), findsNothing);
      });
    });
  });
}
