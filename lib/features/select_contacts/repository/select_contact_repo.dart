import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/common/utils.dart';
import 'package:wasap/models/user_model.dart';
import 'package:wasap/screens/mobile_chat_screen.dart';

final SelectContactRepoProvider = Provider(
  (ref) => SelectContactRepo(
    firestore: FirebaseFirestore.instance
    )
);

class SelectContactRepo{
  final FirebaseFirestore firestore;
  SelectContactRepo({required this.firestore});

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try{
      if( await FlutterContacts.requestPermission()){
        contacts =  await FlutterContacts.getContacts(withProperties: true);
      }
    }catch (e) {
      debugPrint(e.toString());
    }

    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try{
      var userCollection = await firestore.collection('user').get();
      bool isFound = false;
      for(var document in userCollection.docs){
        var userData = UserModel.fromMap(document.data());
        print(userData);
        String selectedPhoneNum = selectedContact.phones[0].number.replaceAll(" ","");
        if(selectedPhoneNum==userData.phoneNumber){
          isFound = true;
          Navigator.pushNamed(context, MobileChatScreen.routeName,arguments: {
            'name':userData.name,
            'uid':userData.uid,
          },);
        }
        if(!isFound){
          showSnacks(context: context, content: "this number doesnot exist in the app");
        }
      }
    }catch (e) {
      showSnacks(context: context, content: e.toString());
    }
  }

}