

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proje_lamp_2/ekran.dart';


void main(List<String> args) {
 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  color: Colors.transparent, // <-- Add this, if needed

      debugShowCheckedModeBanner: false,
      
      home: Ekran(),
      );
  }

}