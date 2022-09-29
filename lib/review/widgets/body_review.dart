import 'package:flutter/material.dart';
import 'package:trilha_propulsao/review/widgets/title_conversion.dart';

import 'line_details_conversion.dart';

class BodyReview extends StatelessWidget {
  const BodyReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TitleConversion(),
        LineDetailsConversion(label: '', value: ''),
      ],
    );
  }
}
