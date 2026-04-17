import 'package:find_my_apartment/Presentation/login_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const Login_Screen(),
    );
  }
}