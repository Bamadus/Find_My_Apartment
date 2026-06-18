import "package:find_my_apartment/Presentation/Abstract/page_indicator.dart";
import "package:find_my_apartment/Presentation/onboarding/login_onboardig.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class next_Onboarding extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;
  const next_Onboarding({super.key, required this.onNext, required this.onSkip});

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffe3f2fd),
      body: Column(
        children:[
          Stack(
            children: [
              Center(
          child: Lottie.asset(
            'assets/lotties/Home2.json',
            fit: BoxFit.contain,
            width: screenHeight(context) * 1,
            height: screenHeight(context) * 0.7
            ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: screenHeight(context) * .5,
          child:Center(
          child: Text(
            "Feel like a local, wherever",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // fontFamily: 'SourceSansPro',
              color: Color(0xff33415c),
            ),
          ),
        ),),
        Positioned(
          left: 0,
          right: 0,
          top: screenHeight(context) * .54,
          child:Center(
          child: Text(
            "you land...",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // fontFamily: 'SourceSansPro',
              color: Color(0xff33415c),
            ),
          ),
        ),),
        Positioned(
          top: screenHeight(context) * .6,
          left: screenHeight(context) * .05,
          right: screenHeight(context) * .05,
          child: Center(
            child: Text(
              "From short-term stays to",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff5c677d),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight(context) * .64,
          left: screenHeight(context) * .05,
          right: screenHeight(context) * .05,
          child: Center(
            child: Text(
              "long-term leases",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff5c677d),
              ),
            ),
          ),
        ),
        //  Positioned(
        //   top: screenHeight(context) * .7,
        //   left: screenHeight(context) * .05,
        //   right: screenHeight(context) * .05,
        //   child: Center(
        //     child: Text(
        //       "discover homes filters by city, prices, or amenities",
        //       style: TextStyle(
        //         fontSize: 18,
        //         fontWeight: FontWeight.bold,
        //         color: Color(0xff5c677d),
        //       ),
        //     ),
        //   ),
        // ),
       
            ],
          ),
          SizedBox(height: screenHeight(context)*0.1),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff33415c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  onPressed: this.onSkip, 
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      )
                      )
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff33415c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  onPressed:this.onNext,
//                      Navigator.push(
//   context,
//   PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => login_onboarding(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       final tween = Tween(
//         begin: Offset(1.0, 0.0),  // starts from right
//         end: Offset.zero,
//       ).chain(CurveTween(curve: Curves.easeInOut));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//     transitionDuration: Duration(milliseconds: 300),
//   ),
// );
                  // }, 
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      )
                      )
                ),
            ],
          ),
            SizedBox(height: screenHeight(context)*0.05),
            PageIndicator(currentPage: 1, pageCount: 3),
      ],
      )
    );
  }
}
