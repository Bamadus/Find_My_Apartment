import 'package:flutter/material.dart';

class Snackbar extends StatefulWidget{
  @override
  State<Snackbar> createState() => _SnackbarState();
}

class _SnackbarState extends State<Snackbar> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'This field is Required',
              style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize:18,
                                    color: Color(0xffedf2fb),     
                        )),
                          backgroundColor: Color(0xffba324f),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(15),
                          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 150),
              ),
        );;
  }
}