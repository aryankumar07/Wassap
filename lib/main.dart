import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/common/error.dart';
import 'package:wasap/common/loader.dart';
import 'package:wasap/features/auth/controller.dart/auth_controller.dart';
import 'package:wasap/features/auth/screens/user_info.dart';
import 'package:wasap/features/landing/screens/landing_screen.dart';
import 'package:wasap/firebase_options.dart';
import 'package:wasap/responsive/responsive_layout.dart';
import 'package:wasap/router.dart';
import 'package:wasap/screens/mobile_screen.dart';
import 'package:wasap/screens/web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget{

  MyApp({super.key});


  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: "wassap UI",
  //     theme: ThemeData.dark().copyWith(
  //       // ignore: deprecated_member_use
  //       scaffoldBackgroundColor: backgroundColor,
  //     ),
  //     home: ResponsiveLayout(mobileScreenLAyout: MobileScreen(),
  //      webScreenLayout: WebScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "wassap",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme()
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: LandingScreen(),
      home: ref.watch(UserDataAuthProvider)
      .when(
      data: (user) {
        if(user==null){
          return LandingScreen();
        }
        return MobileScreen();
      }, 
      error: (err,trce) {
        return ErrorScreen(error: err.toString()
        );
      }, 
      loading: () {
        return loader();
      }),
    );
  }
}