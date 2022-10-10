import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../l10n/app.dart';

class BodyCompletion extends StatelessWidget {
  const BodyCompletion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 214, 255, 223),
            radius: 32,
            child: Icon(
              Icons.check,
              color: Color.fromARGB(255, 12, 95, 44),
              size: 30,
            ),
          ),
          SizedBox(height: 15),
          AutoSizeText(
            'Conversão efetuada',
            maxLines: 1,
            style: TextStyle(
              color: Color.fromARGB(255, 47, 47, 51),
              fontSize: 38,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          AutoSizeText(
            'Conversão de moeda efetuada com sucesso!',
            maxLines: 1,
            style: TextStyle(
              color: Color.fromARGB(255, 117, 118, 128),
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
