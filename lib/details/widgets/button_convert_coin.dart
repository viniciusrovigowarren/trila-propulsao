import 'package:flutter/material.dart';

class ButtonConvertCoin extends StatelessWidget {
  const ButtonConvertCoin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: sizeWidth * 0.85,
      height: sizeHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 224, 43, 87),
      ),
      child: const Text(
        'Converter moeda',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}
