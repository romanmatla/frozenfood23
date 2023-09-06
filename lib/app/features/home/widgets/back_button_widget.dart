import 'package:flutter/material.dart';

class BackElevetedButton extends StatelessWidget {
  const BackElevetedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                fixedSize: const Size(60, 60),
              ),
              child: const Icon(
                Icons.arrow_back_sharp,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
