import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../l10n/app.dart';

class TitleConversion extends StatelessWidget {
  const TitleConversion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: AutoSizeText(
        maxLines: 2,
        CoreString.of(context)!.review,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
