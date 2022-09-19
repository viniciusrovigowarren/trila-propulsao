import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderDetails extends StatelessWidget {
  final double currentPrice;
  final String nameCoin;
  final String ticker;
  final String imgIcon;

  const HeaderDetails({
    Key? key,
    required this.currentPrice,
    required this.nameCoin,
    required this.ticker,
    required this.imgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameCoin,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ticker,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 117, 118, 128),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.width * 0.12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imgIcon),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.005),
        SizedBox(
          width: size.width * 0.6,
          child: AutoSizeText(
            NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                .format((currentPrice)),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: size.height * .045,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}
