import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/info.dart';
import 'package:wasap/screens/mobile_chat_screen.dart';

class ContactList extends StatelessWidget{

  ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: ListView.builder(
              shrinkWrap: true,
              itemCount: info.length,
              itemBuilder: (ctx,index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator
                        .of(context)
                        .push(MaterialPageRoute(
                          builder: (context)=>MobileChatScreen(
                            name: 'RR',
                            uid: "12345",
                          )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(info[index]['name'].toString()),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(info[index]['message'].toString(),style: TextStyle(fontSize: 15),),
                             ),
                             leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                info[index]['profilePic'].toString(),
                              ),
                             ),
                             trailing: Text(info[index]['time'].toString(),style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                    Divider(color: dividerColor,)
                  ],
                );
              }),
      );
  }
}