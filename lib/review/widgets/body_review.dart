import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/provider/convert_provider.dart';
import 'button_conversion_done.dart';
import 'line_details_conversion.dart';
import 'title_conversion.dart';

class BodyReview extends StatefulHookConsumerWidget {
  const BodyReview({
    Key? key,
  }) : super(key: key);

  @override
  BodyReviewState createState() => BodyReviewState();
}

class BodyReviewState extends ConsumerState<BodyReview>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final convertController = ref.watch(convertControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitleConversion(),
        SizedBox(
          child: Column(
            children: [
              LineDetailsConversion(
                label: 'Converter',
                value: convertController.formatedConvert(),
              ),
              LineDetailsConversion(
                label: 'Receber',
                value: convertController.formatReceive(),
              ),
              LineDetailsConversion(
                label: 'Câmbio',
                value: convertController.formatExchange(),
              ),
              const ButtonConversionDone(),
            ],
          ),
        ),
      ],
    );
  }
}
