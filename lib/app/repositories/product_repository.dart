import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frozen_food/app/models/product_model.dart';

class ProductRepository {
  Stream<List<ProductModel>> getProductStream({required String categories}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('product')
        .where('categories', isEqualTo: categories)
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return ProductModel(
              id: doc.id,
              title: doc['name'],
              dataAdded: (doc['date added'] as Timestamp).toDate(),
              expirationDate: (doc['expiration date'] as Timestamp).toDate(),
              quantity: doc['quantity'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> delete({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('product')
        .doc(id)
        .delete();
  }

  Future<void> add(
    String controllerName,
    String categories,
    DateTime today,
    DateTime dateTime,
    String controllerQuantity,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('product')
        .add(
      {
        'name': controllerName,
        'categories': categories,
        'date added': today,
        'expiration date': dateTime,
        'quantity': controllerQuantity
      },
    );
  }
}
