import 'package:flutter/material.dart';

import 'package:mydemo_app/description.dart';
import 'package:mydemo_app/View1.dart';

class MovieCard extends StatelessWidget {
  final List popularList;

  const MovieCard({Key? key, required this.popularList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: const Text("Top Rated",
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
                  builder: (context) => View1(descriptionlist: popularList),
                ));
              },
              icon: const Icon(Icons.chevron_right),
              color: const Color.fromARGB(255, 251, 244, 244),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1,
                    mainAxisExtent: 400,
                    crossAxisSpacing: 1),
                itemCount: popularList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          (popularList[index]['poster_path'] ?? ''),
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      popularList[index]['title'] ?? 'Loading',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      popularList[index]['type'] ?? 'Loading',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Description(
                                  name: popularList[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      popularList[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      popularList[index]['poster_path'],
                                  description: popularList[index]['overview'],
                                  vote: popularList[index]['vote_average'],
                                  launch_on: popularList[index]['release_date'],
                                )));
                      },
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
