import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  String errormessage= '';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _username_error;
  String? _pswrd_error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffe3f2fd),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top:screenHeight(context)*0.1,
              left: screenWidth(context) * 0.05,
            ),
            child: IconButton(
              onPressed:(){
                Navigator.pop(context);
              },
               icon: Icon(
                 Icons.arrow_back_ios,
                 size: screenHeight(context) * 0.05,
                 color: Color(0xff33415c),
               ),
          )
          ),
          Positioned(
            // top: screenHeight(context)*.45,
            // right: screenWidth(context) * 0.5,
            // left: .19,
            bottom: screenHeight(context)*.15,
            child: Lottie.asset(
              'assets/lotties/Login.json',
              // fit: BoxFit.fitHeight,
              // width: screenWidth(context) * 0.5,
              // height: screenHeight(context) * 0.7
              ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffd7e3fc).withOpacity(0.65),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
              margin: EdgeInsets.only(
                top: screenHeight(context) * 0.2,
                bottom: screenHeight(context) * 0.1,
                left:screenWidth(context) * 0.05,
                right:screenWidth(context) * 0.05,
              ),
              // Login Details......
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Form(
                    key: _loginKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [
                        Text("Username:"),
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(

                          ),
                        )
                      ],
                    )
                    )
                ],
              )
            ),
          ),
          Positioned(
            top: screenHeight(context) * .86,
            left: screenWidth(context) * .27,
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  overlayColor: WidgetStateProperty.all(Color.fromARGB(255, 20, 55, 101).withOpacity(0.5)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 97, 144, 238)),
                  foregroundColor: WidgetStateProperty.all(Color(0xffe3f2fd)),
                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 20))
                ),
                onPressed: (){}, 
              child: Text("Login",
              style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SourceSansPro',
                      color: Color(0xffe3f2fd),
                      ),
              )
              ),
            ),
          )
        ],
      )
    );
  }
}