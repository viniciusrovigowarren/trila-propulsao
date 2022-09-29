import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleConversion extends StatelessWidget {
  const TitleConversion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: AutoSizeText(
        maxLines: 2,
        'Revise os dados da sua conversão',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
