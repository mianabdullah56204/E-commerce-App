import 'package:ecommerce_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = 0;
    // var onItemTapped;
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CustomNavigationBar(
            selectedIndex: selectedIndex,
            // onItemTapped: onItemTapped,
          ),
        ),
      ),
    );
  }
}
