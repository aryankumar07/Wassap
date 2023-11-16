import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/responsive/responsive_layout.dart';
import 'package:wasap/screens/mobile_screen.dart';
import 'package:wasap/screens/web_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "wassap UI",
      theme: ThemeData.dark().copyWith(
        // ignore: deprecated_member_use
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: ResponsiveLayout(mobileScreenLAyout: MobileScreen(),
       webScreenLayout: WebScreen()),
    );
  }
}