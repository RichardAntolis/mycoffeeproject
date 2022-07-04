import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycoffee/dbservices.dart';
import 'package:mycoffee/main.dart';
import 'package:mycoffee/models/product.dart';
import 'package:mycoffee/screens/detailscreen.dart';
import 'package:mycoffee/screens/login.dart';

import '../models/usermodel.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

User? user = FirebaseAuth.instance.currentUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
}

class _HomeRouteState extends State<HomeRoute> {
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    // FirebaseFirestore.instance.collection("featured").doc(product!.uid).get().then((value))
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildWelcomeCoffee({firstName}) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                "Hello, ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "$firstName",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: const [
              Text(
                "Enjoy your ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Coffee",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      );
    }

    Widget buildSingleItem({
      images,
      title,
      subTitle,
      price,
      context,
    }) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailsPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4 + 10,
          height: MediaQuery.of(context).size.height * 0.3,
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff17191f),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            color: Color(0xff30221f),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(images),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          subTitle,
                          style: const TextStyle(
                            color: Color(0xffaeaeae),
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "\Rp.\t",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffd17842)),
                                ),
                                Text(
                                  "$price",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffd17842),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildSingleItemCoffee({title, subtitle, images, price}) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4 + 10,
          height: MediaQuery.of(context).size.height * 0.4 + 10,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff17191f),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            color: Color(0xff30221f),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(images),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Color(0xffaeaeae),
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "\Rp.\t",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffd17842)),
                                ),
                                Text(
                                  "$price",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffd17842),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color(0xffEBDBCC),
        body: ListView(
          children: [
            SafeArea(
                child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(children: <Widget>[
                      //Welcome
                      _buildWelcomeCoffee(firstName: loggedInUser.firstName),
                      SizedBox(
                        height: 20,
                      ),

                      //Searching
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xffDACABD),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Find your coffee...",
                              hintStyle: TextStyle(color: Color(0xff3c4046)),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[500],
                              )),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        child: Row(
                          children: [
                            Text("Featured", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),

                      SingleChildScrollView(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: Database.getCoffee(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text("Error");
                              } else if (snapshot.hasData ||
                                  snapshot.data != null) {
                                return ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot dsData =
                                          snapshot.data!.docs[index];
                                      String lvName = dsData['title'];
                                      String lvSubTitle = dsData['subtitle'];
                                      String lvImages = dsData['images'];
                                      String lvPrice = dsData['price'];
                                      return Column(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 12.0, 0, 12.0),
                                              child: SingleChildScrollView(
                                                physics: BouncingScrollPhysics(),
                                                scrollDirection: Axis.horizontal,
                                                child: buildSingleItem(
                                                  context: context,
                                                  images: lvImages,
                                                  title: lvName,
                                                  subTitle: lvSubTitle,
                                                  price: lvPrice,
                                                ),
                                              )),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 8.0),
                                    itemCount: snapshot.data!.docs.length);
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.brown,
                                  ),
                                ),
                              );
                            }),
                      )
                    ]))),
          ],
        ));

    //   SingleChildScrollView(
    //     padding: const EdgeInsets.all(8.0),
    //     child: StreamBuilder<QuerySnapshot>(
    //         stream: Database.getData(),
    //         builder: (context, snapshot) {
    //           if (snapshot.hasError) {
    //             return const Text("Error");
    //           } else if (snapshot.hasData ||
    //               snapshot.data != null) {
    //             return ListView.separated(
    //                 shrinkWrap: true,
    //                 itemBuilder: (context, index) {
    //                   DocumentSnapshot dsData =
    //                       snapshot.data!.docs[index];
    //                   String lvName = dsData['title'];
    //                   String lvSubTitle = dsData['subtitle'];
    //                   String lvImages = dsData['images'];
    //                   String lvPrice = dsData['price'];
    //                   return Column(
    //                     children: [
    //                       Container(
    //                           margin: EdgeInsets.fromLTRB(
    //                               0, 12.0, 0, 12.0),
    //                           child: SingleChildScrollView(
    //                             physics: BouncingScrollPhysics(),
    //                             scrollDirection: Axis.horizontal,
    //                             child: buildSingleItem(
    //                               context: context,
    //                               images: lvImages,
    //                               title: lvName,
    //                               subTitle: lvSubTitle,
    //                               price: lvPrice,
    //                             ),
    //                           )),
    //                     ],
    //                   );
    //                 },
    //                 separatorBuilder: (context, index) =>
    //                     SizedBox(height: 8.0),
    //                 itemCount: snapshot.data!.docs.length);
    //           }
    //           return const Center(
    //             child: CircularProgressIndicator(
    //               valueColor: AlwaysStoppedAnimation<Color>(
    //                 Colors.brown,
    //               ),
    //             ),
    //           );
    //         }),
    //   )
    // ]))));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
                        


                  // StreamBuilder<QuerySnapshot>(
                  //     stream: Database.getData(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasError) {
                  //         return Text("Caught an error in the firebase...");
                  //       } else if (snapshot.hasData || snapshot.data != null) {
                  //         return ListView.separated(
                  //           shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               DocumentSnapshot dsData =
                  //                   snapshot.data!.docs[index];
                  //               String lvName = dsData['title'];
                  //               String lvSubTitle = dsData['subtitle'];
                  //               String lvImages = dsData['images'];
                  //               String lvPrice = dsData['price'];
                  //               return Container(
                  //                 child: Column(
                  //                   children: [
                  //                     Text(lvName),
                  //                     Text(lvSubTitle),
                  //                     Text(lvImages),
                  //                     Text(lvPrice)
                  //                   ],
                  //                 ),
                  //               );
                  //               // return Column(
                  //               //   children: [
                  //               //     Expanded(
                  //               //       child: GridView.count(
                  //               //         crossAxisCount: 2,
                  //               //         children: <Widget>[
                  //               //           SizedBox(
                  //               //             height: 200, // constrain height
                  //               //             child: ListView(
                  //               //               shrinkWrap: true,
                  //               //               children: [
                  //               //                 _buildSingleItemCoffee(
                  //               //                   title: lvName,
                  //               //                   subtitle: lvSubTitle,
                  //               //                   images: lvImages,
                  //               //                   price: lvPrice,
                  //               //                 ),
                  //               //               ],
                  //               //             ),
                  //               //           )
                  //               //         ],
                  //               //       ),
                  //               //     ),
                  //               //   ],
                  //               // );
                  //             },
                  //             separatorBuilder: (context, index) =>
                  //                 SizedBox(height: 8.0),
                  //             itemCount: snapshot.data!.docs.length);
                  //       }
                  //       return const Center(
                  //         child: CircularProgressIndicator(
                  //           valueColor: AlwaysStoppedAnimation<Color>(
                  //             Colors.brown,
                  //           ),
                  //         ),
                  //       );
                  //     })
                    // return Expanded(
                    //     child: GridView.count(
                    //       crossAxisCount: 2,
                    //       children: <Widget>[
                    //         _buildSingleItemCoffee(
                    //           title: "Coffee",
                    //           subtitle: "Cappucino",
                    //           images:
                    //               "data:image/jpeg;base64,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",
                    //           price: "20000",
                    //         ),
                    //       ],
                    //     ),
                    //   );
                    // return const Center(
                    //   child: CircularProgressIndicator(
                    //     valueColor: AlwaysStoppedAnimation<Color>(
                    //       Colors.brown,
                    //     ),
                    //   ),
                    // );