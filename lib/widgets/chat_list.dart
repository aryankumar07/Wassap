import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/info.dart';
import 'package:wasap/widgets/my_message_card.dart';
import 'package:wasap/widgets/sender_,essage_card.dart';

class ChatList extends StatelessWidget{
  ChatList({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (ctx,index) {
        if(messages[index]['isMe']==true){
          return MyMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
            );
        }else{
          return SenderMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString()
            );
        }
      });
  }
}