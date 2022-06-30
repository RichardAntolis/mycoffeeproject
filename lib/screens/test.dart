import 'package:flutter/material.dart';
import 'package:mycoffee/screens/home.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class TestArea extends StatefulWidget {
  const TestArea({Key? key}) : super(key: key);

  @override
  State<TestArea> createState() => _TestAreaState();
}

class _TestAreaState extends State<TestArea> {
  @override
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
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        width: 340 * 0.4 + 10,
        height: 800 * 0.3,
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
                        image: AssetImage(images),
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

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffEBDBCC),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              //Intro Page
              children: [
                const Text(
                  "Welcome to My Coffee",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const Text(
                  "Hello World",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),

                //Searching
                Container(
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
                ),

                //Category Available
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCoffeeCategory(
                        categoryName: "All",
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
                ),
                const Text("Featured", style: TextStyle(
                  fontWeight: FontWeight.w400
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildSingleItem(
                          context: context,
                          images: "assets/images/cappucino.png",
                          title: "Cappuccino",
                          subTitle: "With Oat Milk",
                          price: 25000,
                        ),
                        buildSingleItem(
                          context: context,
                          images: "assets/images/cappucino.png",
                          title: "Cappuccino",
                          subTitle: "With Oat Milk",
                          price: 27000
                        ),
                        buildSingleItem(
                          context: context,
                          images: "assets/images/cappucino.png",
                          title: "Cappuccino",
                          subTitle: "With Oat Milk",
                          price: 30000
                        ),
                      ],
                    ),
                  ),
                ),
                const Text("Special For You!", style: TextStyle(
                  fontWeight: FontWeight.w400
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildSingleItem(
                              context: context,
                              images: "assets/images/cappucino.png",
                              title: "Cappuccino",
                              subTitle: "With Oat Milk",
                              price: 25000,
                            ),
                            buildSingleItem(
                              context: context,
                              images: "assets/images/cappucino.png",
                              title: "Cappuccino",
                              subTitle: "With Oat Milk",
                              price: 27000
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            buildSingleItem(
                              context: context,
                              images: "assets/images/cappucino.png",
                              title: "Cappuccino",
                              subTitle: "With Oat Milk",
                              price: 25000,
                            ),
                            buildSingleItem(
                              context: context,
                              images: "assets/images/cappucino.png",
                              title: "Cappuccino",
                              subTitle: "With Oat Milk",
                              price: 27000
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
}
