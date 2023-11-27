import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';

class CustomButton extends StatelessWidget{
  CustomButton({super.key,required this.text,required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // ignore: deprecated_member_use
        primary: tabColor,
        minimumSize: Size(double.infinity, 50)
      ),
      onPressed: onPressed, 
      child: Text(
        text,
        style: TextStyle(
          color: blackColor,
        ),
      ));
    
  }
}