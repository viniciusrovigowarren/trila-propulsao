import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app.dart';
import '../../portifolio/model/coin_view_data.dart';
import '../provider/convert_provider.dart';

class BottomCoinList extends StatefulHookConsumerWidget {
  const BottomCoinList({super.key});

  @override
  BottomCoinListState createState() => BottomCoinListState();
}

class BottomCoinListState extends ConsumerState<BottomCoinList> {
  late List<CoinViewData> filterCoinList =
      ref.watch(allCoinsControllerProvider).coins;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    final convertController = ref.watch(convertControllerProvider);
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 75, 75, 75),
            blurRadius: 15,
          )
        ],
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
      ),
      height: size.height * 0.33,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.018),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 185, 186, 199),
              ),
              height: size.height * 0.009,
              width: size.width * .13,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: size.height * .02,
            ),
            child: Text(
              CoreString.of(context)!.pick,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color.fromARGB(255, 47, 47, 51),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterCoinList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(3),
                  onTap: () {
                    convertController.coinToConvert = filterCoinList[index];
                    convertController.notifyListeners();
                    allCoinsController.setCoinToConvert(filterCoinList[index]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 182, 182, 182),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(size.height * .015),
                      height: size.height * 0.10,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 227, 228, 235),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      filterCoinList[index].symbol,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 14,
                                    )
                                  ],
                                ),
                                Text(
                                  filterCoinList[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 117, 118, 128),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
