import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../movements/views/movements_page.dart';
import '../../portifolio/view/portifolio_page.dart';
import '../provider/providers_shared.dart';
import '../utils/assets.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final pageIndex = ref.watch(pageIndexProvider.state);
    return Container(
      height: size.height * .08,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(255, 227, 228, 235),
            width: size.height * 0.002,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              pageIndex.state != 1
                  ? Navigator.pushReplacementNamed(
                      context, PortifolioPage.routeName)
                  : null;
              pageIndex.state = 1;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  height: size.height * 0.03,
                  image: AssetImage((pageIndex.state == 0)
                      ? imgLogoWarrenGray
                      : imgLogoWarrenMagenta),
                  fit: BoxFit.cover,
                ),
                Text(
                  'Portfólio',
                  style: TextStyle(
                    fontSize: (pageIndex.state == 0)
                        ? size.width * 0.025
                        : size.width * 0.03,
                    color: (pageIndex.state == 0)
                        ? const Color.fromARGB(255, 149, 153, 166)
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pageIndex.state != 0
                  ? Navigator.pushReplacementNamed(
                      context, MovementsPage.routeName)
                  : null;
              pageIndex.state = 0;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  height: size.height * 0.03,
                  image: AssetImage((pageIndex.state == 1)
                      ? imgMovementsGray
                      : imgMovementsMagenta),
                  fit: BoxFit.cover,
                ),
                Text(
                  'Movimentações',
                  style: TextStyle(
                    fontSize: (pageIndex.state == 1)
                        ? size.width * 0.025
                        : size.width * 0.03,
                    color: (pageIndex.state == 1)
                        ? const Color.fromARGB(255, 149, 153, 166)
                        : Colors.black,
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
