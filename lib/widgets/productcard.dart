// import 'package:flutter/material.dart';

// class productcard extends StatefulWidget {
//   const productcard({ Key? key }) : super(key: key);

//   @override
//   State<productcard> createState() => _productcardState();
// }

// class _productcardState extends State<productcard> {
//   @override
//   Widget build(BuildContext context, images, title, subTitle, price) {
//         return Card(
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.4 + 10,
//         height: MediaQuery.of(context).size.height * 0.3,
//         margin: EdgeInsets.all(15.0),
//         padding: EdgeInsets.all(10.0),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: Color(0xff17191f),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Stack(
//           alignment: Alignment.topRight,
//           children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 2.0,
//                             spreadRadius: 1.0,
//                             color: Color(0xff30221f),
//                           ),
//                         ],
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage(images),
//                         ),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           title,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         Text(
//                           subTitle,
//                           style: const TextStyle(
//                             color: Color(0xffaeaeae),
//                             fontSize: 10,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 const Text(
//                                   "\Rp.\t",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xffd17842)),
//                                 ),
//                                 Text(
//                                   "$price",
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Color(0xffd17842),
//                                 borderRadius: BorderRadius.circular(7),
//                               ),
//                               child: const Icon(
//                                 Icons.add,
//                                 size: 25,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//   }
// }

// // class ProductCard extends StatelessWidget {
// //   const ProductCard({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context, images, title, subTitle, price) {
// //     return Card(
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * 0.4 + 10,
// //         height: MediaQuery.of(context).size.height * 0.3,
// //         margin: EdgeInsets.all(15.0),
// //         padding: EdgeInsets.all(10.0),
// //         alignment: Alignment.center,
// //         decoration: BoxDecoration(
// //           color: Color(0xff17191f),
// //           borderRadius: BorderRadius.circular(20.0),
// //         ),
// //         child: Stack(
// //           alignment: Alignment.topRight,
// //           children: [
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Expanded(
// //                     flex: 2,
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         boxShadow: [
// //                           BoxShadow(
// //                             blurRadius: 2.0,
// //                             spreadRadius: 1.0,
// //                             color: Color(0xff30221f),
// //                           ),
// //                         ],
// //                         image: DecorationImage(
// //                           fit: BoxFit.cover,
// //                           image: AssetImage(images),
// //                         ),
// //                         borderRadius: BorderRadius.circular(20.0),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         Text(
// //                           title,
// //                           style: const TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 3,
// //                         ),
// //                         Text(
// //                           subTitle,
// //                           style: const TextStyle(
// //                             color: Color(0xffaeaeae),
// //                             fontSize: 10,
// //                           ),
// //                         ),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Row(
// //                               children: [
// //                                 const Text(
// //                                   "\Rp.\t",
// //                                   style: TextStyle(
// //                                       fontWeight: FontWeight.bold,
// //                                       color: Color(0xffd17842)),
// //                                 ),
// //                                 Text(
// //                                   "$price",
// //                                   style: const TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: Colors.white,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                             Container(
// //                               decoration: BoxDecoration(
// //                                 color: Color(0xffd17842),
// //                                 borderRadius: BorderRadius.circular(7),
// //                               ),
// //                               child: const Icon(
// //                                 Icons.add,
// //                                 size: 25,
// //                                 color: Colors.white,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       );
// //   }
// // }
