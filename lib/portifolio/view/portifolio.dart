import 'package:flutter/material.dart';

import '../../shared/widgets/botton_navigation_bar.dart';
import '../widgets/portfolio_body.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({Key? key}) : super(key: key);

  static const routeName = '/portifolio-page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyPortfolio(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
