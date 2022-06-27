import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final addCart = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: Colors.brown,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {

        },
        child: Text(
          "Add to Cart",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xffEBDBCC),
      body: ListView(
        children: [
          //Images

          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              'assets/images/cappucino.png',
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(15),
          ),

          //Title, subTitle and Description about coffee
          Container(
              child: Card(
                  child: Container(
            margin: EdgeInsets.all(15),
            child: Column(children: [
              //Category
              Text(
                "Coffee",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Cappucino"),
              Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    ))
                  ],
                ),
              ),
            ]),
          ))),

          //Price List
          Container(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Size",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Row(
                          children: [
                            Text(
                              "Small",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 163, 121, 125),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(Icons.remove),
                              onTap: () {},
                            ),
                            Text("0"),
                            GestureDetector(
                              child: Icon(Icons.add),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Row(
                          children: [
                            Text(
                              "Medium",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 163, 121, 125),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(Icons.remove),
                              onTap: () {},
                            ),
                            Text("0"),
                            GestureDetector(
                              child: Icon(Icons.add),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Row(
                          children: [
                            Text(
                              "Large",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 163, 121, 125),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(Icons.remove),
                              onTap: () {},
                            ),
                            Text("0"),
                            GestureDetector(
                              child: Icon(Icons.add),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //ADD TO CART
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          addCart,
        ],
      ),
    );
  }
}

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //       leading: IconButton(
  //         icon: Icon(
  //           Icons.arrow_back, color: Colors.brown),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ),
  //     backgroundColor: Color(0xfff3b2b7),
  //     body: Stack(
  //       children: [
  //         ListView(
  //           children: [
  //             //Images
  //             Card(
  //               semanticContainer: true,
  //               clipBehavior: Clip.antiAliasWithSaveLayer,
  //               child: Image.asset(
  //                 'assets/images/cappucino.png',
  //                 fit: BoxFit.fill,
  //               ),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10.0),
  //               ),
  //               elevation: 5,
  //               margin: EdgeInsets.all(10),
  //             ),
  //             //Descriptions
  //             Container(
  //               padding: EdgeInsets.all(10),
  //               child: Card(
  //                 color: Color.fromARGB(255, 220, 161, 166),
  //                 child: Container(
  //                   padding: EdgeInsets.all(12),
  //                   child: Column(
  //                     children: [
  //                       //Category
  //                       Text(
  //                         "Coffee",
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold),
  //                       ),
  //                       //Title
  //                       Text("Cappucino"),
  //                       //Detail
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                             margin: EdgeInsets.fromLTRB(3, 12, 0, 0),
  //                             height: 35,
  //                             width: 100,
  //                             decoration: BoxDecoration(
  //                               color: Color.fromARGB(255, 163, 121, 125),
  //                               borderRadius: BorderRadius.circular(20),
  //                             ),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceEvenly,
  //                               children: <Widget>[
  //                                 GestureDetector(
  //                                   child: Icon(Icons.remove),
  //                                   onTap: () {},
  //                                 ),
  //                                 Text("1"),
  //                                 GestureDetector(
  //                                   child: Icon(Icons.add),
  //                                   onTap: () {},
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           Row(
  //                             children: [
  //                               Text(
  //                                 "Rp. 20000",
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               )
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
  //                         child: Row(
  //                           children: [
  //                             Expanded(child: Text(
  //                               "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
  //                             ))
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color(0xfff3b2b7),
  //     body: ListView(
  //       children: [
  //         Column(
  //           children: <Widget>[
  //             Card(
  //               child: Container(
  //                 height: 200,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: AssetImage("assets/images/cappucino.png")
  //                   )
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

