import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyRefrigeratorPageContent extends StatelessWidget {
  const MyRefrigeratorPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('product').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('wystąpił nieoczekiwany problem');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Proszę czekać, ładuję dane');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Text(document['name']),
              ],
            ],
          );
        });
  }
}