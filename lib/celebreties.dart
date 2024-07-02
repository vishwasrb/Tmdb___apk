import 'package:flutter/material.dart';
import 'package:mydemo_app/view3.dart';
import 'package:mydemo_app/api2.dart';
import 'package:mydemo_app/api3.dart';
import 'package:mydemo_app/description.dart';
import 'package:mydemo_app/description1.dart';
import 'package:mydemo_app/description2.dart';
import 'package:mydemo_app/View1.dart';
import 'package:mydemo_app/view2.dart';
import 'package:mydemo_app/personmodel.dart';
import 'package:mydemo_app/similermodel.dart';
import 'package:mydemo_app/view7.dart';

class Celebrities extends StatefulWidget {
  final List peoplelist;
  final List similar;

  const Celebrities(
      {super.key, required this.peoplelist, required this.similar});

  @override
  State<Celebrities> createState() => _CelebritiesState();
}

class _CelebritiesState extends State<Celebrities> {
  Personmodel? personmodel;
  // Similermodel? similermodel;
  final Api2 api2 = Api2();
  // final Api3 api3 = Api3();

  @override
  void initState() {
    super.initState();
    if (widget.peoplelist.isNotEmpty) {
      detail(widget.peoplelist.first['id']);
    }
  }

  void detail(int personID) {
    api2.getsearchpeople(personID).then((results) {
      setState(() {
        personmodel = results;
      });
    }).catchError((error) {
      print('Error fetching person details: $error');
    });
  }

  // void details(int movieId) {
  //   api3.getSimilar(movieId).then((results) {
  //     setState(() {
  //       similermodel = results;
  //     });
  //   }).catchError((error) {
  //     print('Error fetching similar details: $error');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text(
            "Popular",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "see all",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 248, 248),
                  fontSize: 12,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => View7(
                                descriptionlist: widget.peoplelist,
                              )));
                },
                icon: const Icon(Icons.chevron_right),
                color: const Color.fromARGB(255, 251, 244, 244),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 600, // Provide a fixed height for the widget
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 160,
              mainAxisSpacing: 1,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.peoplelist.length,
            itemBuilder: (context, index) {
              final person = widget.peoplelist[index];
              final profilePath = person['profile_path'];
              final imageUrl = profilePath != null
                  ? 'https://image.tmdb.org/t/p/w500$profilePath'
                  : 'https://via.placeholder.com/150'; // Placeholder image URL

              return GestureDetector(
                onTap: () {
                  detail(person['id']);
                  if (personmodel != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description2(
                          name: personmodel!.name,
                          posterurl:
                              'https://image.tmdb.org/t/p/w500${personmodel!.profilePath}',
                          placeofbirth: personmodel!.placeOfBirth,
                          known_of_department: personmodel!.knownForDepartment,
                          popularcel: widget.similar,
                          birthdate: personmodel!.birthday,
                          bio: personmodel!.biography,
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 240,
                        width: 150,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                personmodel?.name ?? 'No Deathday Information',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  personmodel!.knownForDepartment,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 145, 142, 142),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          children: [
            ListTile(
              title: const Text(
                "Top Rated",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "see all",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 248, 248),
                      fontSize: 12,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View1(
                                    descriptionlist: widget.similar,
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
                      itemCount: widget.similar.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                (widget.similar[index]['poster_path'] ?? ''),
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            widget.similar[index]['title'] ?? 'Loading',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            widget.similar[index]['type'] ?? 'Loading',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: widget.similar[index]['title'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                widget.similar[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                widget.similar[index]
                                                    ['poster_path'],
                                        description: widget.similar[index]
                                            ['overview'],
                                        vote: widget.similar[index]
                                            ['vote_average'],
                                        launch_on: widget.similar[index]
                                            ['release_date'],
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
          ],
        ),
      ],
    );
  }
}
