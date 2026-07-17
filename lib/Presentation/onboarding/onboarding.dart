import "package:find_my_apartment/Presentation/onboarding/continue_onboarding.dart";
import "package:find_my_apartment/Presentation/onboarding/login_onboardig.dart";
import "package:find_my_apartment/Presentation/onboarding/next_onboarding.dart";
import "package:find_my_apartment/Presentation/routes/login.dart";
import "package:find_my_apartment/Presentation/routes/sign_up.dart";
import "package:flutter/material.dart";

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  int _currentPage = 0;
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Color(0xffe3f2fd),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        children: [
          Continue_Onboarding(
            onContinue: () => _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),

          next_Onboarding(
            onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            onSkip: () => _pageController.animateToPage(
              2,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),

          login_onboarding(
            onLogin: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Login(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: ScaleTransition(
      scale: Tween(begin: 0.92, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOut),
      ),
      child: child,
    ),
  );
},
                transitionDuration: Duration(milliseconds: 300),
              ),
            ),
            onSignUp:()=> Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: ScaleTransition(
      scale: Tween(begin: 0.92, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOut),
      ),
      child: child,
    ),
  );
},
                transitionDuration: Duration(milliseconds: 300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
