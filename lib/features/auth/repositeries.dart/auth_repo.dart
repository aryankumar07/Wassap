import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/common/repoistory/common_firebase_repo.dart';
import 'package:wasap/common/utils.dart';
import 'package:wasap/features/auth/screens/otp_screen.dart';
import 'package:wasap/features/auth/screens/user_info.dart';
import 'package:wasap/models/user_model.dart';
import 'package:wasap/screens/mobile_screen.dart';

final authRepoProvider = Provider((ref) => 
AuthRepo(auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepo({required this.auth,required this.firestore});

  Future<UserModel?> getCurrentUserData() async {
    print('fetching user data');
    UserModel? user;
    var userData = await firestore.collection('user').doc(auth.currentUser?.uid).get();
    if(userData.data()!=null){
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signInWithNumber( BuildContext context ,String PhoneNumber) async {
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: PhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{
          await auth.signInWithCredential(credential);
        },
         verificationFailed: (FirebaseAuthException e){
            if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
         },
          codeSent: (String verificationId, int? resendToken) async {
            Navigator.pushNamed(context, OTPscreeen.routeName,arguments: verificationId);
          },
           codeAutoRetrievalTimeout: (String verificationId){});
    } on FirebaseAuthException catch (e) {
      showSnacks(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP
  }) async {
    try{
      // necessary for authenoication using otp
      PhoneAuthCredential credential = PhoneAuthProvider
      .credential(verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      Navigator
      .pushNamedAndRemoveUntil(
        context, UserInfoScreeen.routeName, (route) => false);
    }on FirebaseAuthException catch (e) {
      showSnacks(context: context, content: e.message!);
    }
  }

  void saveUserData({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try{
      String uid = auth.currentUser!.uid;
      String PhotoUrl = 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60';
      if((profilePic!=null)){
        PhotoUrl = await  ref
        .read(commonFirebaseStorageRepoProvider)
        .storageFileToFirebase('Profilepic/${uid}', profilePic);
      }

      var user = UserModel(
        name: name, 
        uid: uid, 
        profilePic: PhotoUrl, 
        isOnline: true, 
        phoneNumber: auth.currentUser!.uid, 
        groupId: []);

      await firestore.collection('user').doc(uid).set(user.toMap());

      Navigator
      .pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => MobileScreen()), 
        (route) => false);
    }catch (e) {
      showSnacks(context: context, content: e.toString());
    }
  }

}

