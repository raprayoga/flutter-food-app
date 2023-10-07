import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar(
      {super.key, required this.selectedIndex, required this.onItemTapped});
  final int selectedIndex;
  final Function(int value) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'account'),
      ],
      currentIndex: selectedIndex,
      onTap: (value) {
        onItemTapped(value);
      },
    );
  }
}
