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
            sigmaX: 12,
            sigmaY: 12,
          ),
          child: Container(
            color: const Color(0xffF8F7F4)
                .withValues(alpha: 0.80),
            child: ListView(
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
                  leading: const Icon(Icons.settings_outlined, size: 30,),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_outlined, size: 30,),
                  title: const Text('Account'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}