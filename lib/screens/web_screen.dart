import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasap/widgets/contacts_list.dart';
import 'package:wasap/widgets/web_profile_bar.dart';
import 'package:wasap/widgets/web_search_bar.dart';

class WebScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactList(),
                ]),
            ),
          ),
            Container(
              width: MediaQuery.of(context).size.width*0.75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backgroundImage.png"),
                  fit: BoxFit.cover)
              ),
            )
        ],
      ),
    );
  }
}