import 'package:flutter/material.dart';

class Property_card extends StatefulWidget{
  @override
  State<Property_card> createState() => _Property_cardState();
}

class _Property_cardState extends State<Property_card> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context)* .1,
      width: screenWidth(context)* .2,
      child: Card(
        color: Color(0xffF8F7F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color:Color(0xffd2cdc6), width: 1 )
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
                      color: Color(0xffe9ecef),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    )),     
              ),
          ],
        ),
      ),
    );
  }
}