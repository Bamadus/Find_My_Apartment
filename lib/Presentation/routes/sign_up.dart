import 'package:find_my_apartment/Presentation/Abstract/pwrdfield.dart';
import 'package:find_my_apartment/Presentation/Abstract/textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

final GlobalKey<FormState> _signupkey = GlobalKey<FormState>();

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffe3f2fd),
      body: Stack(
        children: [
          Positioned(
            child: Lottie.asset(
              'assets/lotties/Login.json',
              
              ),
          ),
          ListView(
                padding: EdgeInsets.all(15),
                // shrinkWrap: true,
                children:[
                  SizedBox(height: screenHeight(context)*0.1,),
                  CircleAvatar(
                radius: 79,
                backgroundColor: Color.fromARGB(255, 134, 159, 209).withOpacity(0.65),
                child:Icon(
                  size: 100,
                  color: Color.fromARGB(150, 24, 24, 25).withOpacity(0.65),
                  Icons.person_2_rounded)
                ),
              SizedBox(height: 20,),
                  Form(
                    key: _signupkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('Username',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:16,
                                    color: Color(0xff092C4C),
                                    fontWeight: FontWeight.w400
                        )),
                        UserField(
                        controller: _usernameController,
                        hintText: "user@name",
                        validator: (v){
                                  if(v!.isEmpty){
                                    return "This field is required";
                                  }
                                  return null;
                                },
                        ),
                        SizedBox(height: 15,),
                        Text('Email',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:16,
                                    color: Color(0xff092C4C),
                                    fontWeight: FontWeight.w400
                        )),
                        UserField(
                        controller: _usernameController,
                        hintText: "e.g:Username@gmail.com",
                        validator: (v){
                                  if(v!.isEmpty){
                                    return "This field is required";
                                  }
                                  return null;
                                },
                        ),
                        SizedBox(height: 15,),
                        Text('Password',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:16,
                                    color: Color(0xff092C4C),
                                    fontWeight: FontWeight.w400
                        )),
                        Password(
                          controller: _passwordController,
                          hintText: "P4ssword",
                          validator: (v){
                                  if(v!.isEmpty){
                                    return "This field is required";
                                  }
                                  return null;
                                },
                        ),
                        SizedBox(height: 15,),
                      ],
                    )
                    ),
                    
                    Positioned(
            top: screenHeight(context) * .86,
            left: screenWidth(context) * .27,
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(5),
                  overlayColor: WidgetStateProperty.all(Color.fromARGB(255, 20, 55, 101).withOpacity(0.5)),
                  backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 97, 144, 238)),
                  foregroundColor: WidgetStateProperty.all(Color(0xffe3f2fd)),
                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 20))
                ),
                onPressed: (){
                  if(_signupkey.currentState!.validate()){

                  }
                }, 
              child: Text("Sign Up",
              style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SourceSansPro',
                      color: Color(0xffe3f2fd),
                      ),
              )
              ),
            ),
          ),
          Row(
                                  children: [
                                    const Text('Login Instead?',
                                      style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'SourceSansPro',
                                          color: Color(0xff626262),
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    TextButton(onPressed:(){},
                                        child:const Text('Login',
                                          style: TextStyle(
                                            color: Color(0xff0085FF),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            fontFamily: 'SourceSansPro',
                                            decoration: TextDecoration.underline,
                                            decorationColor: Color(0xff0085FF),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                ],
              )
        ],
      ),
    );
  }
}