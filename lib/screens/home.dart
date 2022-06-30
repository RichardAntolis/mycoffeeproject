import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mycoffee/dbservices.dart';
import 'package:mycoffee/screens/detailscreen.dart';
import 'package:mycoffee/screens/login.dart';
import '../models/usermodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  // Product? product = FirebaseAuth.instance.currentUser;
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
    Widget buildCoffeeCategory({categoryName, isSelected}) {
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Color(0xffd17842) : Color(0xff52555a),
              ),
            ),
            isSelected
                ? Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffd17842),
                    ),
                  )
                : Text(""),
          ],
        ),
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

    final introPage = Column(children: [
      Text(
        "Welcome to My Coffee",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black))
    ]);

    final categoryAvaialble = SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCoffeeCategory(
            categoryName: "Featured",
            isSelected: true,
          ),
          buildCoffeeCategory(
            categoryName: "Coffee",
            isSelected: false,
          ),
          buildCoffeeCategory(
            categoryName: "Non-Coffee",
            isSelected: false,
          ),
          buildCoffeeCategory(
            categoryName: "Food",
            isSelected: false,
          ),
          buildCoffeeCategory(
            categoryName: "Water",
            isSelected: false,
          ),
          buildCoffeeCategory(
            categoryName: "Snacks",
            isSelected: false,
          ),
        ],
      ),
    );

    final searching = Container(
      margin: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffDACABD),
        borderRadius: BorderRadius.circular(30),
      ),
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
    );

    return Scaffold(
        backgroundColor: Color(0xffEBDBCC),
        body: 
        StreamBuilder<QuerySnapshot>(
            stream: Database.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      ShrinkWrappingViewport(offset: ViewportOffset.zero());
                      DocumentSnapshot dsData = snapshot.data!.docs[index];
                      String lvName = dsData['title'];
                      String lvSubTitle = dsData['subtitle'];
                      String lvImages = dsData['images'];
                      String lvPrice = dsData['price'];
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                              child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: [
                                    buildSingleItem(
                                      context: context,
                                      images: lvImages,
                                      title: lvName,
                                      subTitle: lvSubTitle,
                                      price: lvPrice,
                                    ),
                                  ]))),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 8.0),
                    itemCount: snapshot.data!.docs.length);
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.brown,
                  ),
                ),
              );
            }));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
