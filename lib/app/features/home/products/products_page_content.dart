import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductsPageContent extends StatelessWidget {
  const ProductsPageContent({
    super.key,
    required this.categories,
  });

  final String categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 177, 199),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Vec.png'),
            fit: BoxFit.cover,
          ),
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
                        child: Text(
                          categories,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('product')
                                  .where('categories', isEqualTo: categories)
                                  .snapshots()
                                  .where((event) => true),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Wystąpił problem');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text('Trwa ładowanie danych');
                                }

                                final documents = snapshot.data!.docs;

                                return ListView(
                                  children: [
                                    for (final document in documents) ...[
                                      Dismissible(
                                        key: ValueKey(document.id),
                                        background: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.orange[200],
                                          ),
                                          child: const Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 32.0,
                                              ),
                                              child: Icon(
                                                Icons.delete,
                                              ),
                                            ),
                                          ),
                                        ),
                                        confirmDismiss: (direction) async {
                                          return direction ==
                                              DismissDirection.endToStart;
                                        },
                                        onDismissed: (_) {
                                          FirebaseFirestore.instance
                                              .collection('product')
                                              .doc(document.id)
                                              .delete();
                                        },
                                        child: ProductWidget(
                                          document['name'],
                                          document['date added'],
                                          document['expiration date'],
                                          document['quantity'],
                                        ),
                                      ),
                                    ],
                                    Container(
                                      color: Colors.amber,
                                      padding: const EdgeInsets.all(15),
                                      child: const Text(
                                        'jakiś tekst',
                                      ),
                                    ),
                                    Container(
                                      color: Colors.amber,
                                      padding: const EdgeInsets.all(15),
                                      child: const Text(
                                        'jakiś tekst',
                                      ),
                                    ),
                                    const Text('coś'),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('nowe produkty12'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //przycisk cofania
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        fixedSize: const Size(60, 60),
                      ),
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  ProductWidget(
    this.title,
    this.dataAdded,
    this.expirationDate,
    this.quantity, {
    super.key,
  });

  final String title;
  final Timestamp dataAdded;
  final Timestamp expirationDate;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = expirationDate;
    DateTime dateTime = timestamp.toDate();

    Timestamp timestampAdd = dataAdded;
    DateTime dateAdd = timestampAdd.toDate();

    String releaseDateFormatted() {
      return DateFormat.yMd().format(dateTime);
    }

    String releaseAddDateFormatted() {
      return DateFormat.yMd().format(dateAdd);
    }

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
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                          ),
                          child: const Icon(
                            Icons.grass,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Center(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                title,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Data dodania:',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          releaseAddDateFormatted(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.black45,
                          size: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              'Ilość:',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              quantity,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Termin ważności: ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          releaseDateFormatted(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
