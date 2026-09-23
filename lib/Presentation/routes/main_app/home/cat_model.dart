import "package:flutter/material.dart";
import "package:unicons/unicons.dart";

class Cat_Model extends StatefulWidget{
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
      child: Row(
        children: [
          Container(
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
                    child: Center(child: Text("₦ 0,000,000",
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
                Text("Label",
                style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                ),),
                Positioned(
                  left: screenWidth(context)* .35,
                  bottom: screenHeight(context) * .02,
                  // margin: EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: (){
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
                )
                //Api or downloaded image...
        ],
      ),
    ),
          Container(
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
                    child: Center(child: Text("₦ 0,000,000",
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
                Text("Label",
                style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                ),),
                Positioned(
                  left: screenWidth(context)* .35,
                  bottom: screenHeight(context) * .02,
                  // margin: EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: (){
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
                )
                //Api or downloaded image...
        ],
      ),
    ),
          Container(
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
                    child: Center(child: Text("₦ 0,000,000",
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
                Text("Label",
                style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                ),),
                Positioned(
                  left: screenWidth(context)* .35,
                  bottom: screenHeight(context) * .02,
                  // margin: EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: (){
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
                )
                //Api or downloaded image...
        ],
      ),
    ),
          Container(
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
                    child: Center(child: Text("₦ 0,000,000",
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
                Text("Label",
                style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                ),),
                Positioned(
                  left: screenWidth(context)* .35,
                  bottom: screenHeight(context) * .02,
                  // margin: EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: (){
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
                )
                //Api or downloaded image...
        ],
      ),
    ),
          Container(
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
                    child: Center(child: Text("₦ 0,000,000",
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
                Text("Label",
                style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                ),),
                Positioned(
                  left: screenWidth(context)* .35,
                  bottom: screenHeight(context) * .02,
                  // margin: EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: (){
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
                )
                //Api or downloaded image...
        ],
      ),
    )
        ],
      ),
    );
  }
}