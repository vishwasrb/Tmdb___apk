import 'package:flutter/material.dart';
import 'package:mydemo_app/description.dart';

class Containerw extends StatelessWidget {
  final List popularList;
  const Containerw({super.key, required this.popularList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90, // Provide a fixed height for the widget
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 380,
                    child: ListTile(
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
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            popularList[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            popularList[index]['poster_path'],
                                    description: popularList[index]['overview'],
                                    vote: popularList[index]['vote_average'],
                                    launch_on: popularList[index]
                                        ['release_date'],
                                  )));
                        },
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                    )),
              );
            }));
  }
}
