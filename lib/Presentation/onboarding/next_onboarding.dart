import "package:find_my_apartment/Presentation/Abstract/onboarding/page_indicator.dart";
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
          top: screenHeight(context) * .55,
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
          top: screenHeight(context) * .59,
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
          top: screenHeight(context) * .64,
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
          top: screenHeight(context) * .68,
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
                  style: ButtonStyle(
                elevation: WidgetStateProperty.all(5),
                overlayColor: WidgetStateProperty.all(Color(0xff778da9).withOpacity(0.5)),
                backgroundColor: WidgetStateProperty.all(Color(0xff33415c)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
              ),
                  onPressed: onSkip, 
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
                  style: ButtonStyle(
                elevation: WidgetStateProperty.all(5),
                overlayColor: WidgetStateProperty.all(Color(0xff778da9).withOpacity(0.5)),
                backgroundColor: WidgetStateProperty.all(Color(0xff33415c)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
              ),
                  onPressed:onNext,
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
