import 'package:flutter/material.dart';
import 'package:mycoffee/categories/coffee.dart';
import 'package:mycoffee/categories/drink.dart';
import 'package:mycoffee/categories/food.dart';
import 'package:mycoffee/categories/noncoffee.dart';
import 'package:mycoffee/categories/snack.dart';
import 'package:mycoffee/screens/detailscreen.dart';
import 'package:mycoffee/screens/home.dart';
import 'package:mycoffee/screens/homescreen.dart';

class CategoriesRoute extends StatefulWidget {
  const CategoriesRoute({Key? key}) : super(key: key);

  @override
  State<CategoriesRoute> createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  int _selectedIndex = 0;
  List<MyCategory> myCategory = [
    MyCategory('Coffee'),
    MyCategory('Non-Coffee'),
    MyCategory('Food'),
    MyCategory('Drink'),
    MyCategory('Snacks')
  ];

  static List<Widget> _widgetOption = <Widget>[
    Coffee(),
    noncoffeeroute(),
    foodroute(),
    DrinkRoute(),
    snackroute()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBDBCC),
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text(
                            "Coffee",
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => Coffee())));
                          })
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text(
                            "Non-Coffee",
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => noncoffeeroute())));
                          })
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text(
                            "Food",
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => foodroute())));
                          })
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text(
                            "Drink",
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => DrinkRoute())));
                          })
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text(
                            "Snack",
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => snackroute())));
                          })
                    ],
                  ),
                ),
              ],
              // children: myCategory
              //     .map(
              //       (e) => Card(
              //           child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           GestureDetector(
              //               child: Text(
              //                 e.title,
              //                 style: TextStyle(fontSize: 20),
              //               ),
              //               onTap: () {
              //                 Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) => e.page()));
              //               }),
              //         ],
              //       )),
              //     )
              // .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class MyCategory {
  final title;

  MyCategory(this.title);
}
