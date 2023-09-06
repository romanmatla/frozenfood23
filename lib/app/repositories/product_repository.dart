import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frozen_food/app/models/product_model.dart';

class ProductRepository {
  Stream<List<ProductModel>> getProductStream({required String categories}) {
        return FirebaseFirestore.instance
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
    return FirebaseFirestore.instance.collection('product').doc(id).delete();
  }

  Future<void> add(
    String controllerName,
    String categories,
    DateTime today,
    DateTime dateTime,
    String controllerQuantity,
  ) async {
    await FirebaseFirestore.instance.collection('product').add(
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
