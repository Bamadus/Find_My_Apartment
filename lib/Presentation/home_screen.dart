import 'package:flutter/material.dart';
import 'package:find_my_apartment/presentation/home_screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find My Apartment'),
      ),
      body: const Center(
        child: Text('Welcome to Find My Apartment!'),
      ),
    );
  }
}