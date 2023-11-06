// import 'package:dockggu/component/medalinfo.dart';
// import 'package:flutter/material.dart';

// import 'join_popup.dart';
// import 'profile_widget.dart';

// class a extends StatelessWidget {
//   const a({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width * 0.30,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
//             child: Center(
//                 child: ProfileWidget(
//               thumbPath:
//                   'https://images.mypetlife.co.kr/content/uploads/2023/01/03112035/bay._.curry_thumnail.png',
//               size: 75,
//               type: ProfileType.TYPE4,
//               nickname: "kancho",
//             )),
//           ),
//         ),
//         Positioned(
//           left: 60,
//           top: 45,
//           child: ElevatedButton(
//             onPressed: () {},
//             child: Icon(
//               Icons.settings,
//               size: 18,
//               color: Colors.black,
//             ),
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//                 Colors.white,
//               ),
//               shape: MaterialStateProperty.all<OutlinedBorder>(
//                 CircleBorder(),
//               ),
//               padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                 EdgeInsets.all(5),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class b extends StatelessWidget {
//   const b({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
//       width: MediaQuery.of(context).size.width * 0.45,
//       height: MediaQuery.of(context).size.height * 0.050,
//       child: Text(
//         '이닛님',
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class c extends StatelessWidget {
//   const c({super.key});

//   Widget _medal() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Column(
//           children: [
//             Image.asset(
//               'assets/3rd_medal.png',
//               height: 40,
//               width: 40,
//             ),
//             Text('2개'),
//           ],
//         ),
//         SizedBox(
//           width: 25,
//         ),
//         Column(
//           children: [
//             Image.asset(
//               'assets/2nd_medal.png',
//               height: 40,
//               width: 40,
//             ),
//             Text('2개'),
//           ],
//         ),
//         SizedBox(
//           width: 25,
//         ),
//         Column(
//           children: [
//             Image.asset(
//               'assets/1st_medal.png',
//               height: 40,
//               width: 40,
//             ),
//             Text('2개'),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 5),
//       width: MediaQuery.of(context).size.width * 0.50,
//       height: MediaQuery.of(context).size.height * 0.090,
//       child: _medal(),
//     );
//   }
// }

// class d extends StatelessWidget {
//   const d({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topRight,
//       padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
//       width: MediaQuery.of(context).size.width * 0.10,
//       child: GestureDetector(
//         child: Icon(
//           Icons.info,
//           size: 20,
//           color: Color(0xff999999),
//         ),
//         onTap: () {
//           showDialog(context: context, builder: (context) => MedalInfo());
//         },
//       ),
//     );
//   }
// }

// class GridViewWidget extends StatelessWidget {
//   const GridViewWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: GridView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: 4,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.white,
//             child: Center(
//               child: Column(
//                 children: [
//                   Image.asset(imageList[index]),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '눈에 갇힌 외딴 산장에서',
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     '히가시노 게이고',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Color(0xff9D9D9D),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// List<String> imageList = [
//   'assets/book.png',
//   'assets/book.png',
//   'assets/book.png',
//   'assets/book.png',
// ];
