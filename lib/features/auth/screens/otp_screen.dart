import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/features/auth/controller.dart/auth_controller.dart';

class OTPscreeen extends ConsumerWidget{
  static const String routeName = '/otp-screen';
  final String verificationId;
  OTPscreeen({super.key,required this.verificationId});

  void verifyOtp(WidgetRef ref, BuildContext context,String userOTP){
    ref.read(authControllerProvider).verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your OTP"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Verifying your Mobile Number",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 100,),
            Text(
              "we have sent an SMS with a code",
              style: TextStyle(
                fontSize: 16,
              ),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width*.50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "- - - - - -",
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  if(val.length==6){
                    verifyOtp(ref, context, val.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}