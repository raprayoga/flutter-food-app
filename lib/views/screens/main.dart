import 'package:flutter/material.dart';
import 'package:flutter_food_app/views/screens/favorites.dart';
import 'package:flutter_food_app/views/widgets/navbar.dart';
import 'package:flutter_food_app/views/screens/home.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
                onPressed: () {},
              ),
              actions: const [Icon(Icons.notifications, color: Colors.white)],
            )
          : AppBar(
              title: Text(
                'Favorite',
              ),
              actions: const [Icon(Icons.notifications, color: Colors.white)],
            ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          switch (_selectedIndex) {
            case 0:
              return const Home();
            case 1:
              return const Favorite();
            default:
              return const Home();
          }
        },
      ),
      bottomNavigationBar:
          Navbar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
