import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/common/custom_button.dart';
import 'package:wasap/features/auth/email_auth.dart';
import 'package:wasap/features/auth/screens/login_screen.dart';

// class LandingScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 100),
//           child: Column(
//             children: [
//               SizedBox(height: 40,),
//               Text("Welcome To Wassap",
//               style: TextStyle(
//                 fontSize: 40,
//                 color: Colors.white,
//               ),
//               ),
//               SizedBox(height: 40,),
//               CircleAvatar(
//                 radius: 180,
//                 backgroundImage:AssetImage("assets/bg.png"),
//                 backgroundColor: backgroundColor,
//               ),
//               SizedBox(height: 100,),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
//                 child: Text('Read our privacy policy. Tap "Agree to Continue" to accept the term of service',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: (){},
//                child: Text("AGREE AND CONTINUE"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LandingScreen extends StatelessWidget {

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context,LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Welcome to Wassap",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: size.height / 9,
          ),
          Image.asset(
            "assets/bg.png",
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(
            height: size.height / 9,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Read our privacy policy. Tap "Agree to Continue" to accept the term of service',
              style: TextStyle(color: greyColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: size.width * .75,
              child: CustomButton(
                  text: 'AGREE AND CONTINUE', 
                  onPressed: () => navigateToLoginScreen(context) )
                  ),
          SizedBox(
            width: size.width*.75,
            child: CustomButton(
              text: 'Sign With Email',
               onPressed: () {
                Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EmailAuth()));
               } ),
          )
        ],
      )),
    );
  }
}
