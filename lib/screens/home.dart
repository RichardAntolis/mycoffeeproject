import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycoffee/screens/login.dart';
import '../models/usermodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "My Coffee",
      //     style: TextStyle(color: Colors.black,
      //     fontWeight: FontWeight.bold
      //     ),
      //   ),
        
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Color(0xffEBDBCC),
      // ),
      backgroundColor: Color(0xffEBDBCC),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome to My Coffee",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
            Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                    color: Color(0xff141921),
                    borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find your coffee...",
                        hintStyle: TextStyle(color: Color(0xff3c4046)),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[600],
                        )),
                  ),

          )
          ],
        ),
        
      ),
      
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(10),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 150,
  //               child: Image.asset('assets/images/logo.png'),
  //             ),
  //             Text(
  //               "Welcome Back",
  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
  //             style: TextStyle(
  //               color: Colors.black54,
  //               fontWeight: FontWeight.w500
  //             )),
  //             Text("${loggedInUser.email}",
  //             style: TextStyle(
  //               color: Colors.black54,
  //               fontWeight: FontWeight.w500
  //             )),
  //             SizedBox(
  //               height: 15,
  //             ),
  //             ActionChip(label: Text("Logout"), onPressed: () {
  //               logout(context);
  //             } )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  // }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
