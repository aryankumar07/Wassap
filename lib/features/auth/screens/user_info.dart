import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/common/utils.dart';
import 'package:wasap/features/auth/controller.dart/auth_controller.dart';

class UserInfoScreeen extends ConsumerStatefulWidget{
  static const String routeName = '/user-info';

  @override
  ConsumerState<UserInfoScreeen> createState() => _UserInfoScreeenState();
}

class _UserInfoScreeenState extends ConsumerState<UserInfoScreeen> {
  final nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void selectImage () async{
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void SendUserData() async {
    String name = nameController.text.trim();
    if(name.isNotEmpty){
      ref.read(authControllerProvider).saveUserDataToFirestore(context, name, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Stack(
                children: [
                  image == null ? CircleAvatar(
                    radius: 100,
                    backgroundImage:
                     NetworkImage('https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
                  ) : CircleAvatar(
                    radius: 100,
                    backgroundImage:
                    FileImage(image!)
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: selectImage, 
                      icon: Icon(Icons.camera))),
                ],
              ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.85,
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your Name"
                    ),
                  ),
                ),
                IconButton(
                  onPressed: SendUserData,
                   icon: Icon(Icons.done))
              ],
            ),
          ],
        ),
      ),
    );
  }
}