import 'package:flutter/material.dart';

class ConvertedCrypto extends StatelessWidget {
  final String cryptovalue;

  const ConvertedCrypto({
    Key? key,
    required this.cryptovalue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      cryptovalue,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: size.height * .021,
      ),
    );
  }
}
