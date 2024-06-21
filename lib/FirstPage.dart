import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mydemo_app/Mytextfiled1.dart';

class FirstPage extends StatefulWidget {
  final Function()? onTap;
  const FirstPage({super.key, required this.onTap});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  void onsignUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordcontroller.text == confirmpasswordcontroller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
        Navigator.pop(context);
      } else {
        return showErrormessage("passsword don't match");
      }
    } on FirebaseAuthException catch (e) {
      showErrormessage(e.code);
    }
  }

  void showErrormessage(String message) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "TMDB",
              style: TextStyle(color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: const [
            Icon(Icons.person, color: Colors.white),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              color: Colors.blue,
            )
          ],
          backgroundColor: const Color.fromARGB(255, 2, 19, 44),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 60,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blueAccent, shape: BoxShape.rectangle),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Benefits of being a member",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Find something to watch on your subscribed streaming  \n services",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Log the movies and TV shows you have watched",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Keep track of your favourite movies and TV shows and \n get recommendation from them.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Build and maintain a personal watchlist",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Build custom mixed lists (movies and TV) .",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Take part in movies and TV discussions.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Contribute to, and improve the information in our database.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 125, 122, 122),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Sign up for an account",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Signing up for an account is free and easy.\nFill out the form below to get started.\nJavaScript is required to continue.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 90,
                        width: 390,
                        child: Mytextfield1(
                            controller: emailcontroller,
                            hintText: "Username",
                            obscuretext: false),
                      ),
                      SizedBox(
                        height: 90,
                        width: 390,
                        child: Mytextfield1(
                            controller: passwordcontroller,
                            hintText: "Password (4 Character minimum)",
                            obscuretext: true),
                      ),
                      SizedBox(
                        height: 90,
                        width: 390,
                        child: Mytextfield1(
                            controller: confirmpasswordcontroller,
                            hintText: "Confirm  Password ",
                            obscuretext: true),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'By Clicking the "Sign up" button below, I\ncertify that i have read and agree to the \nTMDB terms of use and privacy policy. ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 50,
                                width: 105,
                                child: ElevatedButton(
                                    onPressed: onsignUp,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ))),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ]),
        ));
  }
}
