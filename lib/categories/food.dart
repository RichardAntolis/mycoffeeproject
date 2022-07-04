import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mycoffee/dbservices.dart';
import 'package:mycoffee/screens/detailscreen.dart';

class foodroute extends StatefulWidget {
  const foodroute({ Key? key }) : super(key: key);

  @override
  State<foodroute> createState() => _foodrouteState();
}

class _foodrouteState extends State<foodroute> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
        backgroundColor: Color(0xffEBDBCC),
        appBar: AppBar(
          title: const Text('Food'),
        backgroundColor: Colors.brown,
        ),
        body: 
        ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: Database.getFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.separated(
                        shrinkWrap: true,
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
                }),
          ],
        ));
  }
}