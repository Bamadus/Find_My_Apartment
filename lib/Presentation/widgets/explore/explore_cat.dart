import 'package:find_my_apartment/Data/pictures.dart';
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton_model.dart';
import 'package:find_my_apartment/Presentation/widgets/circle_notch.dart';
import 'package:find_my_apartment/Presentation/widgets/shuffle_pic.dart';
import "package:flutter/material.dart";
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton.dart';

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
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xff343a40),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: Text(
                  pic.price,
                  style: const TextStyle(
                    color: Color(0xffe9ecef),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
          ],
        ),
      );
    },
  );
}
}