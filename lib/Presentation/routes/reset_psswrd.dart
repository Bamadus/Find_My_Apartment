import 'dart:async';

import 'package:find_my_apartment/Presentation/Abstract/pwrdfield.dart';
import 'package:find_my_apartment/Presentation/Abstract/textfield.dart';
import 'package:find_my_apartment/Presentation/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reset_Psswrd extends StatefulWidget{
  const Reset_Psswrd({super.key});

  @override
  State<Reset_Psswrd> createState() => _Reset_PsswrdState();
}

class _Reset_PsswrdState extends State<Reset_Psswrd> {
  final GlobalKey<FormState> _resetkey = GlobalKey<FormState>();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  Timer? _debounce;
  String? _errorMessage;
  late final isAuthenticating = context.watch<AuthProvider>().status == AuthStatus.authenticating;


  void delete_me_when_the_logic_is_readdy(){
    print('This should be the reset password logic.....');
    Navigator.pop(context);
  }

  void reset_password(){
      if(_newpasswordController.text.isEmpty && _confirmpasswordController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'This field is Required',
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
                          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 150),
              ),
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Passwords do not Match',
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
                          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 150),
              ),
        );
      }
    }

  void _onTextChanged() {
    // 1. Cancel the timer if the user is still typing
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // 2. Clear error message immediately if they change something
    // (Optional: removes the error while they are fixing it)
    if (_errorMessage != null) {
      setState(() {
        _errorMessage = null;
      });
    }

    // 3. Check if lengths are the same and not empty
    if (_newpasswordController.text.length ==_confirmpasswordController.text.length &&
        _confirmpasswordController.text.isNotEmpty) {
      
      // 4. Start the "Few Seconds" countdown
      _debounce = Timer(const Duration(milliseconds: 1), () {
        _performCheck();
      });
    }
  }

  void _performCheck() {
    setState(() {
      if (_newpasswordController.text != _confirmpasswordController.text) {
        _errorMessage = "Passwords do not Match!";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _errorMessage!,
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
                          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 150),
              ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Password Match',
              style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffedf2fb),     
                        )),
                          backgroundColor: Color(0xff52b69a),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(15),
                          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 150),
              ),
        );
        _errorMessage = null;
      }
    });
  }

  @override
  void dispose() {
    _newpasswordController.dispose();
    _confirmpasswordController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

    @override
  void initState() {
    super.initState();
    // Add listeners to both controllers
    _newpasswordController.addListener(_onTextChanged);
    _confirmpasswordController.addListener(_onTextChanged);
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Color(0xffe3f2fd),
      body: Container(
        child: ListView(
          // shrinkWrap: true,
          children: [ 
            const SizedBox(height: 15,),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 5,),
            child: Text.rich(
              TextSpan(
                text: 'Reset Password',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: '\nEnter new password, Password should follow the guide below.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)
                  )
                ])
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 5),
            child: Form(
              key: _resetkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Password',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                            fontSize:18,
                            color: Color(0xff092C4C),
                            fontWeight: FontWeight.w400
                    ),
                  ),
                  Password(
                    controller: _newpasswordController, 
                    enabled: !isAuthenticating,
                    hintText: 'P4ssw@rd',
                    validator: (v){
                          if(v!.isEmpty){
                            return "This field is required";
                          }
                          return null;
                        },
                    ),
                    const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                            fontSize:18,
                            color: Color(0xff092C4C),
                            fontWeight: FontWeight.w400
                    ),
                  ),
                    AppPassword(
                      controller: _confirmpasswordController,
                      enabled: true,
                      hintText: 'P4ssw@rd',
                      maxlen: 8,
                      // onChanged: (value) => reset_password(),
                      ),
                      SizedBox(height: screenHeight(context) * 0.27,),
                      Center(
                        child: ElevatedButton(
                        style: ButtonStyle(
          elevation: WidgetStateProperty.all(5),
          overlayColor: WidgetStateProperty.all(Color.fromARGB(255, 20, 55, 101).withOpacity(0.5)),
          backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 97, 144, 238)),
          foregroundColor: WidgetStateProperty.all(Color(0xffe3f2fd)),
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 20))
                        ),
                        onPressed: _errorMessage == null && _confirmpasswordController.text.isNotEmpty
                        ? ()=> delete_me_when_the_logic_is_readdy()
                        : reset_password, 
                      child: Text("Reset Password",
                      style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              // fontFamily: 'SourceSansPro',
              color: Color(0xffe3f2fd),
              ),
                      )
                      ),
                      ),
                      Center(
                        child: TextButton(onPressed:(){
                                    Navigator.pop(context);
                                  },
                                      child:const Text('Back to Login',
                                        style: TextStyle(
                                          color: Color(0xff0085FF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontFamily: 'SourceSansPro',
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xff0085FF),
                                        ),
                                      )
                                  ),
                      )
                ],
              )
            ),
          ),
          ]
        ),
      )
    );
  }
}


//fix the error in the password field...