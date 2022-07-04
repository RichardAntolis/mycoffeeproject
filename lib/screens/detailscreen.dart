import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mycoffee/screens/checkout.dart';

import '../dbservices.dart';

class DetailsPage extends StatefulWidget {


  @override
  // ignore: no_logic_in_create_state
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  String? _title;
  String? _subtitle;
  String? _images;
  String? _price;

  @override
  Widget build(BuildContext context) {
    final imageDetail = Card(
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
    );

    Widget _buildImageDetail ({images})
    {
      return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(images, fit: BoxFit.fill,),
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(15),
    );
    }

    Widget _buildTitleDetail({title, subtitle})
    {
      return Container(
        child: Card(
            child: Container(
      margin: EdgeInsets.all(15),
      child: Column(children: [
        //Category
        Text(
          "$title",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("$subtitle"),
        Container(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "AAA",
              ))
            ],
          ),
        ),
      ]),
    ))
      );
    }

    final titleDetail = Container(
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
    )));

    final priceList = Container(
        child: Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Price",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      "Rp.20000",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.brown,
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
        ])));

    final addCart = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: Colors.brown,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CheckOutL()));
        },
        child: 
          MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CheckOutL()));},
            child: Text(
              "Add to Cart",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
          _buildTitleDetail(title: _title, subtitle: _subtitle),
          SizedBox(height: 10),
          titleDetail,
          SizedBox(height: 15),
          priceList,
          SizedBox(height: 15),
          addCart
        ],
    ));
        // body: StreamBuilder<QuerySnapshot>(
        //     stream: Database.getData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return const Text("Error");
        //       } else if (snapshot.hasData || snapshot.data != null) {
        //         return ListView.separated(
        //             itemBuilder: (context, index) {
        //               ShrinkWrappingViewport(offset: ViewportOffset.zero());
        //               DocumentSnapshot dsData2 = snapshot.data!.docs[index];
        //               String lvName = dsData2['title'];
        //               String lvSubTitle = dsData2['subtitle'];
        //               String lvImages = dsData2['images'];
        //               String lvPrice = dsData2['price'];
        //               String lvDescription = dsData2 ['description'];
        //               return Column(
        //                 children: [
        //                   _buildImageDetail(
        //                     images: lvImages
        //                   ),
        //                   _buildTitleDetail(
        //                     title: lvName,
        //                     subtitle: lvSubTitle,
        //                     description: lvDescription
        //                   )
        //                 ],
        //               );
        //             },
        //             separatorBuilder: (context, index) => SizedBox(height: 8.0),
        //             itemCount: snapshot.data!.docs.length);
        //       }
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           valueColor: AlwaysStoppedAnimation<Color>(
        //             Colors.brown,
        //           ),
        //         ),
        //       );
        //     }));
  }
}
                    
      // body: ListView(
      //   children: [
      //     imageDetail,
      //     SizedBox(height: 10),
      //     titleDetail,
      //     SizedBox(height: 15),
      //     priceList,
      //     SizedBox(height: 15),
      //     addCart
      //   ],

