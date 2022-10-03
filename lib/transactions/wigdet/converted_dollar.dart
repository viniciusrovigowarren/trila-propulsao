import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ConvertedDollar extends StatelessWidget {
  final String convertedValue;

  const ConvertedDollar({
    Key? key,
    required this.convertedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoSizeText(
      maxLines: 1,
      convertedValue,
      style: TextStyle(
        fontFamily: "Mansny-regular",
        color: const Color.fromARGB(255, 117, 118, 128),
        fontSize: size.height * .02,
      ),
    );
  }
}
