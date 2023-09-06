// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:frozen_food/app/models/product_model.dart';

// class ProductDataSource {
//   ProductDataSource({required this.firebaseFirestore});
  
//   final FirebaseFirestore firebaseFirestore;


//   Stream<List<ProductModel>> getProducts({required String categories}) {
//     return firebaseFirestore
//         .collection('product')
//         .where('categories', isEqualTo: categories)
//         .snapshots()
//         .map(
//       (querySnapshot) {
//         return querySnapshot.docs.map(
//           (doc) {
//             return ProductModel(
//               id: doc.id,
//               title: doc['name'],
//               dataAdded: (doc['date added'] as Timestamp).toDate(),
//               expirationDate: (doc['expiration date'] as Timestamp).toDate(),
//               quantity: doc['quantity'],
//             );
//           },
//         ).toList();
//       },
//     );
//   }


//   Future<void> deleteProduct({required String id}) async {
//     await firebaseFirestore.collection('product').doc(id).delete();
//   }

//   Future<void> addProduct(
//     String controllerName,
//     String categories,
//     DateTime today,
//     DateTime dateTime,
//     String controllerQuantity,
//   ) async {
//     await firebaseFirestore.collection('product').add(
//       {
//         'name': controllerName,
//         'categories': categories,
//         'date added': today,
//         'expiration date': dateTime,
//         'quantity': controllerQuantity
//       },
//     );
//   }
// }