import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/features/home/products/cubit/products_cubit.dart';
import 'package:frozen_food/app/features/home/widgets/product_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsPageContent extends StatelessWidget {
  const ProductsPageContent({
    super.key,
    required this.categories,
  });

  final String categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 177, 199),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Vec.png'),
            fit: BoxFit.cover,
          ),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categories,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: BlocProvider(
                            create: (context) =>
                                ProductsCubit()..start(categories: categories),
                            child: BlocBuilder<ProductsCubit, ProductsState>(
                              builder: (context, state) {
                                if (state.errorMessage.isNotEmpty) {
                                  return const Center(
                                      child: Text('Wystąpił problem'));
                                }
                                if (state.isLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                final documents = state.documents;

                                return ListView(
                                  children: [
                                    for (final document in documents) ...[
                                      Dismissible(
                                        key: ValueKey(document.id),
                                        background: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.orange[200],
                                          ),
                                          child: const Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 32.0,
                                              ),
                                              child: Icon(
                                                Icons.delete,
                                              ),
                                            ),
                                          ),
                                        ),
                                        confirmDismiss: (direction) async {
                                          return direction ==
                                              DismissDirection.endToStart;
                                        },
                                        onDismissed: (_) {
                                          context
                                              .read<ProductsCubit>()
                                              .remove(documentID: document.id);
                                        },
                                        child: ProductWidget(
                                          document['name'],
                                          document['date added'],
                                          document['expiration date'],
                                          document['quantity'],
                                        ),
                                      ),
                                    ],
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('nowe produkty'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //przycisk cofania
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
