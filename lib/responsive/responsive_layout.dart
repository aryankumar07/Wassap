import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget{

  ResponsiveLayout({
    super.key,
    required this.mobileScreenLAyout,
    required this.webScreenLayout,
    });

  final Widget webScreenLayout;
  final Widget mobileScreenLAyout;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx,constraints){
        if(constraints.maxWidth > 900){
          // WEB SCREEN
          return webScreenLayout;
        }else{
          // MOBILE SCREEN
          return mobileScreenLAyout;
        }
      });
  }
}