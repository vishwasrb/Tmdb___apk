import 'package:flutter/material.dart';

class Moviecard1 extends StatefulWidget {
  const Moviecard1({super.key});

  @override
  State<Moviecard1> createState() => _Moviecard1State();
}

class _Moviecard1State extends State<Moviecard1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            elevation: 0,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 140,
                    width: 250,
                    child: Image.asset(
                      "images/download 1.jpeg",
                      fit: BoxFit.fill,

                      // Adjust the image to cover the space
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 170),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "WAR",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Action/Scifi",
                    style: TextStyle(
                        color: Color.fromARGB(255, 145, 142, 142),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
