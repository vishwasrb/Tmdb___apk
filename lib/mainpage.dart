import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydemo_app/auth.dart';
import 'package:mydemo_app/textmodifiyer.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final user = FirebaseAuth.instance.currentUser;
  void detector() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 31, 52, 31),
          title: SizedBox(
            height: 130,
            width: 280,
            child: Column(
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Textmodifier(
                    text:
                        "You are not signed in. Please sign into to your TMDB Account.",
                    color: Colors.white,
                    size: 16,
                  ),
                )),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Textmodifier(
                        text: "Ok",
                        color: Colors.white,
                        size: 14,
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
              width: 100,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 255, 8),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  user?.email ?? "Default Account",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Column(
        children: [
          SizedBox(
            height: 40,
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AuthPage(),
                ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 244, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: const Text(
                "Sign In / Sign Up",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: detector,
                    child: Image.asset(
                      'assets/heart-regular.png',
                      color: const Color.fromARGB(255, 0, 255, 8),
                    ),
                  ),
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Favourite",
                    style: TextStyle(color: Color.fromARGB(255, 0, 255, 8)),
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Your favourite Movies & Tv show",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              height: 40,
              child: GestureDetector(
                onTap: detector,
                child: Image.asset(
                  'assets/bookmark-regular.png',
                  color: const Color.fromARGB(255, 0, 255, 8),
                ),
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Watchlist",
                style: TextStyle(color: Color.fromARGB(255, 0, 255, 8)),
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Movie and TvShows Added to watchlist ",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              height: 40,
              child: GestureDetector(
                onTap: detector,
                child: Image.asset(
                  'assets/star-regular.png',
                  color: const Color.fromARGB(255, 0, 255, 8),
                ),
              ),
            ),
            title: const Text(
              "Rating",
              style: TextStyle(color: Color.fromARGB(255, 0, 255, 8)),
            ),
            subtitle: const Text(
              "Rated Moives & Tv Shows",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              height: 40,
              child: GestureDetector(
                onTap: detector,
                child: Image.asset(
                  'assets/circle-half-stroke-solid.png',
                  color: const Color.fromARGB(255, 0, 255, 8),
                ),
              ),
            ),
            title: const Text(
              "Appearances",
              style: TextStyle(color: Color.fromARGB(255, 0, 255, 8)),
            ),
            subtitle: const Text(
              "Set Light & Dark Theme",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: ElevatedButton(
              onPressed: () {
                logout();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 255, 8)),
              child: const Textmodifier(
                text: "Log Out",
                color: Color.fromARGB(255, 0, 0, 0),
                size: 14,
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
