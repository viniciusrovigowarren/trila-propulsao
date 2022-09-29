import '../convert/view/conversion_page.dart';
import '../details/view/details.dart';
import '../movements/movements_page.dart';
import '../portifolio/view/portifolio_page.dart';

var appRoutes = {
  PortifolioPage.routeName: (context) => const PortifolioPage(),
  MovementsPage.routeName: (context) => const MovementsPage(),
  DetailsPage.routeName: (context) => const DetailsPage(),
  ConversionPage.routeName: (context) => const ConversionPage(),
};
