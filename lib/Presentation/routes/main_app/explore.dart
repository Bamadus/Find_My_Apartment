import 'package:find_my_apartment/Presentation/routes/main_app/search.dart';
import 'package:find_my_apartment/Presentation/widgets/explore/explore_cat.dart';
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
        backgroundColor:const Color(0xffF8F7F4),
      appBar: AppBar(
        backgroundColor:const Color(0xffF8F7F4),
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
                                   text: 'Hi, $username',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Locate The Perfect\nPlace For You!!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  ),
              ),
              Divider(
                indent: 5
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ClipRRect(
                borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
              child: Container(
              color: const Color(0xffF8F7F4),
              child: const Explore_img(),
              ),
              ),
              )
          ],
        ),
      ),
    );
  }
}