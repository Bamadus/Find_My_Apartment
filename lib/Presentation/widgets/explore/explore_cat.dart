import 'dart:ui';

import 'package:find_my_apartment/Data/pictures.dart';
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton_model.dart';
import 'package:find_my_apartment/Presentation/widgets/circle_notch.dart';
import 'package:find_my_apartment/Presentation/widgets/shuffle_pic.dart';
import "package:flutter/material.dart";
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton.dart';
import 'package:unicons/unicons.dart';

class Explore_img extends StatefulWidget{
  const Explore_img({super.key});

  @override
  State<Explore_img> createState() => Explore_imgState();
}

class Explore_imgState extends State<Explore_img> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  bool isSelected = false;


  
@override
Widget build(BuildContext context) {
  return ListView.builder(
    physics:const ClampingScrollPhysics(),
    itemCount: demo_pic_list.length,
    itemBuilder: (context, index) {
      final pic = demo_pic_list[index];

      return Container(
        height: screenHeight(context) * 0.5,
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Property image with circular notch
            Positioned.fill(
              child: ClipPath(
                clipper: CircleNotchClipper(),
                child: Image.asset(
                  pic.path,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Price tag
            Positioned(
              top: 15,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                maxWidth: 300,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff343a40).withOpacity(.3),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff212529),
                      Color(0xff495057),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: pic.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                      TextSpan(
                        text: "\nThis property is located in ${pic.location} \n for ${pic.price}.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      )
                    ]
                  )
                  )
              ),
            ),
            // Floating LikeButton
            Positioned(
              top: 0,
              right: 1,
              child: Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff212529),
                      Color(0xff495057),
                    ],
                  ),
                ),
                child: Center(
                  child: LikeButton(
                    type: LikeType.cat_pictures,
                    id: pic.id,
                    style: LikeButtonStyle.cat_picture,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 15,
              child: Row(
                children: [
                   ClipOval(
                     child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                        ),
                       child: Container(
                                   margin: EdgeInsets.all(10),
                                   padding: EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                color: Colors.white.withOpacity(.1),
                                    width: 2,
                                  ),  
                                  ),
                                   child: IconButton(
                                   icon:  Icon(UniconsLine.phone_volume, size: 35, color: Color(0xfff6fff8),), // Use UniconsLine.notification for the notification icon
                                   onPressed: () {
                                     // Handle call button press
                                   },
                                   ),
                                 ),
                     ),
                   ),
                   SizedBox(width:100 ,),
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
              child: InkWell(
                onTap: () {
                  // Book Logic!!?
                },
                child: Container(
                        // margin: EdgeInsets.only(left: 120, right: 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius:BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                          )),
                        child: Text("Book Now",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xfff8f9fa)
                          // fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
              ),
            ),
          ),
                ],
              )
              )
          ],
        ),
      );
    },
  );
}
}