import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/features/home/add/cubit/add_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddPageContent extends StatefulWidget {
  const AddPageContent({
    super.key,
    required this.categories,
  });

  final String categories;

  @override
  State<AddPageContent> createState() => _AddPageContentState();
}

class _AddPageContentState extends State<AddPageContent> {
  final controllerName = TextEditingController();
  final controllerQuantity = TextEditingController();

  var dateTime;
  var timeStamp;

  DateTime _dateTime = DateTime.now();
  DateTime today = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 3),
      ),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 151, 236),
        elevation: 4,
        title: const Text('Dodaj produkt'),
        actions: [
          BlocProvider(
            create: (context) => AddCubit(),
            child: BlocListener<AddCubit, AddState>(
              listener: (context, state) {
                if (state.saved) {
                  Navigator.of(context).pop();
                }
                if (state.errorMessage.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: BlocBuilder<AddCubit, AddState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed:
                        controllerName == false || controllerQuantity == false
                            ? null
                            : () {
                                context.read<AddCubit>().add(
                                    controllerName.text,
                                    widget.categories,
                                    today,
                                    _dateTime,
                                    controllerQuantity.text);
                              },
                    icon: const Icon(Icons.check),
                  );
                },
              ),
            ),
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
                          widget.categories,
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
                          Text(
                            DateFormat.yMd().format(_dateTime),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: _showDatePicker,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 71, 167, 245),
                                    width: 1),
                                foregroundColor:
                                    const Color.fromARGB(255, 72, 166, 243),
                              ),
                              child: const Text('Dodaj datę ważności'),
                            ),
                          ),
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
