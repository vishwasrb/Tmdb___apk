import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo_app/MytextField.dart';
import 'package:mydemo_app/homepagee.dart';
import 'package:mydemo_app/login_bloc.dart';

class Mainlogin extends StatelessWidget {
  final Function()? onTap;
  const Mainlogin({Key? key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginpageConsumer(onTap: onTap),
    );
  }
}

class LoginpageConsumer extends StatelessWidget {
  final Function()? onTap;
  LoginpageConsumer({Key? key, required this.onTap}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print('here');
          if (state.logincompleted) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        listenWhen: (previous, current) {
          return current.logincompleted;
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 0),
                        Image.asset(
                          'images/image.png',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Mytextfield(
                            controller: emailController,
                            hintText: 'Email',
                            obscuretext: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Mytextfield(
                            controller: passwordController,
                            hintText: 'Password',
                            obscuretext: true,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: SizedBox(
                            height: 60,
                            width: 320,
                            child: ElevatedButton(
                              onPressed: () {
                                signUserIn(context); // Corrected here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 251, 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text(
                                "SIGN IN",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: onTap,
                                child: const Text(
                                  " SIGN UP ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 255, 8),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'OR',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: SizedBox(
                            height: 60,
                            width: 360,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 255, 8),
                              ),
                              child: const Text(
                                "CONTINUE",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> signUserIn(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrormessage(context, e.code);
    }
  }

  void showErrormessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          title: Center(child: Text(message.toUpperCase())),
        );
      },
    );
  }
}
