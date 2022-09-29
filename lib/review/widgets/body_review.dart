import 'package:flutter/material.dart';

import 'package:trilha_propulsao/review/widgets/title_conversion.dart';

import 'button_conversion_done.dart';
import 'line_details_conversion.dart';

class BodyReview extends StatelessWidget {
  const BodyReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitleConversion(),
        SizedBox(
          child: Column(
            children: const [
              LineDetailsConversion(label: 'Converter', value: '0.0008222 BTC'),
              LineDetailsConversion(label: 'Receber', value: '0.0097 ETH'),
              LineDetailsConversion(
                  label: 'Câmbio', value: '1 BTC = 11.77 ETH'),
              SizedBox(height: 15),
              ButtonConversionDone(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ],
    );
  }
}
