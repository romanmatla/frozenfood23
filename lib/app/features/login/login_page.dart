import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              colors: [Color.fromARGB(255, 248, 194, 245), Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 150),
                  Center(
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isCreatingAccount == true
                                  ? 'Rejestracja'
                                  : 'Logowanie',
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 60),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                            const SizedBox(height: 30),
                            Text(errorMessage),
                            const SizedBox(height: 30),
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                              255, 143, 142, 140),
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
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (isCreatingAccount == true) {
                                        //rejestracja

                                        try {
                                          await FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                                  email: widget
                                                      .emailController.text,
                                                  password: widget
                                                      .paswordController.text);
                                        } catch (error) {
                                          setState(() {
                                            errorMessage = error.toString();
                                          });
                                        }
                                      } else {
                                        // logowanie

                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: widget
                                                      .emailController.text,
                                                  password: widget
                                                      .paswordController.text);
                                        } catch (error) {
                                          setState(() {
                                            errorMessage = error.toString();
                                          });
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      fixedSize: const Size(60, 60),
                                    ),
                                    child: const Icon(Icons.arrow_forward_sharp,
                                        size: 36),
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
