import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
              children: [
                Text(
                  nameCoin,
                  style: const TextStyle(
                      fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Text(
                  ticker,
                  style: const TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 117, 118, 128)),
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
        SizedBox(height: sizeHeight * 0.03),
        SizedBox(
          width: sizeWidth * 0.6,
          child: AutoSizeText(
            'R\$ $currentPrice',
            style: TextStyle(
              fontSize: sizeHeight * 0.08,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
          ),
        ),
        SizedBox(height: sizeHeight * 0.02),
      ],
    );
  }
}
