import 'package:flutter/material.dart';
import 'package:frozen_food/app/features/home/products/products_page_content.dart';
import 'package:frozen_food/app/features/home/fruit_product/fruit_product_page_content.dart';
import 'package:frozen_food/app/features/home/vegetables/vegetables_page_content.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRefrigeratorPageContent extends StatelessWidget {
  MyRefrigeratorPageContent({
    super.key,
  });

  var capacity = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Moja lodówka',
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
                          Icons.ac_unit,
                          size: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              'Zawartość lodówki',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Slider',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductsPageContent(),
                              ),
                            );
                          },
                          child: const CategoryWidget('Warzywa'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FruitProductPageContent(),
                              ),
                            );
                          },
                          child: const CategoryWidget('Owoce'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => VegetablesPageContent(
                                  categories: '',
                                ),
                              ),
                            );
                          },
                          child: const CategoryWidget('Lody'),
                        ),
                        const CategoryWidget('Mięso'),
                        const CategoryWidget('Lody'),
                        const CategoryWidget('Pieczywo'),
                        const CategoryWidget('Dania gotowe'),
                        const CategoryWidget('Inne'),
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

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (title == 'Mięso')
                          const Icon(
                            Icons.home_mini,
                            color: Colors.white,
                            size: 30,
                          ),
                        if (title == 'Warzywa')
                          const Icon(
                            Icons.wb_twighlight,
                            color: Colors.white,
                            size: 30,
                          ),
                        if (title == 'Owoce')
                          const Icon(
                            Icons.grass,
                            color: Colors.white,
                            size: 30,
                          ),
                        if (title == 'Pieczywo')
                          const Icon(
                            Icons.bakery_dining,
                            color: Colors.white,
                            size: 30,
                          ),
                        if (title == 'Inne')
                          const Icon(
                            Icons.dinner_dining,
                            color: Colors.white,
                            size: 30,
                          ),
                        if (title == 'Dania gotowe')
                          const Icon(
                            Icons.fastfood_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        if (title == 'Lody')
                          const Icon(
                            Icons.icecream_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}
