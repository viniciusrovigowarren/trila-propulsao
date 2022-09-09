import 'package:flutter/material.dart';

class TopPageWalletEye extends StatefulWidget {
  const TopPageWalletEye({
    Key? key,
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
                style: TextStyle(fontSize: 32),
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
                'US\$ ',
                style: TextStyle(fontSize: 32),
              ),
              visibility == false
                  ? const Text(
                      '1.000,00',
                      style: TextStyle(fontSize: 32),
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
