import 'dart:ui';
import 'package:find_my_apartment/Presentation/widgets/drawer/curvedDrawerHead.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get currently logged-in user
    final User? user = FirebaseAuth.instance.currentUser;

    // Get username and email
    final String username = user?.displayName ?? 'USER';
    final String email = user?.email ?? '';

    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Container(
            color: const Color(0xffF8F7F4)
                .withValues(alpha: 0.80),
            child: ListView(
          physics:const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 300,
                  child: ClipPath(
                    clipper: CurvedHeaderClipper(),
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xff001a2c),
                        border: null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff8f9fa)
                            ),
                          ),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xfff8f9fa)

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 20),
                  child: Text('General',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person_4_outlined, size: 30,),
                  title: const Text('About Us',
                  style: TextStyle(
                    fontSize: 17
                  )
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.monitor_heart_outlined, size: 30,),
                  title: const Text('Activity',style: TextStyle(
                    fontSize: 17
                  )),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.monetization_on_outlined, size: 30,),
                  title: const Text('Payments'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined, size: 30,),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 70,),
                ListTile(
                  leading: Icon(Icons.logout_sharp, color: Color(0xffcb1b16),),
                  title: const Text('Sign Out',style: TextStyle(color: Color(0xffcb1b16))),
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: 
                Text(
                  "Sign Out Feature Loading...",
                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:18,
                                    color: Color(0xffedf2fb),     
                        )),
                          backgroundColor: Color(0xffb80c09),
                          duration: Duration(milliseconds: 650),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(15),
                          margin: const EdgeInsets.only(left: 15,
                          right: 15, 
                          bottom: 100
                          ),
                  ),
                );
                  },
                  ),
                Container(
                  margin: EdgeInsets.only(left: 120, right: 20),
                  child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffeaebed),
                          foregroundColor: Colors.black87,
                          // elevation: 4,
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                              color: Color(0xffd2cdc6),
                              width: .5
                            )
                          ),
                        ),
                        child: Text("Rate Our App",
                        style: TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}