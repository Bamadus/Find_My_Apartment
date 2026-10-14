import 'package:find_my_apartment/Domain/model/picture_model.dart';
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton_model.dart';
import 'package:find_my_apartment/Presentation/widgets/shuffle_pic.dart';
import "package:flutter/material.dart";
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton.dart';
import 'package:find_my_apartment/Data/pictures.dart';  

class Cat_Model extends StatefulWidget{
  const Cat_Model({super.key});

  @override
  State<Cat_Model> createState() => _Cat_ModelState();
}

class _Cat_ModelState extends State<Cat_Model> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      // width: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
      itemCount: demo_pic_list.length,
      itemBuilder: (context, index) {
            final pic = shuffled[index];
            return Container(
        margin: EdgeInsets.only(right:20),
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(
      color: Color(0xffd2cdc6),
      width: 1
      ),
              borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(pic.path, fit: BoxFit.cover)),
                    Positioned(
                      top: 10,
                      // left: 20,
                      right: 8,
                      child: Container(
                        // margin: EdgeInsets.all(5),
                        // height: 35,
                        // width: 35,
                        decoration: BoxDecoration(
              color: Color(0xff343a40),
              borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  )),   
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pic.price,
                    style: TextStyle(
                      color: Color(0xffe9ecef),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),     
                        ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child:
              Text(pic.location,
              style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff8f9fa)
                      ),
              ),),
              Positioned(
                right: 10,
                bottom: 0,
                // margin: EdgeInsets.only(left: 20),
                child: LikeButton(type: LikeType.other_pictures, id: pic.id, style: LikeButtonStyle.cat_picture), // like button
              )
                ],
              ),
            ),
          );
      },
            ),
    );
  }
}
