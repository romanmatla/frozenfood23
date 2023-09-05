import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/features/home/tips/cubit/tips_cubit.dart';
import 'package:frozen_food/app/features/home/articles/articles_page.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../injecton_container.dart';

class TipsPageContent extends StatelessWidget {
  const TipsPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Vec.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'Mrozimy',
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
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Mrożenie to jeden z najpopularniejszych sposobów na przechowywanie żywności',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Aby mrożenie było skuteczne i bezpieczne, należy przestrzegać kilku podstawowych zasad.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: BlocProvider<TipsCubit>(
                          create: (context) {
                            return getIt()
                            ..start(title: '???');
                          },
                          child: BlocBuilder<TipsCubit, TipsState>(
                            builder: (context, state) {
                              switch (state.status) {
                                case Status.initial:
                                  return const Center(
                                    child: Text('Initial state'),
                                  );
                                case Status.loading:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                case Status.success:
                                  // final tipsModel = state.result;

                                  return ListView(
                                    children: [
                                      for (final tipsModel in state.result) ...[
                                        _TipsItemWidget(
                                          model: tipsModel,
                                        ),
                                      ],
                                    ],
                                  );

                                case Status.error:
                                  return const Center(
                                    child: Text('error'),
                                  );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TipsItemWidget extends StatelessWidget {
  const _TipsItemWidget({
    super.key,
    required this.model,
  });

  final TipsModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ArticlesPageContent(author: model)));
      },
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
                CircleAvatar(
                  backgroundImage: NetworkImage(model.picture),
                  radius: 30,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      model.title,
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
