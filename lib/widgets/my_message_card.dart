import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';

class MyMessageCard extends StatelessWidget{
  MyMessageCard({super.key,required this.message,required this.date});
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: messageColor,
          margin: EdgeInsetsDirectional.symmetric(horizontal: 15,vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 20,
                  left: 10,
                  right: 30,
                ),
                child: Text(message,style: TextStyle(fontSize: 16),),
                ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(date,style: TextStyle(fontSize: 13,color: Colors.white60),),
                    const SizedBox(width: 5,),
                    Icon(
                      Icons.done_all,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ))
            ],
          ),
        ),
      ),
    );
  }
}

// class MyMessageCard extends StatelessWidget{
//   MyMessageCard({super.key,required this.message,required this.date});
//   final String message;
//   final String date;
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         maxWidth: MediaQuery.of(context).size.width-45,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10,bottom: 10,right: 20),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: Card( color: messageColor, child: Text(message))
//               ),
//           ),
//            Padding(
//               padding: const EdgeInsets.only(right: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(date),
//                   SizedBox(width: 5,),
//                   Icon(Icons.done_all,size: 20, color: Colors.white,)
//                 ],
//               ),
//             ),

//         ],
//       ),
//     );
//   }
// }