import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/convert_provider.dart';
import 'bottom_coin_list.dart';

class ConvertCoinContainer extends HookConsumerWidget {
  const ConvertCoinContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final allCoinsController = ref.watch(allCoinsControllerProvider);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          builder: (BuildContext context) {
            return const BottomCoinList();
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.28,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 227, 228, 235),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        height: size.height * 0.043,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.06,
              height: MediaQuery.of(context).size.width * 0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    allCoinsController.coinToConvert.image!.small,
                  ),
                ),
              ),
            ),
            AutoSizeText(
              allCoinsController.coinToConvert.symbol,
              maxLines: 1,
              style: const TextStyle(
                fontFamily: "Mansny-regular",
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}
