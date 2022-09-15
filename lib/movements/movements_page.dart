import 'package:flutter/material.dart';

import '../shared/widgets/botton_navigation_bar.dart';

class MovementsPage extends StatelessWidget {
  const MovementsPage({Key? key}) : super(key: key);

  static const route = '/moviments-page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Movimentações',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Center(
          child: Text(
            'Pagina de movimentações',
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
