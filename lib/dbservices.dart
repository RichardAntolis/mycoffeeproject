import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference coffee = FirebaseFirestore.instance.collection("featuredCoffee");

class Database {
  static Stream<QuerySnapshot> getData() {
    return coffee.snapshots();
  }
}
