import 'dart:ui';

import 'package:find_my_apartment/Presentation/widgets/drawer/drawer.dart';
import 'package:find_my_apartment/Presentation/widgets/home/card_model.dart';
import 'package:find_my_apartment/Presentation/widgets/home/category.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  bool _isDrawerOpen = false;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      drawer: CustomDrawer(),
      drawerScrimColor: Colors.black.withValues(alpha: 0.15),
      onDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
      },
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: screenHeight(context)* .09,
        backgroundColor:const Color(0xffF8F7F4),
        leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
              icon:  Icon(UniconsLine.bell, size: 30), // Use UniconsLine.notification for the notification icon
              onPressed: () {
                // Handle notification button press
              },
                      ),
            ),
        ]
      ),
      body: Stack(
        children: [
          Content(),
            if (_isDrawerOpen)
            Positioned.fill(
              child: IgnorePointer(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 6,
                    sigmaY: 6,
                  ),
                  child: Container(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}


class Content extends StatefulWidget{

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;

final GlobalKey<FormState> searchKey = GlobalKey<FormState>();
final TextEditingController searchController = TextEditingController();

@override
void initState() {
  super.initState();

  _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  _animationController.forward();
}

@override
void dispose() {
  _animationController.dispose();
  searchController.dispose();
  super.dispose();
}

Widget animateWidget({
  required Widget child,
  required double start,
  required double end,
  Offset begin = const Offset(0, 0.3),
}) {
  final animation = CurvedAnimation(
    parent: _animationController,
    curve: Interval(
      start,
      end,
      curve: Curves.easeOutCubic,
    ),
  );

  return FadeTransition(
    opacity: animation,
    child: SlideTransition(
      position: Tween<Offset>(
        begin: begin,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
  

  @override
  Widget build(BuildContext context) {
   return Container(
        padding: const EdgeInsets.only(left:20, right: 10),
        child: ListView(
          physics:const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            animateWidget(
              start: 0.1,
              end: 0.4,
              child: Text(
                'Discover\nyour new house!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  ),
              ),
            ),
            SizedBox(height: 15),
            animateWidget(
              start: 0.25,
              end: 0.55,
              begin: const Offset(-0.3, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: searchKey,
                      child: Container(
                             decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 248, 248),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                              BoxShadow(
                              color: Color(0xff495057).withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                             ),
                         ],
                        ),
                        child: TextFormField(
                          controller: searchController,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Search Places',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                              color: Color(0xff212529),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                              BoxShadow(
                              color: Color(0xff495057).withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                             ),
                         ],
                        ),
                    child: IconButton(
                      icon: Icon(Icons.filter_list, color:Color(0xfff8f9fa),),
                      onPressed: () {
                        // Handle filter button press
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            animateWidget(
              start: 0.4,
              end: 0.75,
              child: CategoryButton()),
            SizedBox(height: 20,),
            animateWidget(
              start: 0.6,
              end: 0.85,
              child: Text(
                'Property Nearby',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  ),
              ),
            ),
            SizedBox(height: 5,),
            animateWidget(
              start: 0.7,
              end: 1.0,
              child: Property_card())
          ],
        ),
      );
  }
}
// Widget _buildHomeRoute(){
//   final GlobalKey<FormState> searchKey = GlobalKey<FormState>();
//   final TextEditingController searchController =TextEditingController();

//   return 
// }