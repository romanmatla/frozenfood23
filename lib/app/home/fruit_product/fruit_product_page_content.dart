import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FruitProductPageContent extends StatelessWidget {
  const FruitProductPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 177, 199),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Vec.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Frozen food',
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Owoce',
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.w400)),
                        ),
                        Expanded(
                          child: StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                              stream: FirebaseFirestore.instance
                                  .collection('product')
                                  .where('categories', isEqualTo: 'Owoce')
                                  .snapshots()
                                  .where((event) => true),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Text(
                                      'wystąpił nieoczekiwany problem');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text(
                                      'Proszę czekać, ładuję dane');
                                }

                                final documents = snapshot.data!.docs;

                                return ListView(
                                  children: [
                                    for (final document in documents) ...[
                                      ProductWidget(
                                          document['name'],
                                          document['date added'],
                                          document['expiration date']),
                                    ],
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          fixedSize: const Size(60, 60),
                        ),
                        child: const Icon(Icons.arrow_back_sharp, size: 30),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget(
    this.title,
    this.dataAdded,
    this.expirationDate, {
    super.key,
  });

  final String title;
  final String dataAdded;
  final String expirationDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey[50],
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
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 2, 84, 151),
                        Color.fromARGB(255, 20, 146, 248),
                      ],
                      transform: GradientRotation(20),
                    ),
                    // color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.fastfood_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(title,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Data dodania:',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          dataAdded,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Termin ważności: ',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          expirationDate,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const Icon(
            //   Icons.keyboard_arrow_right_outlined,
            //   color: Colors.black45,
            //   size: 30,
            // ),
          ],
        ),
      ),
    );
  }
}
