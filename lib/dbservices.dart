import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference coffee = FirebaseFirestore.instance.collection("featuredCoffee");
CollectionReference noncoffee = FirebaseFirestore.instance.collection("featurednoncoffee");
CollectionReference food = FirebaseFirestore.instance.collection("featuredfood");
CollectionReference drink = FirebaseFirestore.instance.collection("drink");
CollectionReference snack = FirebaseFirestore.instance.collection("featuredsnack");
CollectionReference featured = FirebaseFirestore.instance.collection("featured");

class Database {
  static Stream<QuerySnapshot> getCoffee() {
    return coffee.snapshots();
  }
  static Stream<QuerySnapshot> getNonCoffee() {
    return noncoffee.snapshots();
  }
  static Stream<QuerySnapshot> getFood() {
    return food.snapshots();
  }
  static Stream<QuerySnapshot> getDrink() {
    return drink.snapshots();
  }
  static Stream<QuerySnapshot> getSnack() {
    return snack.snapshots();
  }
  static Stream<QuerySnapshot> getFeatured() {
    return featured.snapshots();
  }
}
