import 'package:flutter/material.dart';

void main() {
  runApp(Interview());
}

class Interview extends StatelessWidget {
  const Interview({super.key});

  @override
  Widget build(Object context) {
    
    return 
MaterialApp(
      // title: 'Interview App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 150,
          leading: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(Icons.arrow_back,),
                      ),
                      SizedBox(width: 10,),
                      Text("Back",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("Sell Coin",
                  style: TextStyle(
                    // fontFamily: "Roboto",
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text("Sell your crypto asset",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text("You sell",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            child: Text("\$0",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/images/bitcoin.png",
                                  width: 20,
                                  height: 20,
                                ),
                                Text("BTC",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            child: Text("\$0",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      )
                  ],),
                )
            ],
          ),
        )
      ),
    );
  }

}