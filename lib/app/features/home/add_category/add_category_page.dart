import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({
    required this.newCategory,
    super.key,
  });

  // final TextEditingController newCategory;
  final String newCategory;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  var newCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj kategorię'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Nowa KATEGORIA',
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: 'Wpisz nazwę dodawanej kategorii',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 150, 191, 224)),
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
                onChanged: ((newValue) {
                  setState(() {
                    newCategory = newValue;
                  });
                }),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text(
                'Dodaj kategorię',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
