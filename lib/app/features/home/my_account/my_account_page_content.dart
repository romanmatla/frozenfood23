import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/cubit/root_cubit.dart';
import 'package:frozen_food/app/features/home/articles/articles_page.dart';
import 'package:frozen_food/app/models/articles_model.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('jesteś zalogowany jako $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().singOut();
            },
            child: const Text('Wyloguj'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (_) => ArticlesPageContent(author: model)));
          //   },
          //   child: const Text('Artykuł'),
          // ),
        ],
      ),
    );
  }
}
