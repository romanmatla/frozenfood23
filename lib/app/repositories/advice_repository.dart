// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:frozen_food/app/models/advice_mode.dart';

// class AdviceRepository {
//   Stream<List<AdviceModel>> getAdviceStream() {
//     return FirebaseFirestore.instance
//         .collection('topic')
//         .snapshots()
//         .map((querySnapshot) {
//       return querySnapshot.docs.map(
//         (doc) {
//           return AdviceModel(
//             title: doc['title'],
//           );
//         },
//       ).toList();
//     });
//   }
// }
