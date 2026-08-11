import 'package:find_my_apartment/Presentation/Abstract/pwrdfield.dart';
import 'package:find_my_apartment/Presentation/Abstract/textfield.dart';
import 'package:flutter/material.dart';

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

  void reset_password() async{
    if(_resetkey.currentState!.validate()){
      String newPassword = _newpasswordController.text;
      String confirmPassword = _confirmpasswordController.text;

      if(newPassword == confirmPassword){
        // Perform password reset logic here
        // For example, you can call a function to update the password in your authentication service
        // After successful password reset, you can navigate back or show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Still working on the logic but proceed for now')),
        );
        // Navigator.pop(context);
        return null;
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Color(0xffe3f2fd),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 195, 219, 237)),
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    margin: const EdgeInsets.only(top: 45,left: 15),
                    child: Center(
                      child: IconButton(onPressed: (){Navigator.pop(context);},
                        icon: const Icon(Icons.keyboard_arrow_left,size: 40,),
                        padding: const EdgeInsets.symmetric(vertical: 1,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 5),
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
                                    fontSize:16,
                                    color: Color(0xff092C4C),
                                    fontWeight: FontWeight.w400
                            ),
                          ),
                          Password(
                            controller: _newpasswordController, 
                            hintText: 'P4ssw@rd',
                            validator: (v){
                                  if(v!.isEmpty){
                                    return "This field is required";
                                  }
                                  reset_password();
                                },
                            ),
                            const Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                                    fontSize:16,
                                    color: Color(0xff092C4C),
                                    fontWeight: FontWeight.w400
                            ),
                          ),
                            AppPassword(
                              controller: _confirmpasswordController,
                              hintText: 'P4ssw@rd',
                              validator: (v){
                                  if(v!.isEmpty){
                                    return "This field is required";
                                  }
                                  reset_password();
                                },
                              ),
                              SizedBox(height: 90,),
                              Center(
                                child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(5),
                  overlayColor: WidgetStateProperty.all(Color.fromARGB(255, 20, 55, 101).withOpacity(0.5)),
                  backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 97, 144, 238)),
                  foregroundColor: WidgetStateProperty.all(Color(0xffe3f2fd)),
                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 20))
                ),
                onPressed: (){
                  if(_resetkey.currentState!.validate()){
                    reset_password();
                  }
                }, 
              child: Text("Reset Password",
              style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'SourceSansPro',
                      color: Color(0xffe3f2fd),
                      ),
              )
              ),
                              )
                        ],
                      )
                    ),
                  )
              ],
            )
          ],
        ),
      )
    );
  }
}