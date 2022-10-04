import '../completion/view/completion_page.dart';
import '../completion/widgets/animated_transition.dart';
import '../convert/view/conversion_page.dart';
import '../details/view/details.dart';
import '../portifolio/view/portifolio_page.dart';
import '../review/view/review_page.dart';
import '../transactions/view/transactions_page.dart';

var appRoutes = {
  PortifolioPage.routeName: (context) => const PortifolioPage(),
  TransitionsPage.routeName: (context) => const TransitionsPage(),
  DetailsPage.routeName: (context) => const DetailsPage(),
  ConversionPage.routeName: (context) => const ConversionPage(),
  ReviewPage.routeName: (context) => const ReviewPage(),
  CompletionPage.routeName: (context) => const CompletionPage(),
  AnimatedTransition.routeName: (context) => const AnimatedTransition(),
};
