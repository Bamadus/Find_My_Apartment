import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _searchKey = GlobalKey<FormState>();
  final TextEditingController _searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F7F4),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        actions: [
          IconButton(
          icon:  Icon(UniconsLine.bell, size: 30), // Use UniconsLine.notification for the notification icon
          onPressed: () {
            // Handle notification button press
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right:15.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffe2eafc), // Set the background color to red
            ),
            child: IconButton(
              icon:  Icon(UniconsLine.user), // Use UniconsLine.notification for the notification icon
              onPressed: () {
                // Handle user button press
              },
            ),
          ),
        )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20.0, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover\nyour new house!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _searchKey,
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
                        controller: _searchController,
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
            SizedBox(height: 15),
            Row(
              children:[
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
                  child: Text('Houses'),)
              ]
            )
          ],
        ),
      ),
    );
  }
}