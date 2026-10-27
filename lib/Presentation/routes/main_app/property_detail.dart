import 'package:find_my_apartment/Presentation/widgets/bottons/slide_action_button.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class PropertyDetail extends StatefulWidget{
  final String prop_id;
  final String image_path;
  final String title;
  final String location;
  final String price;

  const PropertyDetail({
    super.key,
    required this.image_path,
    required this.prop_id,
    required this.title,
    required this.location,
    required this.price
  });

  @override
  State<PropertyDetail> createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail>with SingleTickerProviderStateMixin {
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  late final AnimationController _animationController;

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
   return Scaffold(
        backgroundColor:const Color(0xffF8F7F4),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            children: [
              Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 60),
              height: screenHeight(context)* .49,
              width: screenWidth(context)* .95,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Hero(
                          tag: 'property_${widget.prop_id}',
                          child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                widget.image_path,
                width: double.infinity,
                height: 300,
                fit: BoxFit.fill,
              ),
                          ),
                        ),
                          ),
            Positioned(
              top: screenHeight(context)*.1,
              left: screenWidth(context)* .05,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xffe9ecef).withOpacity(.6),
                borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(UniconsLine.arrow_left, size: 45,)
                  ),
              ),
            )
            ]
          ),
        ),
        SizedBox(height: 20,),
        animateWidget(
          start: .3, 
          end: .95,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Text("Property Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff343a40)
                ),
                ),
                Row(
                  children: [
                    Icon(UniconsLine.location_pin_alt),
                    Text(widget.location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff343a40)
                  ),
                  ),
                const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0),
                    child: Text(widget.price,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff343a40)
                    ),
                    ),
                  ),
                  ]
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffdee2e6).withOpacity(.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                  )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(UniconsLine.bed, color: Color(0xff343a40),),
                          Text(' 3-5')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(UniconsLine.bath, color: Color(0xff343a40)),
                          Text(' 4-6')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(UniconsLine.car_sideview, color: Color(0xff343a40),),
                          Text(' 3')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(UniconsLine.keyhole_square_full, color: Color(0xff343a40),),
                          Text(' 3')
                        ],
                      )

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Text('Don\'t miss the chance to get this fantastic home with too much amenities for one property.'),
                SizedBox(height:50 ,),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SlideActionButton(
                    text: "Book Now",
                    onComplete: () {
                      Navigator.pop(context);
                    //    Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //     builder: (context) => const N(),
                    //   ),
                    // );
                    },
                  ),
                )
              ],
            )
          )
          ),
      
      ],
    )
   );
  }
}