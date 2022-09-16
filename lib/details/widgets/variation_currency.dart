import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VariationCurrency extends StatelessWidget {
  final double variationCurrency;
  const VariationCurrency({
    Key? key,
    required this.variationCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String value = (NumberFormat.simpleCurrency(
            locale: 'pt_BR', decimalDigits: 2, name: "")
        .format(variationCurrency));

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
              'Variação 24H',
              style: TextStyle(
                fontSize: 19,
                color: Color.fromARGB(255, 117, 118, 128),
              ),
            ),
            SizedBox(
              width: sizeWidth * 0.35,
              child: AutoSizeText(
                textAlign: TextAlign.end,
                '$value%',
                style: TextStyle(
                    fontSize: 19,
                    color: (value[0] == '-')
                        ? const Color.fromARGB(255, 205, 26, 26)
                        : const Color.fromARGB(255, 5, 100, 48),
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
