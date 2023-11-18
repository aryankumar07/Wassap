import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wasap/colors.dart';
import 'package:wasap/info.dart';

// class WebChatAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       color: webAppBarColor,
//       height: MediaQuery.of(context).size.height*0.077,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 10,left: 16,bottom: 6),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Row(
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundColor: Colors.amber,
//                 ),
//                 SizedBox(width: 23,),
//                 Text("Name of the Taped person")
//               ],
//             ),
//             Row(
//               children: [
//                 IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.grey,)),
//                 IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.grey,)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class WebChatAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height*0.077,
      width: MediaQuery.of(context).size.width*0.75,
      color: webAppBarColor,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.01,),
              Text(info[0]['name'].toString(),style: TextStyle(fontSize: 18),)
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.grey,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.grey,)),
            ],
          )
        ],
      ),
    );
  }
}