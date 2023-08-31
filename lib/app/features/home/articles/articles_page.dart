import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/features/home/articles/cubit/article_cubit.dart';
import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/app/repositories/articles_repository.dart';
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlesPageContent extends StatelessWidget {
  const ArticlesPageContent({
    super.key,
    required this.author,
  });

  final ArticleModel author;

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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('images/rozmr.png'),
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Tytuł kategorii',
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
                          create: (context) => ArticleCubit(
                            articleRepository: ArticlesRepository(
                              remoteDataSource: ArticlesMockedDataSource(),
                            ),
                          )..fetchData(authotId: author.id), 
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
                                      for (final author in state.results) ...[
                                        _ArticleItemWidget(model: author),
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
  const _ArticleItemWidget(
    {
    super.key,
    required this.model,
  });

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            child: Row(
              children: [
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        model.content,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          // fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.black45,
            size: 30,
          ),
        ],
      ),
    );
  }
}
