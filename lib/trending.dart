import 'package:flutter/material.dart';
import 'package:mydemo_app/view3.dart';
import 'package:mydemo_app/description.dart';
import 'package:mydemo_app/View1.dart';
import 'package:mydemo_app/view2.dart';

class Trend extends StatelessWidget {
  final List trend;
  const Trend({super.key, required this.trend});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Trending",
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
                    builder: (context) => View2(descriptionlist: trend),
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
              itemCount: trend.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trend[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              trend[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              trend[index]['poster_path'],
                          description: trend[index]['overview'],
                          vote: trend[index]['vote_average'],
                          launch_on: trend[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 270,
                        width: 160,
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          color: const Color.fromARGB(31, 43, 42, 42),
                          margin: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          elevation: 1,
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color:
                                      const Color.fromARGB(255, 255, 250, 250),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: SizedBox(
                                      height: 180,
                                      width: 140,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trend[index]['poster_path'],
                                        fit: BoxFit.fill,

                                        // Adjust the image to cover the space
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    trend[index]['title'] ?? 'Loding',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      trend[index]['media_type'] ?? 'Loding',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 145, 142, 142),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class Description3 {}
