import 'package:find_my_apartment/Presentation/Abstract/onboarding/app_intro.dart';
import 'package:find_my_apartment/Presentation/onboarding/onboarding.dart';
import 'package:find_my_apartment/Presentation/provider/provider.dart';
import 'package:find_my_apartment/Presentation/routes/landing_screen.dart';
import 'package:find_my_apartment/Presentation/routes/login.dart';
import 'package:find_my_apartment/Presentation/routes/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Auth_layout extends StatelessWidget {
  const Auth_layout({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // This is where you monitor the state
    switch (authProvider.status) {
      case AuthStatus.splash:
        return const Splash(); 
      case AuthStatus.newUser:
        return const Onboarding(); // Show onboarding if not finished
      case AuthStatus.authenticated: // this state is for when sign Up is successful
        return const Login();
      case AuthStatus.authenticating:
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      case AuthStatus.unauthenticated:
        return ScaffoldMessenger(
          child: SnackBar(
              content: Text(
                'Sign Up Error.',
                style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize:18,
                                      color: Color(0xffedf2fb),     
                          )),
                            backgroundColor: Color(0xffba324f),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(15),
                            margin: const EdgeInsets.only(left: 15,
                            right: 15, 
                            bottom: 150
                            ),
          ),
        );
      case AuthStatus.error:
        return ScaffoldMessenger(
          child: SnackBar(
              content: Text(
                AuthStatus.error as String,
                style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize:18,
                                      color: Color(0xffedf2fb),     
                          )),
                            backgroundColor: Color(0xffba324f),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(15),
                            margin: const EdgeInsets.only(left: 15,
                            right: 15, 
                            bottom: 150
                            ),
          ),
        ); {} // Show lognuin if not authenticated
      default:
        return const Login(); // Default to splash screen
    }
  }
}