import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/features/home/add/cubit/add_cubit.dart';
import 'package:frozen_food/app/repositories/product_repository.dart';
import 'package:google_fonts/google_fonts.dart';

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

  DateTime? _dateTime = DateTime.now();
  DateTime today = DateTime.now();

  void _showDatePicker() async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 3),
      ),
    ).then((value) {
      setState(() {
        _dateTime = value;
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
            create: (context) => AddCubit(ProductRepository()),
            child: BlocListener<AddCubit, AddState>(
              listener: (context, state) {
                if (state.saved) {
                  Navigator.of(context).pop();
                }
                if (state.errorMessage == null) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Wystąpił nieoczekiwany problem'),
                  //     backgroundColor: Colors.red,
                  //   ),
                  // );
                }
              },
              child: BlocBuilder<AddCubit, AddState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed:
                        // controllerName == false || controllerQuantity == false
                        //     ? null
                        //     :
                        () {
                      context.read<AddCubit>().add(
                          controllerName.text,
                          widget.categories,
                          today,
                          _dateTime!,
                          controllerQuantity.text);
                      if (_dateTime == null) return;
                    },
                    icon: const Icon(Icons.check),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Vec.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Dodawanie produktu',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 60),
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
                            child: _AddProductWidget(
                                controllerName: controllerName),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _AddQuantityWidget(
                                controllerQuantity: controllerQuantity),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          if (_dateTime == null)
                            const Text(
                              'Nie wybrano daty',
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

class _AddQuantityWidget extends StatelessWidget {
  const _AddQuantityWidget({
    required this.controllerQuantity,
  });

  final TextEditingController controllerQuantity;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerQuantity,
      decoration: const InputDecoration(
        labelText: 'Ilość',
        labelStyle: TextStyle(color: Colors.blue),
        hintText: 'Podaj ile sztuk lub gram',
        hintStyle: TextStyle(color: Color.fromARGB(255, 150, 191, 224)),
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
    );
  }
}

class _AddProductWidget extends StatelessWidget {
  const _AddProductWidget({
    required this.controllerName,
  });

  final TextEditingController controllerName;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 25,
      controller: controllerName,
      decoration: const InputDecoration(
        labelText: 'Produkt',
        labelStyle: TextStyle(color: Colors.blue),
        hintText: 'Podaj nazwę produktu',
        hintStyle: TextStyle(color: Color.fromARGB(255, 150, 191, 224)),
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
    );
  }
}
