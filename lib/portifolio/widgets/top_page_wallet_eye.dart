import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trilha_propulsao/core/assets.dart';

import '../../core/provider.dart';

class TopPageWalletEye extends HookConsumerWidget {
  final double totalBalance;
  const TopPageWalletEye({
    Key? key,
    required this.totalBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visible.state);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeWidth * 0.06,
        vertical: sizeHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cripto',
                style: TextStyle(
                  fontSize: sizeHeight * 0.09,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  color: colorMagenta,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => visibility.state = !visibility.state,
                icon: visibility.state == false
                    ? const Icon(
                        Icons.visibility,
                      )
                    : const Icon(
                        Icons.visibility_off,
                      ),
              ),
            ],
          ),
          !visibility.state
              ? SizedBox(
                  width: sizeWidth * 0.6,
                  child: AutoSizeText(
                    'R\$ ${NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2, name: "").format(totalBalance)}',
                    style: TextStyle(
                      fontSize: sizeHeight * 0.08,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(49, 138, 137, 137),
                  ),
                  height: sizeHeight * 0.08,
                  width: sizeWidth * 0.6,
                ),
          Text(
            'Ver total de moedas',
            style: TextStyle(
              fontSize: sizeHeight * 0.05,
              color: const Color.fromARGB(255, 117, 118, 128),
            ),
          ),
          SizedBox(height: sizeHeight * 0.1),
        ],
      ),
    );
  }
}
