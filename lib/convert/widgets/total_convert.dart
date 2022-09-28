import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/convert_provider.dart';

class TotalConvert extends HookConsumerWidget {
  const TotalConvert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final convertController = ref.watch(convertControllerProvider);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.010,
      ),
      height: size.height * 0.1,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Total estimado',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 117, 118, 128),
                  ),
                ),
              ),
              Text(
                convertController.getConvertValue(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 47, 51),
                  fontSize: 19,
                ),
              )
            ],
          ),
          FloatingActionButton(
            elevation: 5,
            backgroundColor: convertController.isValidConversion
                ? const Color.fromARGB(255, 244, 43, 87)
                : const Color.fromARGB(255, 150, 150, 150),
            onPressed: () {},
            child: const Icon(
              Icons.arrow_forward,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
