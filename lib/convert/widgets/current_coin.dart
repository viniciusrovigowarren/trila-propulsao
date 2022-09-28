import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../portifolio/model/coin_view_data.dart';

class CurrentCoin extends StatelessWidget {
  final CoinViewData model;

  const CurrentCoin({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
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
                image: NetworkImage(model.image!.small),
              ),
            ),
          ),
          AutoSizeText(
            model.symbol,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: "Mansny-regular",
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }
}
