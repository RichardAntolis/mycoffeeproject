import 'package:flutter/material.dart';
import 'package:mycoffee/screens/category.dart';
import 'package:mycoffee/screens/checkout.dart';
import 'package:mycoffee/screens/home.dart';
import 'package:mycoffee/screens/homescreen.dart';
import 'package:mycoffee/screens/profile.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({Key? key}) : super(key: key);

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOption = <Widget>[
    HomeRoute(),
    CategoriesRoute(),
    CheckOutL(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xD5C7B7),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.brown,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 30,
              ),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xff877B75),
          selectedItemColor: Color(0xffC69551),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
