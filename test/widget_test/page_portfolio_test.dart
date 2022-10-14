import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:trilha_propulsao/completion/widgets/body_completion.dart';
import 'package:trilha_propulsao/details/view/details.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_balance_detail.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_image.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_item.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_list.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_title.dart';

import '../helpers/mock.dart';
import '../helpers/setup_widgets.dart';

void main() {
  DataFake data = DataFake();
  group('Portfolio page tests', () {
    testWidgets('WHEN the button is visible THEN the icon changes',
        (WidgetTester tester) async {
      await loadDataPage(tester, const CoinTitle());
      final visibilityIconData = find.byIcon(Icons.visibility);

      expect(find.text('Cripto'), findsOneWidget);
      expect(visibilityIconData, findsNothing);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(visibilityIconData, findsOneWidget);
      expect(find.byType(Navigator), findsOneWidget);
      expect(find.byType(DetailsPage), findsNothing);
      expect(find.byType(CoinBalanceDetail), findsNothing);
      expect(find.byType(Padding), findsNWidgets(2));
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byType(CoinList), findsNothing);
      expect(find.byType(CoinImage), findsNothing);
      expect(find.byType(CoinTitle), findsOneWidget);
      expect(find.byType(Container), findsNothing);
    });

    testWidgets(
        'WHEN a crypto is tapped THEN navigate to the next page and build',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(tester, CoinItem(model: data.getWalletViewData()));

        final gesture = find.byType(GestureDetector);
        expect(gesture, findsOneWidget);
        expect(find.byType(Navigator), findsOneWidget);
        expect(find.byType(DetailsPage), findsNothing);
        expect(find.byType(CoinBalanceDetail), findsOneWidget);
        expect(find.byType(Padding), findsNWidgets(3));
        expect(find.byType(Icon), findsOneWidget);
        expect(find.byType(CoinList), findsNothing);
        expect(find.byType(CoinImage), findsOneWidget);
        expect(find.byType(CoinTitle), findsNothing);
        expect(find.byType(Container), findsNWidgets(4));
      });
    });

    testWidgets('WHEN visibility IconButton tap THEN wallet balance hide',
        (WidgetTester tester) async {
      await loadDataPage(tester, const BodyCompletion());
      final totalBalance = find.byType(AutoSizeText);

      expect(find.byIcon(Icons.visibility_off), findsNothing);
      expect(find.byType(IconButton), findsNothing);
      expect(totalBalance, findsNWidgets(2));
    });
  });
}
