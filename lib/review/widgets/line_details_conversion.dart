import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LineDetailsConversion extends StatelessWidget {
  final String label;
  final String value;

  const LineDetailsConversion({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.08,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(255, 201, 202, 212),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(255, 117, 118, 128),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: AutoSizeText(
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  value,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 47, 47, 51),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
