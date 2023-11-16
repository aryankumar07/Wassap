import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';

class WebProfileBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebProfileBarState();
  }
}

class _WebProfileBarState extends State<WebProfileBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height*0.077,
      width: MediaQuery.of(context).size.width*0.25,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: dividerColor
          )
        ),
        color: webAppBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://media.cntraveler.com/photos/60596b398f4452dac88c59f8/16:9/w_3999,h_2249,c_limit/MtFuji-GettyImages-959111140.jpg"),),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: Colors.grey,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.grey,))
            ],
          ),
        ],
      ),
    ); 
  }
}