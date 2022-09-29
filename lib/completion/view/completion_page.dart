import 'package:flutter/material.dart';
import 'package:trilha_propulsao/portifolio/view/portifolio_page.dart';

import '../widgets/body_completion.dart';

class CompletionPage extends StatelessWidget {
  const CompletionPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/completion-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PortifolioPage.routeName);
          },
          child: Icon(Icons.close),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BodyCompletion(),
    );
  }
}
