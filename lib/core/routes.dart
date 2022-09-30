import '../completion/view/completion_page.dart';
import '../completion/widgets/animated_transition.dart';
import '../convert/view/conversion_page.dart';
import '../details/view/details.dart';
import '../movements/views/movements_page.dart';
import '../portifolio/view/portifolio_page.dart';
import '../review/view/review_page.dart';

var appRoutes = {
  PortifolioPage.routeName: (context) => const PortifolioPage(),
  MovementsPage.routeName: (context) => const MovementsPage(),
  DetailsPage.routeName: (context) => const DetailsPage(),
  ConversionPage.routeName: (context) => const ConversionPage(),
  ReviewPage.routeName: (context) => const ReviewPage(),
  CompletionPage.routeName: (context) => CompletionPage(),
  AnimatedTransition.routeName: (context) => const AnimatedTransition(),
};
