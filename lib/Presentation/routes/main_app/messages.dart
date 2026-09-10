import 'package:flutter/material.dart';

class Messages extends StatefulWidget{
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Find My Apartment- Messages screen'),
      ),
    );
  }
}