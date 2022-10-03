import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../completion/view/completion_page.dart';
import '../../completion/widgets/animated_transition.dart';
import '../../convert/provider/convert_provider.dart';
import '../../transactions/provider/transactions_provider.dart';
import '../../shared/utils/assets.dart';

class ButtonConversionDone extends StatefulHookConsumerWidget {
  const ButtonConversionDone({super.key});

  @override
  ButtonConversionDoneState createState() => ButtonConversionDoneState();
}

class ButtonConversionDoneState extends ConsumerState<ButtonConversionDone> {
  bool btnConverIsPressed = false;

  @override
  Widget build(BuildContext context) {
    final convertController = ref.watch(convertControllerProvider);
    final movementControler = ref.watch(transactionsControllerProvider);
    final size = MediaQuery.of(context).size;

    Future<void> confirmConvertion() async {
      movementControler.newTransation(convertController);
      setState(() {
        btnConverIsPressed = true;
      });
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.pushNamed(context, CompletionPage.routeName);
      });
    }

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
        onPressed: confirmConvertion,
        child: const AnimatedTransition(),
      ),
    );
  }
}
