import "package:flutter/material.dart";
import 'package:find_my_apartment/Presentation/widgets/like_botton.dart';
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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.all(8),
    itemCount: demo_pic_list.length,
    itemBuilder: (context, index) {
          final pic = demo_pic_list[index];
          return Container(
      margin: EdgeInsets.all(5),
          height: 350,
          // width:150,
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(
    color: Color(0xffd2cdc6),
    width: 1
    ),
            borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                // Positioned.fill(child: Image.asset(pic.path, fit: BoxFit.cover)),
                  Positioned(
                    left: 20,
                    // top: ,
                    right: 8,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: screenHeight(context)* .035,
                      width: screenWidth(context)* .3,
                      decoration: BoxDecoration(
            color: Color(0xff495057),
            borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                )),   
                child: Center(child: Text(pic.price,
                style: TextStyle(
                  color: Color(0xffe9ecef),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                )),     
                      ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 10,
                    child:
            Text(pic.location,
            style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
            ),),
            Positioned(
              left: 20,
              bottom: 10,
              // margin: EdgeInsets.only(left: 20),
              child: LikeButton(pictureId: pic.id),
              //IconButton(onPressed: (){
              //   setState(() {
              //     !isSelected ?
              //     isSelected = true : 
              //     isSelected = false;
              //   });
              //   // like Logic
              // }, icon: Icon(UniconsLine.heart),
              // isSelected: isSelected,
              // selectedIcon: Icon(Icons.favorite),
              // ),
            )
            //Api or downloaded image...
              ],
            ),
          ),
        );
          // Card(
          //   clipBehavior: Clip.antiAlias,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Image.asset(pic.path, fit: BoxFit.cover, width: double.infinity),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //         child: Row(
          //           children: [
          //             Expanded(child: Text(pic.title, overflow: TextOverflow.ellipsis)),
          //             LikeButton(pictureId: pic.id),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // );
    },
          );
  }
}
