import "package:flutter/material.dart";
import "package:unicons/unicons.dart";

class Cat_Model extends StatefulWidget{
  @override
  State<Cat_Model> createState() => _Cat_ModelState();
}

class _Cat_ModelState extends State<Cat_Model> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * .2,
      width:screenWidth(context) * .5 ,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            bottom: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Label",
                style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                ),
                IconButton(onPressed: (){
                  // like Logic
                }, icon: Icon(UniconsLine.heart))
              ],
            ),
          )
        ],
      ),
    );
  }
}