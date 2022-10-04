import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../l10n/app.dart';
import '../../shared/utils/assets.dart';
import '../../completion/view/completion_page.dart';
import '../../convert/provider/convert_provider.dart';
import '../../transactions/provider/transactions_provider.dart';
import 'line_details_conversion.dart';
import 'title_conversion.dart';

class BodyReview extends StatefulHookConsumerWidget {
  const BodyReview({Key? key}) : super(key: key);

  @override
  BodyReviewState createState() => BodyReviewState();
}

class BodyReviewState extends ConsumerState<BodyReview>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final RoundedLoadingButtonController controller =
        RoundedLoadingButtonController();
    final convertController = ref.watch(convertControllerProvider);
    final movementControler = ref.watch(transactionsControllerProvider);

    Future<void> convertionSucess() async {
      movementControler.newTransation(convertController);
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushNamed(context, CompletionPage.routeName);
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitleConversion(),
        SizedBox(
          child: Column(
            children: [
              LineDetailsConversion(
                label: CoreString.of(context)!.convert,
                value: convertController.formatedConvert(),
              ),
              LineDetailsConversion(
                label: CoreString.of(context)!.receive,
                value: convertController.formatReceive(),
              ),
              LineDetailsConversion(
                label: CoreString.of(context)!.exc,
                value: convertController.formatExchange(),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: RoundedLoadingButton(
                  duration: const Duration(milliseconds: 200),
                  borderRadius: 15,
                  color: colorMagenta,
                  height: size.height * 0.08,
                  controller: controller,
                  onPressed: convertionSucess,
                  child: Text(CoreString.of(context)!.comp),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
