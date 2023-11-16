import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';

class WebSearchBar extends StatefulWidget{
  @override
  State<WebSearchBar> createState() => _WebSearchBarState();
}

class _WebSearchBarState extends State<WebSearchBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height*0.06, 
      width: MediaQuery.of(context).size.width*0.25,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor)
        )
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarColor,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search,size: 20,),),
          hintStyle: TextStyle(fontSize: 12),
          hintText: "Search a New Chat",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            )
          )
        ),
      ),
      );
  }
}