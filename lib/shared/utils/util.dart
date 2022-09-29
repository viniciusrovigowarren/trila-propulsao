import 'package:decimal/decimal.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

Decimal pD(String source) => Decimal.parse(source);
double pS(Decimal source) => double.parse(source.toString());

class Util {
  static String getAllDays() {
    return (DateTime.now()
                .subtract(const Duration(days: 90))
                .millisecondsSinceEpoch /
            1000)
        .round()
        .toString();
  }

  static Color getContainerValueColor(bool visible) =>
      visible ? Colors.white : const Color.fromARGB(255, 161, 161, 161);

  static IconData getVisibilityIconData(bool visible) =>
      visible ? Icons.visibility : Icons.visibility_off;

  static Color getVariationColor(String variation) =>
      variation.trim()[0] == '-' ? Colors.red : Colors.green;

  static String getDTToTimestamp() {
    return (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
  }

  static TextInputMask getTextInputFormatter(double percentCoin) {
    String integerSpace = '';
    for (var i = 0; i < percentCoin.truncate().toString().length; i++) {
      integerSpace = integerSpace + 9.toString();
    }
    return TextInputMask(mask: ['$integerSpace.999999999999999999999']);
  }

  static String getFormatedPercentage(double percentage, String ticker) {
    return "${percentage.toString()} $ticker";
  }
}
