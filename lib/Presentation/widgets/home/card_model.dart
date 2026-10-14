import 'package:find_my_apartment/Data/pictures.dart';
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton_model.dart';
import 'package:flutter/material.dart';
import "package:unicons/unicons.dart";

class Property_card extends StatefulWidget{
  const Property_card({super.key});

  @override
  State<Property_card> createState() => _Property_cardState();
}

class _Property_cardState extends State<Property_card> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: demo_pic_list.length,
        itemBuilder: (context, index) {
          final pic = demo_pic_list.reversed.toList()[index];
                return Container(
                  margin: EdgeInsets.only(right: 20),
            // width: screenWidth(context)* .6,
            decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Color(0xffd2cdc6),
          width: 1
          ),
        borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: screenHeight(context)* .1,
            width: screenWidth(context)* .3,
            decoration: BoxDecoration(
              // color: Color(0xff495057),
              border: BoxBorder.all(
        color: Color(0xffd2cdc6),
        width: 1
        ),
              borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6)
                  )),   
                  child: Image.asset(pic.path, fit: BoxFit.fill,),
                  //  
            ),
            Text("${pic.location}\n${pic.price}",
            style: TextStyle(
              color: Color.fromARGB(255, 4, 15, 26),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10,),
          LikeButton(type: LikeType.cat_pictures, id: pic.id, style: LikeButtonStyle.other_picture), // like button
        ],
            ),
          );
        }
      ),
    );
      
  }
}