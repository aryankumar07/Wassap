import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/features/auth/repositeries.dart/auth_repo.dart';
import 'package:wasap/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepoistory = ref.watch(authRepoProvider);
  return AuthController(authRepo: authRepoistory,ref: ref);
});

final UserDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController{
  final AuthRepo authRepo;
  final ProviderRef ref;
  AuthController({required this.authRepo,required this.ref});
  void signInWithPhone(BuildContext context,String Phonenumber){
    authRepo.signInWithNumber(context, Phonenumber);
  }

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepo.getCurrentUserData();
    return user;
  }

  void verifyOTP(BuildContext context,String verificationId,String userOTP){
    authRepo.verifyOTP(
      context: context,
       verificationId: verificationId,
        userOTP: userOTP,
        );
  }

  void saveUserDataToFirestore(BuildContext context,String name,File? profilePic){
    authRepo.saveUserData(
      name: name, 
      profilePic: profilePic, 
      ref: ref, 
      context: context);
  }



}