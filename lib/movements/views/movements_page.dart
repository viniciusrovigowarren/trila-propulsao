import 'package:flutter/material.dart';

import '../../shared/widgets/botton_navigation_bar.dart';
import '../widgets/listview_movements.dart';

class MovementsPage extends StatelessWidget {
  const MovementsPage({super.key});
  static const routeName = "/movements-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Movimentações',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Color.fromARGB(255, 145, 153, 166),
              ),
              ListViewMovements(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
