import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../shared/utils/provider.dart';

class CoinItem extends HookConsumerWidget {
  final double currentPrice;
  final double variation;
  final String nameCoin;
  final String initialsCoin;
  final String? iconCoin;
  final Color iconCoinColor;
  final double sizeIcon;

  const CoinItem(
      {required this.currentPrice,
      required this.variation,
      required this.sizeIcon,
      required this.nameCoin,
      required this.initialsCoin,
      this.iconCoin,
      required this.iconCoinColor,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visible.state);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;
    return Container(
      width: sizeWidth,
      height: sizeHeight * 0.2,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(255, 227, 228, 235),
            width: sizeHeight * 0.004,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.03),
                child: CircleAvatar(
                  backgroundColor: iconCoinColor,
                  maxRadius: sizeHeight * 0.07,
                  child: Image.asset(
                    iconCoin!,
                    height: sizeIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(initialsCoin),
                  SizedBox(height: sizeHeight * 0.01),
                  Text(
                    nameCoin,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 117, 118, 128),
                      fontSize: sizeHeight * 0.03,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: sizeWidth * 0.03),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    !visibility.state
                        ? Container(
                            alignment: Alignment.centerRight,
                            width: sizeWidth * 0.3,
                            child: AutoSizeText(
                              'R\$ ${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2, name: "").format(currentPrice)}',
                              style: TextStyle(
                                fontSize: sizeHeight * 0.045,
                              ),
                              maxLines: 1,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(49, 138, 137, 137),
                            ),
                            height: sizeHeight * 0.05,
                            width: sizeWidth * 0.3,
                          ),
                    SizedBox(height: sizeHeight * 0.01),
                    !visibility.state
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                variation.toString(),
                                style: TextStyle(
                                  fontSize: sizeHeight * 0.03,
                                  color:
                                      const Color.fromARGB(255, 117, 118, 128),
                                ),
                              ),
                              Text(
                                ' $initialsCoin',
                                style: TextStyle(
                                  fontSize: sizeHeight * 0.03,
                                  color:
                                      const Color.fromARGB(255, 117, 118, 128),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(49, 138, 137, 137),
                            ),
                            height: sizeHeight * 0.04,
                            width: sizeWidth * 0.15,
                          ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: sizeHeight * 0.01,
                  right: sizeWidth * 0.05,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: const Color.fromARGB(255, 117, 118, 128),
                  size: sizeHeight * 0.03,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
