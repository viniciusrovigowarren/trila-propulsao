import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:trilha_propulsao/completion/view/completion_page.dart';
import 'package:trilha_propulsao/completion/widgets/animated_transition.dart';
import 'package:trilha_propulsao/completion/widgets/body_completion.dart';
import 'package:trilha_propulsao/convert/view/conversion_page.dart';
import 'package:trilha_propulsao/details/view/details.dart';
import 'package:trilha_propulsao/details/widgets/detail_header.dart';
import 'package:trilha_propulsao/l10n/app.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_balance_detail.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_image.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_list.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_title.dart';

import '../helpers/setup_widgets.dart';

void main() {
  group('Completion page tests', () {
    testWidgets('WHEN started text page THEN balance build',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(tester, const BodyCompletion());

        expect(find.byType(AutoSizeText), findsAtLeastNWidgets(2));
        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
        expect(find.byType(AutoSizeText), findsWidgets);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
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
        expect(find.byType(Icon), findsNWidgets(1));
        expect(find.byType(CoinList), findsNothing);
        expect(find.byType(CoinImage), findsNothing);
        expect(find.byType(CoinTitle), findsNothing);
        expect(find.byType(Container), findsNWidgets(1));
        expect(find.byType(SafeArea), findsNothing);
        expect(find.byType(Row), findsNothing);
        expect(find.byType(Column), findsNWidgets(1));
        expect(find.byType(Text), findsNWidgets(2));
        expect(find.byType(CoreString), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byType(NetworkImage), findsNothing);
        expect(find.byType(MediaQuery), findsNWidgets(3));
        expect(find.byType(NumberFormat), findsNothing);
      });
    });
    testWidgets('WHEN started sucess page THEN build completion page',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(tester, const CompletionPage());

        expect(find.byType(BodyCompletion), findsOneWidget);
        expect(find.byType(AutoSizeText), findsAtLeastNWidgets(2));
        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(AutoSizeText), findsWidgets);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
        expect(find.byType(Row), findsNothing);
        expect(find.byType(BoxDecoration), findsNothing);
        expect(find.byType(CoinTitleDetail), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byIcon(Icons.visibility), findsNothing);
        expect(find.byType(Navigator), findsOneWidget);
        expect(find.byType(DetailsPage), findsNothing);
        expect(find.byType(CoinBalanceDetail), findsNothing);
        expect(find.byType(Padding), findsNWidgets(1));
        expect(find.byType(Icon), findsNWidgets(2));
        expect(find.byType(CoinList), findsNothing);
        expect(find.byType(CoinImage), findsNothing);
        expect(find.byType(CoinTitle), findsNothing);
        expect(find.byType(Container), findsNWidgets(1));
        expect(find.byType(SafeArea), findsNWidgets(1));
        expect(find.byType(Row), findsNothing);
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(Text), findsNWidgets(2));
        expect(find.byType(CoreString), findsNothing);
        expect(find.byType(CoinTicker), findsNothing);
        expect(find.byType(CoinPrice), findsNothing);
        expect(find.byType(NetworkImage), findsNothing);
        expect(find.byType(MediaQuery), findsNWidgets(7));
        expect(find.byType(NumberFormat), findsNothing);
        await tester.tap(find.byType(GestureDetector));
        expect(find.byType(BodyCompletion), findsNWidgets(1));
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(Center), findsNWidgets(4));
        expect(find.byType(CircleAvatar), findsOneWidget);
      });
    });
    testWidgets('WHEN started sucess page THEN build completion page',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadDataPage(tester, const AnimatedTransition());

        expect(find.byType(Duration), findsNothing);
        expect(find.byType(Navigator), findsAtLeastNWidgets(1));
        expect(find.byType(AnimatingRoute), findsNothing);
        expect(find.byType(ConversionPage), findsNothing);
        expect(find.byType(Timer), findsNothing);
        expect(find.byType(InkWell), findsAtLeastNWidgets(1));
        expect(find.byType(Stack), findsAtLeastNWidgets(1));
        expect(find.byType(AnimatedBuilder), findsAtLeastNWidgets(6));
        expect(find.byType(Text), findsAtLeastNWidgets(1));
        expect(find.byType(Animation), findsNothing);
        await tester.tap(find.byType(InkWell));
        expect(find.byType(BodyCompletion), findsNWidgets(0));
      });
    });
  });
}
