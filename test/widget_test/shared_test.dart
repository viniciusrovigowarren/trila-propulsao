import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:trilha_propulsao/details/view/details.dart';
import 'package:trilha_propulsao/portifolio/view/portifolio_page.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_balance_detail.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_image.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_list.dart';
import 'package:trilha_propulsao/portifolio/widgets/coin_title.dart';
import 'package:trilha_propulsao/shared/widgets/botton_navigation_bar.dart';

import '../helpers/mock.dart';
import '../helpers/setup_widgets.dart';

void main() {
  DataFake data = DataFake();
  group(
    'Shared widgets tests',
    () {
      testWidgets(
          'WHEN a crypto is tapped THEN navigate to the next page and build',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          await loadDataPage(tester, const BottomNavBar());

          final inkwellMov = find.byKey(const Key('Inkwell movements'));
          expect(inkwellMov, findsNWidgets(1));
          expect(find.byType(Navigator), findsOneWidget);
          expect(find.byType(Size), findsNothing);
          expect(find.byType(Image), findsNWidgets(2));
          expect(find.byType(DetailsPage), findsNothing);
          expect(find.byType(CoinBalanceDetail), findsNothing);
          expect(find.byType(Padding), findsNWidgets(1));
          expect(find.byType(Icon), findsNothing);
          expect(find.byType(CoinList), findsNothing);
          expect(find.byType(CoinImage), findsNothing);
          expect(find.byType(CoinTitle), findsNothing);
          expect(find.byType(Container), findsNWidgets(1));

          await tester.tap(inkwellMov);
          expect(find.byWidget(const Navigator()), findsNWidgets(0));
        });
      });
      testWidgets('WHEN tap BottomNavButton THEN TransitionsPage call',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          await loadDataPage(tester, const BottomNavBar());

          final image = find.byType(Image);
          final text = find.byType(Text);
          final inkwellMovements = find.byKey(const Key('Inkwell movements'));
          final inkwellPortifolio = find.byKey(const Key('Inkwell portifolio'));
          final column = find.byType(Column);

          expect(image, findsNWidgets(2));
          expect(text, findsNWidgets(2));
          expect(column, findsNWidgets(2));
          await tester.tap(inkwellPortifolio);
          await tester.pumpAndSettle();
          expect(find.byType(BottomNavBar), findsNWidgets(1));
          await tester.tap(inkwellMovements);
          await tester.pumpAndSettle();
          expect(find.byType(BottomNavBar), findsNWidgets(1));
        });
      });
    },
  );
}
