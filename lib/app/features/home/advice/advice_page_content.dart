import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvicePageContent extends StatelessWidget {
  const AdvicePageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Vec.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'Mrozimy',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Mrożenie to jeden z najpopularniejszych sposobów na przechowywanie żywności',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Aby mrożenie było skuteczne i bezpieczne, należy przestrzegać kilku podstawowych zasad.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('topic')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Wystąpił problem');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text('trwa ładowanie');
                              }

                              final documents = snapshot.data!.docs;

                              return ListView(
                                children: [
                                  for (final document in documents) ...[
                                    _AdviceItemWidget(document['title']),
                                  ],
                                  // jak mrozić
                                  //       Row(
                                  //         children: [
                                  //           const Image(
                                  //             image: AssetImage('images/mroz.png'),
                                  //             width: 50,
                                  //           ),
                                  //
                                  // czas przechowywania
                                  //       Row(
                                  //         children: [
                                  //           const Padding(
                                  //             padding: EdgeInsets.all(8.0),
                                  //             child: Image(
                                  //               image: AssetImage('images/kleps.png'),
                                  //               height: 60,
                                  //             ),
                                  //           ),
                                  //
                                  // O mrożeniu żywności
                                  //
                                  //       Row(
                                  //         children: [
                                  //           const Image(
                                  //             image: AssetImage('images/info.png'),
                                  //             width: 60,
                                  //           ),
                                  //
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdviceItemWidget extends StatelessWidget {
  const _AdviceItemWidget(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(4.0, 4.0),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('images/rozmr.png'),
                width: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.black45,
            size: 30,
          ),
        ],
      ),
    );
  }
}
