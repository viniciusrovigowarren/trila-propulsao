import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopPageWalletEye extends StatefulWidget {
  final double totalBalance;
  const TopPageWalletEye({
    Key? key,
    required this.totalBalance,
  }) : super(key: key);

  @override
  State<TopPageWalletEye> createState() => _TopPageWalletEyeState();
}

class _TopPageWalletEyeState extends State<TopPageWalletEye> {
  bool visibility = false;

  void hide() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Carteira',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: hide,
                icon: const Icon(
                  Icons.visibility,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
          child: Row(
            children: [
              const Text(
                'US ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              visibility == false
                  ? Text(
                      NumberFormat.simpleCurrency(
                              locale: 'en_US', decimalDigits: 2)
                          .format(widget.totalBalance),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(49, 138, 137, 137),
                      ),
                      height: sizeHeight * 0.08,
                      width: sizeWidth * 0.5,
                    ),
            ],
          ),
        ),
        SizedBox(height: sizeHeight * 0.2),
      ],
    );
  }
}
