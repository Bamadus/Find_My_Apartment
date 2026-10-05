import "package:flutter/material.dart";
import "package:unicons/unicons.dart";
import 'package:find_my_apartment/Presentation/widgets/picture_image.dart';
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GridView.builder(
  padding: const EdgeInsets.all(8),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 1,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 0.8,
  ),
  itemCount: demo_pic_list.length,
  itemBuilder: (context, index) {
    final pic = demo_pic_list[index];
    return Container(
        margin: EdgeInsets.all(5),
            height: screenHeight(context) * .25,
            width:screenWidth(context) * .5 ,
            decoration: BoxDecoration(
              // color: Colors.amber,
              border: BoxBorder.all(
      color: Color(0xffd2cdc6),
      width: 1
      ),
              borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Image.asset(pic.path, fit: BoxFit.cover),
      Positioned(
        left: screenWidth(context)* .2,
        top: screenHeight(context) * .0225,
        right: screenWidth(context)* .02,
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
        bottom: screenHeight(context) * .035,
        child:
            Text(pic.location,
            style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
            ),),
            Positioned(
              left: screenWidth(context)* .35,
              bottom: screenHeight(context) * .02,
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
)
    );
  }
}
