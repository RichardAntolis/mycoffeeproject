import 'package:flutter/material.dart';
import 'package:mycoffee/screens/category.dart';
import 'package:mycoffee/screens/checkout.dart';
import 'package:mycoffee/screens/detailscreen.dart';
import 'package:mycoffee/screens/home.dart';
import 'package:mycoffee/screens/homescreen.dart';
import 'package:mycoffee/screens/menubar.dart';
import 'package:mycoffee/screens/test.dart';
import 'screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
  apiKey: 'AIzaSyBDX7dcRB_0vh230eixygnBi2JSto-z7M4', 
  appId: '1:813636585639:ios:bd1f2a24efedd525d43382', 
  messagingSenderId: '813636585639', 
  projectId: 'mycoffee-f5173'));
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCoffee',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
