// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:frozen_food/app/models/item_model.dart';

// class ItemsRepository {
//   Stream<List<ItemModel>> getItemsStream({required String categories}) {
//     return FirebaseFirestore.instance
//         .collection('product')
//         .where('categories', isEqualTo: categories)
//         .snapshots()
//         .map((querySnapshot) {
//       return querySnapshot.docs.map(
//         (doc) {
//           return ItemModel(
//             id: doc.id,
//             title: doc['name'],
//             dataAdded: doc['date_added'],
//             expirationDate: doc['expiration_date'],
//             quantity: doc['quantity'],
//           );
//         },
//       ).toList();
//     });
//   }

//   Future<void> delete({required String id}) {
    
//      return  FirebaseFirestore.instance.collection('product').doc(id).delete();
//   }

//    Future<void> add(
//     String controllerName,
//     String categories,
//     DateTime today,
//     DateTime dateTime,
//     String controllerQuantity,
//   ) async {
//       await FirebaseFirestore.instance.collection('product').add(
//         {
//           'name': controllerName,
//           'categories': categories,
//           'date added': today,
//           'expiration date': dateTime,
//           'quantity': controllerQuantity
//         },
//       );
//     }
//   }

