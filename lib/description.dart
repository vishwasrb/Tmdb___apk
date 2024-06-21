import 'package:flutter/material.dart';

import 'package:mydemo_app/textmodifiyer.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, launch_on;
  final double vote;

  const Description(
      {Key? key,
      required this.description,
      required this.name,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
        ),
        title: Textmodifier(text: name, color: Colors.white, size: 24),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      ),
      body: Container(
        child: ListView(children: [
          SizedBox(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Textmodifier(
                      text: '⭐ Average Rating - $vote',
                      color: Colors.white,
                      size: 20,
                    )),
              ])),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: Textmodifier(
                text: name,
                size: 24,
                color: Colors.white,
              )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Textmodifier(
                text: 'Releasing On - $launch_on',
                size: 14,
                color: Colors.white,
              )),
          Row(
            children: [
              SizedBox(
                height: 260,
                width: 140,
                child: Image.network(
                  posterurl,
                ),
              ),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Textmodifier(
                      text: description,
                      size: 16.0,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
