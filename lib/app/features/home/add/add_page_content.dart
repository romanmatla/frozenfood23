import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPageContent extends StatelessWidget {
  AddPageContent({
    super.key,
    required this.categories,
  });

  final String categories;
  final controllerName = TextEditingController();
  final controllerQuantity = TextEditingController();

  var dateTime;
  var timeStamp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 151, 236),
        elevation: 4,
        title: const Text('Dodaj produkt'),
        actions: [
          IconButton(
            onPressed: controllerName == null || controllerQuantity == null
                ? null
                : () {
                    FirebaseFirestore.instance.collection('product').add(
                      {
                        'name': controllerName.text,
                        'categories': categories,
                        'date added': 'data dodania',
                        'expiration date': 'data ważności',
                        'quantity': controllerQuantity.text,
                      },
                    );
                    Navigator.of(context).pop();
                  },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
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
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Frozen food1',
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
                child: ListView(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categories,
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Uzupełnij pola',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: controllerName,
                              decoration: const InputDecoration(
                                labelText: 'Produkt',
                                labelStyle: TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 47, 151, 236),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 248, 134, 3),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: controllerQuantity,
                              decoration: const InputDecoration(
                                labelText: 'Ilość',
                                labelStyle: TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 47, 151, 236),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 248, 134, 3),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          const Text('to'),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ElevatedButton(
                          //     onPressed: () async {
                          //       final selectedDate = await showDatePicker(
                          //         context: context,
                          //         initialDate: DateTime.now(),
                          //         firstDate: DateTime.now(),
                          //         lastDate: DateTime.now().add(
                          //           const Duration(days: 365 * 3),
                          //         ),
                          //       )
                          //           // .then((value) {
                          //           //   setState(
                          //           //     () {
                          //           //       dateTime = value!;
                          //           //     },
                          //           //   );
                          //           // })
                          //           ;
                          //       // if (selectedDate == null) return;
                          //       // setState(() {
                          //       //   expirationDate = selectedDate.toString();
                          //       // });
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       padding: const EdgeInsets.all(20),
                          //       textStyle: const TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.black,
                          //       ),
                          //       backgroundColor: Colors.white,
                          //       side: const BorderSide(
                          //           color: Color.fromARGB(255, 71, 167, 245),
                          //           width: 1),
                          //       foregroundColor:
                          //           const Color.fromARGB(255, 72, 166, 243),
                          //     ),
                          //     child: const Text('Dodaj datę ważności'),
                          //   ),
                          // ),
                        ],
                      ),
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