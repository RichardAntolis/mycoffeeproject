import 'package:flutter/material.dart';
import 'package:mycoffee/screens/home.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({ Key? key }) : super(key: key);

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOption = <Widget> [
    HomeScreen(),
    Text("Page 2",
    style: optionStyle,
    ),
    Text("Page 3",
    style: optionStyle,
    ),
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