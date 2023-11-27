import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loader extends StatelessWidget{

  loader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: 
      CircularProgressIndicator(),
      );
  }
}