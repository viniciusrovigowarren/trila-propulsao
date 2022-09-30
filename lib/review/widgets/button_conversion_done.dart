import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../completion/view/completion_page.dart';
import '../../completion/widgets/animated_transition.dart';
import '../../shared/utils/assets.dart';

class ButtonConversionDone extends HookConsumerWidget {
  const ButtonConversionDone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: MaterialButton(
        color: colorMagenta,
        minWidth: size.width * 0.9,
        elevation: 2,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          Navigator.pushNamed(context, CompletionPage.routeName);
        },
        child: const AnimatedTransition(),
      ),
    );
  }
}
