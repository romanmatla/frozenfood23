import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/cubit/root_cubit.dart';

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
          const CircleAvatar(
            backgroundImage: AssetImage('images/user.png'),
            radius: 45,
          ),
          const SizedBox(height: 35),
          Text('jesteś zalogowany jako $email'),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().singOut();
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}
