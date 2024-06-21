import 'package:flutter/material.dart';
import 'package:mydemo_app/api.dart';
import 'package:mydemo_app/description.dart';

import 'package:mydemo_app/search_model.dart';

class Searchlist extends StatefulWidget {
  const Searchlist({
    Key? key,
  }) : super(key: key);

  @override
  State<Searchlist> createState() => _SearchlistState();
}

class _SearchlistState extends State<Searchlist> {
  final TextEditingController _searchController = TextEditingController();
  final imageurl = "https://image.tmdb.org/t/p/w500";
  SearchModel? searchModel;
  Api api = Api();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void search(String query) {
    api.getsearchedmoive(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(physics: AlwaysScrollableScrollPhysics(), children: [
          Container(
            color: const Color.fromARGB(31, 180, 170, 170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            searchModel = null;
                          });
                        } else {
                          search(_searchController.text);
                        }
                      }),
                ),
                if (searchModel != null)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1 / 2,
                    ),
                    itemCount: searchModel?.results.length,
                    itemBuilder: (context, int index) {
                      final searching = searchModel!.results[index];
                      final posterpath = searching.posterPath;
                      final String imageUrl =
                          posterpath != null && posterpath.isNotEmpty
                              ? "$imageurl$posterpath"
                              : "https://example.com/placeholder.jpg";
                      return Column(children: [
                        GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Description(
                                    name: searchModel!.results[index].title,
                                    bannerurl: imageUrl,
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500${searchModel?.results[index].posterPath}',
                                    description:
                                        searchModel!.results[index].overview,
                                    vote:
                                        searchModel!.results[index].voteAverage,
                                    launch_on:
                                        searchModel!.results[index].releaseDate,
                                  ),
                                ));
                          },
                          child: Image.network(
                            imageUrl,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Placeholder(
                                  fallbackHeight: 200,
                                  fallbackWidth: 200,
                                  color: Color.fromARGB(255, 41, 41, 41),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          searching.title,
                          style: TextStyle(color: Colors.white),
                        )
                      ]);
                    },
                  ),
              ],
            ),
          ),
        ]));
  }
}
