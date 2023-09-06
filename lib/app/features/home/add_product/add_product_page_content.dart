import 'package:flutter/material.dart';
import 'package:frozen_food/app/features/home/add/add_page_content.dart';
import 'package:frozen_food/app/features/home/add_product/add_product_widget/add_product_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductPageContent extends StatelessWidget {
  const AddProductPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            'Moja lodówka',
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
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Dodaj produkt',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.add_circle_outline,
                          size: 60,
                        ),
                        Text(
                          'Wybierz kategorię',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        buildCategoryWidget('Warzywa'),
                        buildCategoryWidget('Owoce'),
                        buildCategoryWidget('Mięso'),
                        buildCategoryWidget('Dania gotowe'),
                        buildCategoryWidget('Pieczywo'),
                        buildCategoryWidget('Lody'),
                        buildCategoryWidget('Inne'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildCategoryWidget(String category) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddPageContent(categories: category),
          ),
        );
      },
      child: AddCategoryWidget(category),
    );
  });
}
