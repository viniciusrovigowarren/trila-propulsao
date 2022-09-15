import 'package:flutter/material.dart';

import '../widgets/body_portifolio.dart';
import '../../shared/widgets/botton_navigation_bar.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyPortifolioPage(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
