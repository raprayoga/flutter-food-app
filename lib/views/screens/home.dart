import 'package:flutter/material.dart';
import 'package:flutter_food_app/views/widgets/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(bottomNavigationBar: Navbar());
  }
}
