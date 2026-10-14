import 'package:find_my_apartment/Data/pictures.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget{
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Find My Apartment-explore screen'),
      ),
    );
  }
}