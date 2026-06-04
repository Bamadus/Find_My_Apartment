import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}
class _Login_ScreenState extends State<Login_Screen> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3f2fd),
      body:  Column(
                  children: [
                    // SizedBox(height: screenHeight(context)*0.25),
                    SizedBox(
                      height: screenHeight(context)*0.7,
                      width: screenWidth(context)*0.95,
                      child: Container(
                              color:Colors.red,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(right: screenWidth(context)*0.89),
                            child: Lottie.asset('assets/lotties/Home.json',
                              fit: BoxFit.fitHeight,
                              height: screenHeight(context)*0.7,
                              width: screenWidth(context)*0.5,
                            ),
                          )
                  ),
                  ],
                )
    );
  }
}





// // Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset('assets/lotties/Home.json'),
//             const SizedBox(height: 20),
//             FilledButton(onPressed: () {}, child: const Text('Login')),

//           ],
//         ),
//       ),