import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Explore extends StatefulWidget{
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  final User? user = FirebaseAuth.instance.currentUser;
  

  @override
  Widget build(BuildContext context) {
    final String username = user?.displayName ?? 'USER';
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        leadingWidth: 250,
        // title: const Text('Find My Apartment-explore screen'),
        leading: Row(
          children: [
            const CircleAvatar(
                            radius: 50,
                            backgroundColor: Color(0xffcce3de),
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                             children: [
                                   TextSpan(
                                   text: 'Hi, ${username}',
                                    style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff212529),
                            ),
                          ),
                                  TextSpan(
                                    text: '\nWelcome Back',
                                    style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff343a40),
                                  ),
                                  ),
                               ],
                              ),
                              )


          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
            icon:  Icon(UniconsLine.bell, size: 30), // Use UniconsLine.notification for the notification icon
            onPressed: () {
              // Handle notification button press
            },
                    ),
          ),
        ]
      ),
    );
  }
}