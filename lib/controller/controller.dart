import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

double? mHeight;
double? mWidth;

List countList = [];
List product = [];
List myCart = [];
List myCount = [];

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  print(docs);
  yield docs;
}

Future<void> getCart() async {
  final ref =
      await FirebaseFirestore.instance.collection('cart').doc('myCart').get();
  if (ref.exists) {
    myCart = ref['product'];
    myCount = ref['count'];
  }

  print(myCart);
}
