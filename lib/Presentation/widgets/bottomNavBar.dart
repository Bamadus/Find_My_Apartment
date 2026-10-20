import 'package:find_my_apartment/Presentation/routes/main_app/explore.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/favorite.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/home.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/messages.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Landing_Screen extends StatefulWidget {
  const Landing_Screen({super.key});

  @override
  State<Landing_Screen> createState() => _Landing_ScreenState();
}

class _Landing_ScreenState extends State<Landing_Screen> {

  int myIndex = 0;
  final List<Widget> _pages = [
    Home(),
    Explore(),
    Favorites(),
    Messages()
  ];

  
@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBody: true,

    body: Stack(
      children: [
        // Main screen content
        Positioned.fill(
          child: IndexedStack(
            index: myIndex,
            children: _pages,
          ),
        ),

        // Floating bottom navigation bar
        Positioned(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).padding.bottom + 10,

          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff212529),
              borderRadius: BorderRadius.circular(35),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
            
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
            
                currentIndex: myIndex,
            
                onTap: (index) {
                  setState(() {
                    myIndex = index;
                  });
                },
            
                iconSize: 25,
                backgroundColor: const Color(0xff212529),
                selectedItemColor: const Color(0xfff8f9fa),
                unselectedItemColor: const Color(0xffd7e3fc),
            
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
            
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
            
                showSelectedLabels: false,
                showUnselectedLabels: true,
            
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.home_alt),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.compass),
                    activeIcon: Icon(Icons.explore),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.heart),
                    activeIcon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.message),
                    activeIcon: Icon(Icons.message),
                    label: 'Messages',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}