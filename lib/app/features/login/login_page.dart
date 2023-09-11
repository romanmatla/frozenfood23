import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frozen_food/app/features/login/cubit/login_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/enums.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final paswordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 245, 219, 243), Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Container(
                      height: 650,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image(
                                    image: AssetImage('images/refrig.png'),
                                    width: 130,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    isCreatingAccount == true
                                        ? 'Rejestracja'
                                        : 'Logowanie',
                                    style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: widget.emailController,
                                    decoration: const InputDecoration(
                                      labelText: 'EMAIL',
                                      labelStyle: TextStyle(color: Colors.blue),
                                      border: OutlineInputBorder(),
                                      // border: InputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 47, 151, 236),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 248, 134, 3),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: widget.paswordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'HASŁO',
                                      labelStyle: TextStyle(
                                        color: Colors.blue,
                                      ),
                                      border: OutlineInputBorder(),
                                      // border: InputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 47, 151, 236),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 248, 134, 3),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(errorMessage),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (isCreatingAccount == false) ...[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isCreatingAccount = true;
                                        });
                                      },
                                      child: Text(
                                        'Rejestracja',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                              255, 88, 88, 86),
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (isCreatingAccount == true) ...[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isCreatingAccount = false;
                                        });
                                      },
                                      child: Text(
                                        'Logowanie',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                              255, 143, 142, 140),
                                        ),
                                      ),
                                    ),
                                  ],
                                  BlocProvider(
                                    create: (context) => LoginCubit(),
                                    child: BlocBuilder<LoginCubit, LoginState>(
                                      builder: (context, state) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (isCreatingAccount == true) {
                                                //rejestracja
                                                // switch (state.status) {
                                                //   case Status.initial:
                                                //     return;
                                                //   case Status.loading:
                                                //     return;
                                                //   case Status.error:
                                                //   case Status.success:
                                                //     return;
                                                // }

                                                try {
                                                  await FirebaseAuth.instance
                                                      .createUserWithEmailAndPassword(
                                                          email: widget
                                                              .emailController
                                                              .text,
                                                          password: widget
                                                              .paswordController
                                                              .text);
                                                } catch (error) {
                                                  setState(() {
                                                    errorMessage =
                                                        error.toString();
                                                  });
                                                }
                                              } else {
                                                // logowanie

                                                try {
                                                  await FirebaseAuth.instance
                                                      .signInWithEmailAndPassword(
                                                          email: widget
                                                              .emailController
                                                              .text,
                                                          password: widget
                                                              .paswordController
                                                              .text);
                                                } catch (error) {
                                                  setState(() {
                                                    errorMessage =
                                                        error.toString();
                                                  });
                                                }
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  12))),
                                              fixedSize: const Size(60, 60),
                                            ),
                                            child: const Icon(
                                                Icons.arrow_forward_sharp,
                                                size: 36),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
