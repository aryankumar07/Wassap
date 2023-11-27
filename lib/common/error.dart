import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget{
  ErrorScreen({super.key,required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(error),
    );
  }
}