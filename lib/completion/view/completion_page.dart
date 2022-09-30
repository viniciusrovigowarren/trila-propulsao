import 'package:flutter/material.dart';

import '../../movements/movements_page.dart';
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
            Navigator.pushNamed(context, MovementsPage.routeName);
          },
          child: const Icon(Icons.close),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const BodyCompletion(),
    );
  }
}
