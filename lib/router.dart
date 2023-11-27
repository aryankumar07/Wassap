import 'package:flutter/material.dart';
import 'package:wasap/common/error.dart';
import 'package:wasap/features/auth/screens/login_screen.dart';
import 'package:wasap/features/auth/screens/otp_screen.dart';
import 'package:wasap/features/auth/screens/user_info.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),);
    case OTPscreeen.routeName:
    final verificationId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => OTPscreeen(verificationId: verificationId,),);
    case UserInfoScreeen.routeName:
        return MaterialPageRoute(
          builder: (context) => UserInfoScreeen(),);
    default:
      return MaterialPageRoute(
        builder: (context)=>
        Scaffold(
          body: ErrorScreen(error: "This Page Doesn't Exist"),
        ));
  }
}