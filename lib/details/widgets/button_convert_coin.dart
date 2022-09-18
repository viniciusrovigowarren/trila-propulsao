import 'package:flutter/material.dart';

class ButtonConvertCoin extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonConvertCoin({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialButton(
      color: const Color.fromARGB(255, 224, 43, 87),
      minWidth: size.width,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      child: const Text(
        'Converter moeda',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
