import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/provider/providers_shared.dart';
import '../../transactions/view/transactions_page.dart';
import '../widgets/body_completion.dart';

class CompletionPage extends HookConsumerWidget {
  const CompletionPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/completion-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider.state);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            pageIndex.state = 0;
            Navigator.pushNamed(context, TransitionsPage.routeName);
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
