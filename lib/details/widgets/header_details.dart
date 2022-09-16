import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/assets.dart';

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bitcoin',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Text(
                  'BTC',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 117, 118, 128)),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.width * 0.12,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imgBitcoin),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: sizeHeight * 0.05),
        SizedBox(
          width: sizeWidth * 0.6,
          child: AutoSizeText(
            'R\$ ${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2, name: "").format(100745)}',
            style: TextStyle(
              fontSize: sizeHeight * 0.08,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
