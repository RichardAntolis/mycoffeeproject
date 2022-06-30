import 'package:flutter/material.dart';
import 'package:mycoffee/screens/detailscreen.dart';
import 'package:mycoffee/screens/home.dart';
import 'package:mycoffee/screens/homescreen.dart';

class CategoriesRoute extends StatefulWidget {
  const CategoriesRoute({Key? key}) : super(key: key);

  @override
  State<CategoriesRoute> createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  int inx = 0;
  List<MyCategory> myCategory = [
    MyCategory('Coffee'),
    MyCategory('Non-Coffee'),
    MyCategory('Food'),
    MyCategory('Drink'),
    MyCategory('Snacks')
  ];

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
              children: myCategory
                  .map(
                    (e) => Card(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            e.title,
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                        ),
                      ],
                    )),
                  )
                  .toList(),
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
