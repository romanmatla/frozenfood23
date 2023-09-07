import 'package:flutter/material.dart';
import 'package:frozen_food/app/features/home/my_refrigerator/my_refrigerator_widgets/my_refrigerator_widgets.dart';
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
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 30,
                          ),
                          child: Image(
                            image: AssetImage('images/ref_icon.png'),
                            width: 50,
                          ),
                        ),
                        // const Icon(
                        //   Icons.ac_unit,
                        //   size: 50,
                        // ),
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


// Moja lodówka/Slider
// class PlaceWidget extends StatelessWidget {
//   const PlaceWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.amber,
//         shape: BoxShape.circle,
//       ),
//       padding: const EdgeInsets.all(40),
//       child: Text(
//         '1',
//         style: GoogleFonts.poppins(
//           fontSize: 24,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }
