// import 'package:project/models/number-model.dart';
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// class Items extends StatelessWidget {
//   final Items family;
//   final Color color;
//   final String type;
//   const Items(
//       {super.key,
//       required this.family,
//       required this.color,
//       required this.type});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 90,
//       color: color,
//       child: Row(
//         children: [
//           Container(
//             child: Image.asset(Items.image),
//             color: Color(0xffFFF6DC),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   .ename,
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//                 Text(
//                   type.jname,
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(
//             flex: 1,
//           ),
//           Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: IconButton(
//                 onPressed: () {
//                   try {
//                     final player = AudioPlayer();
//                     player.play(AssetSource(type));
//                   } catch (ex) {
//                     print(ex);
//                   }
//                 },
//                 icon: Icon(
//                   Icons.play_arrow,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
