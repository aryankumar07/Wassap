import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnacks({required BuildContext context,required String content}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content))
  );
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      image = File(pickedImage.path);
    }
    return image;
  }catch (e) {
    showSnacks(context: context, content: e.toString());
  }
}