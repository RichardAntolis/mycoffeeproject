import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycoffee/screens/login.dart';

import '../models/usermodel.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    final detailProfile = Container(
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Text(
                  "${loggedInUser.email}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );

    final logoutButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: Colors.brown,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          logout(context);
        },
        child: Text(
          "Log Out",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Color(0xffEBDBCC),
      body: ListView(
        children: [
          SizedBox(height: 12.0),
          Container(
            child: Row(children: [
              detailProfile,
              SizedBox(height: 12.0),
            ]),
          )
        ],
      ),
    );

    //Nama
    //Nama2
    //Email
    //Logout Button
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
