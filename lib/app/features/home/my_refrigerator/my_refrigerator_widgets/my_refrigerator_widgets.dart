import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
