import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class PropertyDetail extends StatefulWidget{
  final String prop_id;
  final String image_path;
  final String title;
  final String location;

  const PropertyDetail({
    super.key,
    required this.image_path,
    required this.prop_id,
    required this.title,
    required this.location
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
              left: screenWidth(context)* .1,
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
          end: .65,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                    color: Color(0xff212529),
                   ),
                    children: [
                      TextSpan(
                        text: widget.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                      TextSpan(
                        text: "\nThis property is located in ${widget.location}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                      )
                    ]
                  )
                  )
          )
          ),
      
      ],
    )
   );
  }
}