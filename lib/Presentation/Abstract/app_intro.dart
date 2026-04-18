import 'dart:async';

import 'package:find_my_apartment/Presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  startTime() {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () {
      if (mounted) {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Login_Screen()));
        });
      }
    });
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF5F6F7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: screenHeight(context)*0.5,
                width: screenWidth(context)*0.5,
                child: Column(
                  children: [
                    Lottie.asset('assets/lotties/Home_location.json',
                    fit: BoxFit.contain,
                      height: screenHeight(context)*0.5,
                      width: screenWidth(context)*0.5,
                    ),
                  ],
                )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Find My Apartment",
                  style: TextStyle( fontFamily: 'SourceSansPro',
                      color: Color(0xff33415c),fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5),
                Text(
                  "Affordable Comfort Zone...",
                  style: TextStyle( fontFamily: 'SourceSansPro',
                      color: Color(0xff33415c),fontSize: 21),
                ),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}