import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/common/custom_button.dart';
import 'package:wasap/common/utils.dart';
import 'package:wasap/features/auth/controller.dart/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget{
  static const routeName = '/login-screen';
  LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen>{
  final PhoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PhoneController.dispose();
  }

  void pickCountry(){
    showCountryPicker(context: context, onSelect: (Country _country) {
      setState(() {
        country = _country;
      });
    });
  }

  void SendPhoneNumber(){
    String phonenumber = PhoneController.text.trim();
    if(country!=null && phonenumber.isNotEmpty ){
      ref
      .read(authControllerProvider)
      .signInWithPhone(context, '+${country!.phoneCode}$phonenumber');
    }else{
      showSnacks(context: context, content: 'Fill all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your Phone Number"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Watsapp need to verify your mobile Number"),
              SizedBox(height: 10,),
              TextButton(
                onPressed: pickCountry,
                 child: Text("Pick Country")),
              SizedBox(height: 5,),
              Row(
                children: [
                  if(country!=null) Text("+${country!.phoneCode}"),
                  SizedBox(width: 10,),
                  SizedBox(
                    width: size.width*0.75,
                    child: TextField(
                      controller: PhoneController,
                      decoration: InputDecoration(
                        hintText: "phone Number",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height*0.6,),
              SizedBox(
                width: 90,
                child: CustomButton(text: "NEXT", onPressed: SendPhoneNumber),
              )
            ],
          ),
        ),
      ),
    );
  }
}