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
  List<Widget> widgetList = [
    Home(),
    Explore(),
    Favorite(),
    Messages()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xffedf2fb),
            selectedItemColor: const Color(0xff002855),
            unselectedItemColor:const Color(0xff5c677d),
            selectedLabelStyle: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 15,
              color:const Color(0xff002855),
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 15,
              // color:const Color.fromARGB(255, 10, 10, 10),
              fontWeight: FontWeight.w400,
            ),
            showSelectedLabels: false,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_off_rounded), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.heat_pump_rounded), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined), label: "Messages"),
            ]),
      body: IndexedStack(index: myIndex,children: widgetList,)
    );
  }
}