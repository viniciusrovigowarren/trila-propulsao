import 'package:flutter/material.dart';

class AppBarPattern extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function rote;
  const AppBarPattern({
    Key? key,
    required this.title,
    required this.rote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          rote;
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
