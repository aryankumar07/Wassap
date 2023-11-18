import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/widgets/contacts_list.dart';

class MobileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
       child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          title: Text(
            "Wassap",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: (){},
                 icon: Icon(Icons.search,color: Colors.grey,)),
              IconButton(
                onPressed: (){},
                 icon: Icon(Icons.more_vert,color: Colors.grey,))
            ],
            bottom: TabBar(
              indicatorColor: tabColor,
              indicatorWeight: 4,
              labelColor: tabColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold
              ),
              tabs: [
                Tab(text: "CHATS",),
                Tab(text: "STATUS",),
                Tab(text: "CALLS",),
              ]
            ),
        ),
        body: ContactList(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: tabColor,
          child: Icon(Icons.comment,color: Colors.white,),
        ),
       ));
  }
}