import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/features/home/articles/cubit/article_cubit.dart';
import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../injecton_container.dart';

class ArticlesPageContent extends StatelessWidget {
  const ArticlesPageContent({
    super.key,
    required this.author,
  });

  final TipsModel author;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Artykuły')),
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
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(author.picture),
                  radius: 35,
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                author.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: BlocProvider<ArticleCubit>(
                          create: (context) =>
                              getIt()..fetchData(categorysId: author.id),
                          child: BlocBuilder<ArticleCubit, ArticleState>(
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
                                  if (state.results.isEmpty) {
                                    return const Center(
                                        child: Text('No articles found'));
                                  }

                                  return ListView(
                                    children: [
                                      for (final article in state.results) ...[
                                        _ArticleItemWidget(model: article),
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

class _ArticleItemWidget extends StatelessWidget {
  const _ArticleItemWidget({
    super.key,
    required this.model,
  });

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
            Expanded(
              child: Text(
                model.content,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
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
