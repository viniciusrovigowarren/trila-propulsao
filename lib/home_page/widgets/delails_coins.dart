import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsCoins extends StatefulWidget {
  final double currentPrice;
  final double variation;
  final String nameCoin;
  final String initialsCoin;
  final String? iconCoin;

  const DetailsCoins({
    Key? key,
    required this.currentPrice,
    required this.variation,
    required this.nameCoin,
    required this.initialsCoin,
    this.iconCoin,
  }) : super(key: key);

  @override
  State<DetailsCoins> createState() => _DetailsCoinsState();
}

class _DetailsCoinsState extends State<DetailsCoins> {
  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.black,
                  maxRadius: sizeHeight * 0.07,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.initialsCoin),
                  SizedBox(height: sizeHeight * 0.01),
                  Text(
                    widget.nameCoin,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 117, 118, 128),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: sizeWidth * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text(
                      'US ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: 'en_US', decimalDigits: 2)
                          .format(widget.currentPrice),
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeHeight * 0.01),
                Container(
                  height: sizeHeight * 0.05,
                  width: sizeWidth * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.variation > 0
                        ? const Color.fromARGB(178, 214, 255, 223)
                        : const Color.fromARGB(255, 255, 201, 201),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: widget.variation > 0,
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 12,
                            color: widget.variation > 0
                                ? const Color.fromARGB(255, 12, 95, 44)
                                : const Color.fromARGB(255, 154, 20, 20),
                          ),
                        ),
                      ),
                      Text(
                        widget.variation.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: widget.variation > 0
                              ? const Color.fromARGB(255, 12, 95, 44)
                              : const Color.fromARGB(255, 154, 20, 20),
                        ),
                      ),
                      Text(
                        '%',
                        style: TextStyle(
                          fontSize: 12,
                          color: widget.variation > 0
                              ? const Color.fromARGB(255, 12, 95, 44)
                              : const Color.fromARGB(255, 154, 20, 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
