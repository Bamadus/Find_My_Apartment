import 'package:find_my_apartment/Presentation/routes/main_app/explore.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/favorite.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/home.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/messages.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  int myIndex = 0;
  List<Widget> _pages = [
    Home(),
    Explore(),
    Favorite(),
    Messages()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: 
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                onTap: (index) {
                  setState(() {
                    myIndex = index;
                  });
                },
                iconSize: 25,
                currentIndex: myIndex,
                backgroundColor: const Color(0xff33415c),//Color(0xff001524),
                selectedItemColor: const Color(0xfff8f9fa),
                unselectedItemColor:const Color(0xffd7e3fc),
                selectedLabelStyle: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  color:const Color(0xfff8f9fa),
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  color: Color(0xfff8f9fa),
                  fontWeight: FontWeight.w400,
                ),
                showSelectedLabels: false,
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,),label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.explore), label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "Favorite"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message), label: "Messages"),
                ]),
          ),
        ),
      body: IndexedStack(index: myIndex,children: _pages,)
    );
  }
}