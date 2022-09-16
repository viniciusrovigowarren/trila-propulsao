import 'package:flutter/material.dart';
import '../../shared/widgets/app_bar_pattern.dart';
import '../widgets/details_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  static const route = '/details-page';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBarPattern(
          title: 'Detalhes',
        ),
        body: SingleChildScrollView(child: BodyDetails()),
      ),
    );
  }
}
