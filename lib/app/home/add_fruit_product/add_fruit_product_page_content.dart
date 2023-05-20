import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFruitProductPageContent extends StatefulWidget {
  AddFruitProductPageContent({
    super.key,
  });

  @override
  State<AddFruitProductPageContent> createState() =>
      _AddFruitProductPageContentState();
}

class _AddFruitProductPageContentState
    extends State<AddFruitProductPageContent> {
  // final controller = TextEditingController();

  var categories = '';
  var name = '';
  var dateAdded = '';
  var expirationDate = '';
  var quantity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.arrow_back_sharp, size: 30),
        label: const Text('Cofnij'),

        onPressed: () {
          Navigator.of(context).pop();
        },
        // child: const Icon(Icons.arrow_back_sharp, size: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Owoce',
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w400),
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
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (newValue) {
                                  setState(() {
                                    name = newValue;
                                  });
                                },
                                // controller: controller,
                                decoration: const InputDecoration(
                                  labelText: 'Produkt',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  border: OutlineInputBorder(),
                                  // border: InputBorder(),
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
                                onChanged: (newValue) {
                                  setState(() {
                                    quantity = newValue;
                                  });
                                },
                                // controller: controller,
                                decoration: const InputDecoration(
                                  labelText: 'Ilość',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  border: OutlineInputBorder(),
                                  // border: InputBorder(),
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
                                onChanged: (newValue) {
                                  setState(() {
                                    dateAdded = newValue;
                                  });
                                },
                                // controller: controller,
                                decoration: const InputDecoration(
                                  labelText: 'Data dodania',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  border: OutlineInputBorder(),
                                  // border: InputBorder(),
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
                                onChanged: (newValue) {
                                  setState(() {
                                    expirationDate = newValue;
                                  });
                                },
                                // controller: controller,
                                decoration: const InputDecoration(
                                  labelText: 'Termon ważności',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  border: OutlineInputBorder(),
                                  // border: InputBorder(),
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
                            ElevatedButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('product')
                                    .add(
                                  {
                                    'name': name,
                                    'categories': 'Owoce',
                                    'date added': dateAdded,
                                    'expiration date': expirationDate,
                                    'quantity': quantity,
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                fixedSize: const Size(60, 60),
                              ),
                              child:
                                  const Icon(Icons.arrow_back_sharp, size: 30),
                            ),
                          ],
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     FirebaseFirestore.instance.collection('product').add(
                      //       {
                      //         'name': name,
                      //         'categories': 'Owoce',
                      //         'date added': dateAdded,
                      //         'expiration date': expirationDate,
                      //       },
                      //     );
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     shape: const RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(12))),
                      //     fixedSize: const Size(60, 60),
                      //   ),
                      //   child: const Icon(Icons.arrow_back_sharp, size: 30),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //   ),
            //   child: Row(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(20.0),
            //         child: ElevatedButton(
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //           style: ElevatedButton.styleFrom(
            //             shape: const RoundedRectangleBorder(
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(12))),
            //             fixedSize: const Size(60, 60),
            //           ),
            //           child: const Icon(Icons.arrow_back_sharp, size: 30),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
