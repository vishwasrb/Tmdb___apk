import 'package:flutter/material.dart';
import 'package:mydemo_app/description.dart';
import 'package:mydemo_app/View1.dart';
import 'package:mydemo_app/view2.dart';

class Playing extends StatelessWidget {
  final List play;
  const Playing({super.key, required this.play});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: const Text("Playing In Theaters",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "see all",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 248, 248), fontSize: 12),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => View2(descriptionlist: play),
                ));
              },
              icon: const Icon(Icons.chevron_right),
              color: const Color.fromARGB(255, 251, 244, 244),
            ),
          ],
        ),
      ),
      SizedBox(
          height: 300, // Provide a fixed height for the widget
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: play.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: play[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              play[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              play[index]['poster_path'],
                          description: play[index]['overview'],
                          vote: play[index]['vote_average'],
                          launch_on: play[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          color: const Color.fromARGB(255, 244, 244, 244),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          elevation: 0,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: SizedBox(
                                    height: 180,
                                    width: 260,
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500' +
                                          play[index]['backdrop_path'],
                                      fit: BoxFit.fill,

                                      // Adjust the image to cover the space
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  play[index]['title'] ?? 'Loding',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }))
    ]);
  }
}
