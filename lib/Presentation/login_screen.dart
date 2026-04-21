import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}
class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3f2fd),
      body:  Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Images/Home.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Positioned(
              bottom: 125,
              height: 65,
              left: 55,
              right: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2196f3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: (){}, 
                child: Text('Login'),
              ),
            )
          ],
        ),
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