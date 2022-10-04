import 'package:flutter/material.dart';

import '../../l10n/app.dart';
import '../widgets/body_convert.dart';

class ConversionPage extends StatelessWidget {
  const ConversionPage({Key? key}) : super(key: key);
  static const routeName = '/convert-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(CoreString.of(context)!.convert),
      ),
      body: const BodyConvert(),
    );
  }
}
