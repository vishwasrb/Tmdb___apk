import 'package:flutter/material.dart';
import 'package:mydemo_app/View4.dart';

import 'package:mydemo_app/description.dart';
import 'package:mydemo_app/View1.dart';
import 'package:mydemo_app/view2.dart';
import 'package:mydemo_app/view3.dart';
import 'package:mydemo_app/view5.dart';
import 'package:mydemo_app/view6.dart';

class Tvshow extends StatelessWidget {
  final List tvs;
  final List<dynamic> tvlist;
  final List trendinglist;
  final List popularlist;
  const Tvshow({
    super.key,
    required this.tvs,
    required this.tvlist,
    required this.trendinglist,
    required this.popularlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Airing Today",
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => View3(
                                descriptionlist: tvs,
                              )));
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
                itemCount: tvs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: tvs[index]['original_name'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                tvs[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                tvs[index]['poster_path'],
                            description: tvs[index]['overview'],
                            vote: tvs[index]['vote_average'],
                            launch_on: tvs[index]['first_air_date'],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                            tvs[index]['backdrop_path'],
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
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      tvs[index]['original_name'] ?? 'Loding',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      tvs[index]['vote_average'].toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
        Column(
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
                        color: Color.fromARGB(255, 255, 248, 248),
                        fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View4(
                                    descriptionlist: tvlist,
                                  )));
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
                  itemCount: tvlist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: tvlist[index]['name'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                  tvlist[index]['backdrop_path'],
                              posterurl: 'https://image.tmdb.org/t/p/w500' +
                                  tvlist[index]['poster_path'],
                              description: tvlist[index]['overview'],
                              vote: tvlist[index]['vote_average'],
                              launch_on: tvlist[index]['first_air_date'],
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
                              color: const Color.fromARGB(31, 50, 49, 49),
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
                                      color: const Color.fromARGB(
                                          255, 255, 250, 250),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: SizedBox(
                                          height: 180,
                                          width: 140,
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500' +
                                                tvlist[index]['poster_path'],
                                            fit: BoxFit.fill,

                                            // Adjust the image to cover the space
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        tvlist[index]['name'] ?? 'Loding',
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
                                          tvlist[index]['vote_average']
                                              .toString(),
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
        ),
        Column(children: [
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View5(
                                  descriptionlist: trendinglist,
                                )));
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 1,
                            mainAxisExtent: 400,
                            crossAxisSpacing: 1),
                    itemCount: trendinglist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(
                          'https://image.tmdb.org/t/p/w500' +
                              (trendinglist[index]['poster_path'] ?? ''),
                          fit: BoxFit.fill,
                        ),
                        title: Text(
                          trendinglist[index]['name'] ?? 'Loading',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          trendinglist[index]['first_air_date'] ?? 'Loading',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trendinglist[index]['name'],
                                      bannerurl:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              trendinglist[index]
                                                  ['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trendinglist[index]
                                                  ['poster_path'],
                                      description: trendinglist[index]
                                          ['overview'],
                                      vote: trendinglist[index]['vote_average'],
                                      launch_on: trendinglist[index]
                                          ['first_air_date'],
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
        ]),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            ListTile(
              title: const Text("Popular",
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
                        color: Color.fromARGB(255, 255, 248, 248),
                        fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View6(
                                    descriptionlist: popularlist,
                                  )));
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
                  itemCount: popularlist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: popularlist[index]['title'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                  popularlist[index]['backdrop_path'],
                              posterurl: 'https://image.tmdb.org/t/p/w500' +
                                  popularlist[index]['poster_path'],
                              description: popularlist[index]['overview'],
                              vote: popularlist[index]['vote_average'],
                              launch_on: popularlist[index]['release_date'],
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
                              color: const Color.fromARGB(31, 40, 38, 38),
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
                                      color: const Color.fromARGB(
                                          255, 255, 250, 250),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: SizedBox(
                                          height: 180,
                                          width: 140,
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500' +
                                                popularlist[index]
                                                    ['poster_path'],
                                            fit: BoxFit.fill,

                                            // Adjust the image to cover the space
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        popularlist[index]['title'] ?? 'Loding',
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
                                          popularlist[index]['release_date'] ??
                                              'Loding',
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
        )
      ],
    );
  }
}
