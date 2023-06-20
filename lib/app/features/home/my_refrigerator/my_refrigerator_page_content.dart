import 'package:flutter/material.dart';
import 'package:frozen_food/app/features/home/products/products_page_content.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRefrigeratorPageContent extends StatefulWidget {
  const MyRefrigeratorPageContent({
    super.key,
  });

  @override
  State<MyRefrigeratorPageContent> createState() =>
      _MyRefrigeratorPageContentState();
}

class _MyRefrigeratorPageContentState extends State<MyRefrigeratorPageContent> {
  // var capacity = 5;
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
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.ac_unit,
                          size: 50,
                        ),
                        Expanded(
                          child: Column(
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
            builder: (context) => ProductsPageContent(categories: category),
          ),
        );
      },
      child: CategoryWidget(category),
    );
  });
}

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(40),
      child: Text(
        '1',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget(
    this.title, {
    super.key,
  });

  final String title;
  final _iconData = {
    'Mięso': Icons.home_mini,
    'Warzywa': Icons.wb_twighlight,
    'Owoce': Icons.grass,
    'Pieczywo': Icons.bakery_dining,
    'Inne': Icons.dinner_dining,
    'Dania gotowe': Icons.fastfood_outlined,
    'Lody': Icons.icecream_outlined,
  };

  IconData _getIconData(String title) {
    return _iconData[title] ?? Icons.help_outline;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                        Icon(
                          _getIconData(title),
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
