import 'package:flutter/material.dart';
import 'package:wasap/common/error.dart';
import 'package:wasap/features/auth/screens/login_screen.dart';
import 'package:wasap/features/auth/screens/otp_screen.dart';
import 'package:wasap/features/auth/screens/user_info.dart';
import 'package:wasap/features/select_contacts/screens/select_contacts.screen.dart';
import 'package:wasap/screens/mobile_chat_screen.dart';

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
    case SelectContactScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => SelectContactScreen(),);
    case MobileChatScreen.routeName:
        final arguments = settings.arguments as Map<String,dynamic>;
        final name = arguments['name'];
        final uid = arguments['uid'];
        return MaterialPageRoute(
          builder: (context) => MobileChatScreen(name: name,uid: uid,),);
    default:
      return MaterialPageRoute(
        builder: (context)=>
        Scaffold(
          body: ErrorScreen(error: "This Page Doesn't Exist"),
        ));
  }
}