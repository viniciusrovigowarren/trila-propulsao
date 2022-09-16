import 'package:flutter/material.dart';
import 'graphic_body.dart';
import 'time_frame.dart';

import 'button_convert_coin.dart';
import 'currency_information.dart';
import 'header_details.dart';

class BodyDetails extends StatelessWidget {
  const BodyDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: const [
          HeaderDetails(),
          GraphicBody(),
          TimeFrame(),
          CurrencyInformation(),
          ButtonConvertCoin()
        ],
      ),
    );
  }
}
