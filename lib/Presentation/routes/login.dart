import 'package:find_my_apartment/Presentation/Abstract/textfield.dart';
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
  String? _username_error = "mp;e";
  String? _pswrd_error;
  bool _isChecked = false;

  void _validateInput() {
    setState((){
      _username_error= _usernameController.text.isEmpty?"This field is Required.":null;
      _pswrd_error= _passwordController.text.isEmpty ? "This field is required." : null;

      if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
        _username_error;
        _pswrd_error;
      }else if(_usernameController.text.length < 2) {
        _username_error = 'Invalid username';
      }else if(_passwordController.text.length != 7){
        _pswrd_error = 'Invalid password';
      }
      else {
        _username_error = null;
        _pswrd_error = null;
      }
    });
  }

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
                padding: EdgeInsets.only(left:10, right: 10),
                // shrinkWrap: true,
                children: [
                  SizedBox(height: screenHeight(context)*0.05,),
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
                    key: _loginKey,
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
                        Text('Password',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:16,
                                    color: Color(0xff092C4C),
                                    fontWeight: FontWeight.w400
                        )),
                        AppPassword(
                          controller: _passwordController,
                          hintText: "P4ssword",
                          validator: (v){
                                  if(v!.isEmpty){
                                    return "This field is required";
                                  }
                                  return null;
                                },
                        ),
                        Row(
                                children: [
                                  Checkbox(
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeColor:Color.fromARGB(255, 15, 43, 99) ,
                                      value: _isChecked,
                                      onChanged:(bool? value){
                                        setState(() {
                                          _isChecked = value ?? false;
                                        });
                                      },
                                  ),
                                  const Text('Remember My Detail',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize:16,
                                        color: Color(0xff626262),
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                  children: [
                                    const Text('Forgot Password?',
                                      style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'SourceSansPro',
                                          color: Color(0xff626262),
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    TextButton(onPressed:(){},
                                        child:const Text('Reset Password',
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
                onPressed: (){
                  if(_loginKey.currentState!.validate()){

                  }
                }, 
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