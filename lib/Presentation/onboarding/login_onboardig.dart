import "package:find_my_apartment/Presentation/Abstract/onboarding/page_indicator.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class login_onboarding extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onSignUp;
  const login_onboarding({super.key, required this.onLogin, required this.onSignUp});

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
            'assets/lotties/house_deal.json',
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
                  onPressed: onSignUp, 
                  child: Text(
                    "Sign Up",
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
                  onPressed: onLogin,
                  // }, 
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      )
                      )
                )
            ],
          ),
            SizedBox(height: screenHeight(context)*0.05),
            PageIndicator(currentPage: 2, pageCount: 3),
      ],
      )
    );
  }
}
