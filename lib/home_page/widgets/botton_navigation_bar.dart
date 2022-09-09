import 'package:flutter/material.dart';
import 'package:trilha_propulsao/core/assets.dart';

class BottonNatigationBar extends StatefulWidget {
  const BottonNatigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottonNatigationBar> createState() => _BottonNatigationBarState();
}

class _BottonNatigationBarState extends State<BottonNatigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_rounded),
          label: 'Carteiras',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.candlestick_chart_outlined),
          label: 'Movimentações',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromARGB(255, 238, 46, 93),
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      onTap: _onItemTapped,
    );
  }
}
