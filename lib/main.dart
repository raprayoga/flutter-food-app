import 'package:flutter/material.dart';
import 'package:flutter_food_app/views/screens/auth.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 7, 7, 7),
);
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme()
            .copyWith(backgroundColor: kColorScheme.onPrimaryContainer),
        scaffoldBackgroundColor: kColorScheme.onPrimaryContainer,
      ),
      home: const Auth(),
    );
  }
}
