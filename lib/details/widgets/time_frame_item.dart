import 'package:flutter/material.dart';

class TimeFrameItem extends StatelessWidget {
  final int time;
  final bool itemSelected;

  const TimeFrameItem({
    Key? key,
    required this.time,
    required this.itemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 25,
      ),
      child: Container(
        alignment: Alignment.center,
        height: sizeHeight * 0.05,
        width: sizeWidth * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: itemSelected
              ? const Color.fromARGB(255, 200, 200, 200)
              : Colors.transparent,
        ),
        child: Text(
          '${time}D',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
