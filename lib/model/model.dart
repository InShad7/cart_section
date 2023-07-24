import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  List count;
  List product;

  Cart({required this.count, required this.product});

  
  Future<void> addCartToFirebase() async {
    try {
      final ref =
          FirebaseFirestore.instance.collection('cart').doc('myCart');

      Map<String, dynamic> toMap() {
        return {
          'product': product,
          'count': count,
        };
      }

      await ref.update(toMap());
      print('updated');
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
