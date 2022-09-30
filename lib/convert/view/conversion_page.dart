import 'package:flutter/material.dart';

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
        title: const Text('Converter'),
      ),
      body: const BodyConvert(),
    );
  }
}
