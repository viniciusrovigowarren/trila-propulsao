import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QtdCoin extends StatelessWidget {
  final double priceCUrrency;
  final String initialsCoin;
  const QtdCoin({
    Key? key,
    required this.priceCUrrency,
    required this.initialsCoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(255, 227, 228, 235),
            width: sizeHeight * 0.002,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quantidade',
              style: TextStyle(
                fontSize: 19,
                color: Color.fromARGB(255, 117, 118, 128),
              ),
            ),
            SizedBox(
              width: sizeWidth * 0.45,
              child: AutoSizeText(
                textAlign: TextAlign.end,
                '${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 8, name: "").format(priceCUrrency)} ${initialsCoin}',
                style: const TextStyle(
                  fontSize: 19,
                  color: Color.fromARGB(255, 47, 47, 51),
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
