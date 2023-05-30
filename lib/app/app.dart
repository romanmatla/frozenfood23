import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/cubit/root_cubit.dart';
import 'package:frozen_food/app/features/home/home_page.dart';
import 'package:frozen_food/app/features/login/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frozen_Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage(
            user: user,
            categories: '',
          );
        },
      ),
    );
  }
}
