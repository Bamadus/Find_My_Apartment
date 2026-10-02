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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
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
            height: screenHeight(context)* .08,
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
                  child: Center(child: Text("₦ 0,000,000",
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 15, 26),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  )),     
            ),
            Text("Lake View Office\n #0000000000",
            style: TextStyle(
              color: Color.fromARGB(255, 4, 15, 26),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(onPressed: (){
                    setState(() {
                      !isSelected ?
                      isSelected = true : 
                      isSelected = false;
                    });
                    // like Logic
                  }, icon: Icon(UniconsLine.heart),
                  isSelected: isSelected,
                  selectedIcon: Icon(Icons.favorite),
                  ),
        ],
      ),
    ),
    SizedBox(width: 10,),
    Container(
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
            height: screenHeight(context)* .08,
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
                  child: Center(child: Text("₦ 0,000,000",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 14, 24),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  )),     
            ),
            Text("Lake View Office\n #0000000000",
            style: TextStyle(
              color: Color.fromARGB(255, 4, 15, 26),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(onPressed: (){
                    setState(() {
                      !isSelected ?
                      isSelected = true : 
                      isSelected = false;
                    });
                    // like Logic
                  }, icon: Icon(UniconsLine.heart),
                  isSelected: isSelected,
                  selectedIcon: Icon(Icons.favorite),
                  ),
        ],
      ),
    ),
    SizedBox(width: 10,),
    Container(
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
            height: screenHeight(context)* .08,
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
                  child: Center(child: Text("₦ 0,000,000",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 16, 29),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  )),     
            ),
            Text("Lake View Office\n #0000000000",
            style: TextStyle(
              color: Color.fromARGB(255, 4, 15, 26),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(onPressed: (){
                    setState(() {
                      !isSelected ?
                      isSelected = true : 
                      isSelected = false;
                    });
                    // like Logic
                  }, icon: Icon(UniconsLine.heart),
                  isSelected: isSelected,
                  selectedIcon: Icon(Icons.favorite),
                  ),
        ],
      ),
    ),
      ],),
      );
  }
}